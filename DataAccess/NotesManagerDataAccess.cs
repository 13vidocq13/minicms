using System;
using System.Collections.Generic;
using System.Linq;
using Model;


namespace DataAccess
{
    public class NotesManagerDataAccess
    {
        const int PageSize = 10;

        public IList<Notes> GetNotes(int currentPage)
        {
            using (var context = new MiniCMSEntities())
            {
                var skip = (currentPage - 1) * PageSize; 

                return context.Notes.OrderByDescending(x => x.Id).Skip(skip).Take(10).ToList();
            }
        }

        public int GetNotesCount()
        {
            using (var context = new MiniCMSEntities())
            {
                return context.Notes.Count();
            }
        }

        public int AddNote(Notes note)
        {
            using (var context = new MiniCMSEntities())
            {
                if (IsExistName(note.Name, context))
                    throw new InvalidOperationException("This name is already used");

                context.Notes.Add(note);
                context.SaveChanges();

                return note.Id;
            }
        }

        public void DeleteNote(int noteId)
        {
            using (var context = new MiniCMSEntities())
            {
                var note = GetNoteInternal(noteId, context);
                context.Notes.Remove(note);
                context.SaveChanges();
            }
        }

        public void ChangeNote(int noteId, string noteName, string htmlContent, string shortNote)
        {
            using (var context = new MiniCMSEntities())
            {
                var note = GetNoteInternal(noteId, context);

                if (note.Name != noteName)
                {
                    if (IsExistName(noteName, context))
                        throw new InvalidOperationException("This name is already used");
                }

                note.Name = noteName;
                note.HTML = htmlContent;
                note.ShortNote = shortNote;

                context.SaveChanges();
            }
        }

        public Notes GetNote(int noteId)
        {
            using (var context = new MiniCMSEntities())
            {
                return GetNoteInternal(noteId, context);
            }
        }

        private static Notes GetNoteInternal(int noteId, MiniCMSEntities context)
        {
            var note = context.Notes.FirstOrDefault(x => x.Id == noteId);
            if (note != null)
                return note;

            throw new InvalidOperationException("Note with this id does not exist");
        }

        bool IsExistName(string name, MiniCMSEntities context)
        {
            return context.Notes.Count(x => x.Name == name) > 0;
        }
    }
}
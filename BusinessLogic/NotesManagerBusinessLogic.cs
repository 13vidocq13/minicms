using System.Collections.Generic;
using DataAccess;
using Model;

namespace BusinessLogic
{
    public class NotesManagerBusinessLogic
    {
        public IList<Notes> GetNotes(int currentPage)
        {
            var manager = new NotesManagerDataAccess();
            return manager.GetNotes(currentPage);
        }

        public int GetNotesCount()
        {
            var manager = new NotesManagerDataAccess();
            return manager.GetNotesCount();
        }

        public int AddNote(string noteName, string htmlContent, string shortNote)
        {
            var manager = new NotesManagerDataAccess();

            var note = new Notes {Name = noteName, HTML = htmlContent, ShortNote =  shortNote};

            return manager.AddNote(note);
        }

        public void ChangeNote(int noteId, string noteName, string htmlContent, string shortNote)
        {
            var manager = new NotesManagerDataAccess();
            manager.ChangeNote(noteId, noteName, htmlContent, shortNote);
        }

        public void DeleteNote(int noteId)
        {
            var manager = new NotesManagerDataAccess();
            manager.DeleteNote(noteId);
        }

        public Notes GetNote(int noteId)
        {
            var manager = new NotesManagerDataAccess();
            return manager.GetNote(noteId);
        }
    }
}
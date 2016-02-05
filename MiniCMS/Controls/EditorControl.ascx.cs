using System;

namespace MiniCMS.Controls
{
    public partial class EditorControl : System.Web.UI.UserControl
    {
        private const string NotesList = "~/Admin/NotesList.aspx?noteId=";

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            var htmlContent = EditorContent.Content;
            var noteName = TextBoxNoteName.Text;
            var shortNote = EditorShortNote.Content;

            try
            {
                var manager = new BusinessLogic.NotesManagerBusinessLogic();

                int noteId;
                if (Request["noteId"] == null)
                {
                    noteId = manager.AddNote(noteName, htmlContent, shortNote);
                }
                else
                {
                    if (!int.TryParse(Request["noteId"], out noteId))
                        throw new InvalidOperationException("request has incorrect parameters");

                    manager.ChangeNote(noteId, noteName, htmlContent, shortNote);
                }

                Response.Redirect(NotesList + noteId, false);
            }
            catch (InvalidOperationException exception)
            {
                LabelError.Text = exception.Message;
            }
        }

        public void BindEditor(int noteId)
        {
            try
            {
                var manager = new BusinessLogic.NotesManagerBusinessLogic();
                var note = manager.GetNote(noteId);

                var noteHtml = note.HTML;
                var noteName = note.Name;
                var noteIntroduction = note.ShortNote;

                EditorContent.Content = noteHtml;
                EditorShortNote.Content = noteIntroduction;
                TextBoxNoteName.Text = noteName;
            }
            catch (InvalidOperationException exception)
            {
                LabelError.Text = exception.Message;
            }
        }
    }
}
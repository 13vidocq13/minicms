using BusinessLogic;

namespace MiniCMS.Controls
{
    public partial class NotesPreviewControl : System.Web.UI.UserControl
    {
        private const string EditPage = "Edit.aspx?noteId=";
        private int _noteId;

        public void ShowNote(int noteId)
        {
            _noteId = noteId;

            var manager = new NotesManagerBusinessLogic();
            var note = manager.GetNote(_noteId);

            LabelName.Text = note.Name;
            LiteralData.Text = note.HTML;
        }
    }
}
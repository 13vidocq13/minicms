using System;

namespace MiniCMS.Views
{
    public partial class NotesPreview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int noteId;
            const string request = "noteId";

            if (Request[request] == null || !int.TryParse(Request[request], out noteId)) return;

            NotesPreview1.ShowNote(noteId);
        }
    }
}
using System;

namespace MiniCMS.Admin
{
    public partial class Edit : System.Web.UI.Page
    {
        private int _noteId;
        private const string request = "noteId";

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Page.IsPostBack) 
                return;
            if (Request[request] == null || !int.TryParse(Request[request], out _noteId)) return;

            EditorControl1.BindEditor(_noteId);
        }
    }
}
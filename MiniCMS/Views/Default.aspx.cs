using System;
using System.Web.UI;

namespace MiniCMS.Views
{
    public partial class _Default : Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            NotesListControl1.HideAdminButtons();
        }
    }
}
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

namespace MiniCMS.Controls
{
    public partial class NotesListControl : UserControl
    {
        private int _currentPage = 1;
        private const string EditButtonText = "Edit";
        private const string DeleteButtonText = "Delete";
        private const string AddNoteButtonId = "LinkButtonAddNote";
        private const string LabelId = "LabelManageYourNotes";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindNotes();
                PagerControl1.CurrentPage = 1;
            }

            PagerControl1.BindPager();
            AddEventClick();
        }

        public void AddEventClick()
        {
            foreach (var linkButton in PagerControl1.panelPager.Controls.OfType<LinkButton>())
            {
                linkButton.Click += LinkPager_Click;
            }
        }

        void LinkPager_Click(object sender, EventArgs e)
        {
            var lnk = sender as LinkButton;
            if (lnk != null) 
                HiddenFieldCurrentPage.Value = lnk.Text;

            if (!Page.IsPostBack)
                HiddenFieldCurrentPage.Value = _currentPage.ToString();
            else
                _currentPage = int.Parse(HiddenFieldCurrentPage.Value);

            PagerControl1.CurrentPage = _currentPage;
            PagerControl1.BindPager();
            AddEventClick();
        
            BindNotes();
        }

        public void BindNotes()
        {
            var manager = new NotesManagerBusinessLogic();
            var data = manager.GetNotes(_currentPage);

            Repeater1.DataSource = data;
            Repeater1.DataBind();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName != "delete") 
                return;
            
            var noteId = int.Parse(e.CommandArgument.ToString());

            try
            {
                var manager = new NotesManagerBusinessLogic();
                manager.DeleteNote(noteId);

                PagerControl1.CurrentPage = _currentPage;
                PagerControl1.BindPager();
                AddEventClick();

                BindNotes();
            }
            catch (InvalidOperationException exception)
            {
                Labelerror.Text = exception.Message;
            }
        }

        public void HideAdminButtons()
        {
            //hide button add
            var linkButtonAdd = Repeater1.Controls[0].Controls[0].FindControl(AddNoteButtonId);
            linkButtonAdd.Visible = false;

            //change name
            var label = Repeater1.Controls[0].Controls[0].FindControl(LabelId);
            ((Label) label).Text = "View notes";

            foreach (RepeaterItem repeaterItem in Repeater1.Items)
            {
                foreach (LinkButton item in repeaterItem.Controls.Cast<object>().Where(item => item is LinkButton))
                {
                    if (item.Text == EditButtonText || item.Text == DeleteButtonText)
                        item.Visible = false;
                }
            }
        }
    }
}
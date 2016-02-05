using System;
using System.Drawing;
using System.Web.UI.WebControls;
using BusinessLogic;

namespace MiniCMS.Controls
{
    public partial class PagerControl : System.Web.UI.UserControl
    {
        private const string LinkId = "lnkPage";
        private LinkButton _linkButton; 

        public int CurrentPage { get; set; }

        public LinkButton LinkPager
        {
            get { return _linkButton; }
        }

        public Panel panelPager
        {
            get { return PanelPager; }
        }

        public void BindPager()
        {
            panelPager.Controls.Clear();

            var manager = new NotesManagerBusinessLogic();
            var countOfNotes = manager.GetNotesCount();
            
            var countOfPages = countOfNotes%10 == 0 ? countOfNotes/10 : countOfNotes/10 + 1;

            if(countOfPages <= 1)
                return;

            for (var i = 1; i < countOfPages + 1; i++)
            {
                _linkButton = new LinkButton {ID = LinkId + i, Text = i.ToString()};
                
                if (CurrentPage == i)
                    _linkButton.BackColor = Color.DarkGray; 

                PanelPager.Controls.Add(_linkButton);

                var spacer = new Label { Text = "&nbsp;" };

                PanelPager.Controls.Add(spacer);
            }
        }
    }
}
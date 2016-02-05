using System;
using System.Web;
using System.Web.Security;

namespace MiniCMS.Controls
{
    public partial class LoginControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            if (Membership.ValidateUser(TextboxUserName.Text, TextBoxPassword.Text))
            {
                if (Request.QueryString["ReturnUrl"] != null)
                {
                    FormsAuthentication.RedirectFromLoginPage(TextboxUserName.Text, false);
                }
                else
                {
                    FormsAuthentication.SetAuthCookie(TextboxUserName.Text, false);
                }
            }
            else
            {
                LabelError.Text = "Invalid UserID and Password";
            }
        }
    }
}
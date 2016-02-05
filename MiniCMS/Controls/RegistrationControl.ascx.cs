using System;
using System.Web.Security;

namespace MiniCMS.Controls
{
    public partial class RegistrationControl : System.Web.UI.UserControl
    {
        private const string UserDefault = "~/Views/Default.aspx";
        private const string UserRole = "User";

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            var userName = TextBoxUserName.Text;
            var email = TextBoxEmail.Text;
            var password = TextBoxPassword.Text;

            MembershipCreateStatus status;
            var user = Membership.CreateUser(userName, password, email, null, null, true, out status);

            if (status == MembershipCreateStatus.Success)
            {
                if (user != null) 
                    Roles.AddUserToRole(user.UserName, UserRole);
                
                Response.Redirect(UserDefault);
            }

            LabelError.Text = status.ToString();
        }
    }
}
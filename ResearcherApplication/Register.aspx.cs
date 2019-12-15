using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResearcherApplication
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                this.BindExpertise();

                this.txtError.Text = "";
                this.txtError.Visible = false;
            }
        }

        void BindExpertise()
        {
            cbxCheckBoxList.DataSource = new Business.BusinessManager().GetAllExpertise();
            cbxCheckBoxList.DataValueField = "ExpertiseId";
            cbxCheckBoxList.DataTextField = "ExpertiseName";
            cbxCheckBoxList.DataBind();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                string expertiseIdsStr = string.Join(",",cbxCheckBoxList.Items.Cast<ListItem>().Where(i => i.Selected == true).Select(i => int.Parse(i.Value)).ToArray());
                string availableMonthsStr = string.Join(",", cbxMonths.Items.Cast<ListItem>().Where(i => i.Selected == true).Select(i => int.Parse(i.Value)).ToArray());
                int newUserId = new Business.BusinessManager().RegisterUser(txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtPassword1.Text, txtCity.Text, txtState.Text, long.Parse(txtPhoneNumber.Text), expertiseIdsStr, txtCity.Text, txtOrg.Text, availableMonthsStr);
                Response.Redirect("ResearcherDashboard.aspx?Id=newUserId");
            }
            catch(Exception ex)
            {
                txtError.Text = ex.Message;
                this.txtError.Visible = true;
            }
        }
    }
}
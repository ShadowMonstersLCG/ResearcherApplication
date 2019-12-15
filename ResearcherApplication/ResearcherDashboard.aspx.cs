using ResearcherApplication.Business;
using ResearcherInfoService.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResearcherApplication
{
    public partial class ResearcherDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProjects();
            }
        }

        private void BindProjects()
        {
            int researcherId = int.Parse(Request.QueryString["Id"].ToString());
            List<ProjectDto> dtos = new BusinessManager().GetProjects(researcherId);
            Session["ResearcherProjects"] = dtos;
            this.GridView1.DataSource = dtos;
            this.GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtInfoRequested = (TextBox)e.Row.FindControl("txtInfoRequested");
                Button btnAction = (Button)e.Row.FindControl("btnAction");
                //ScriptManager.GetCurrent(this).RegisterPostBackControl(btnAction);

                //AsyncPostBackTrigger trigger = new AsyncPostBackTrigger();
                //trigger.ControlID = btnAction.UniqueID;
                //trigger.EventName = "Click";
                //updatePanel1.Triggers.Add(trigger);

                Label lblInfoRequested = (Label)e.Row.FindControl("lblInfoRequested");
                string status = (string)DataBinder.Eval(e.Row.DataItem, "Status");
                if (status == "Available")
                {
                    btnAction.Text = "Apply";
                }
                else if (status == "InformationRequested")
                {
                    btnAction.Text = "Submit Information";
                }
                else
                {
                    btnAction.Visible = false;
                }
                string infoRequested = (string)DataBinder.Eval(e.Row.DataItem, "InfoRequested");
                txtInfoRequested.Text = infoRequested == null ?string.Empty: infoRequested;
                if (status == "InformationRequested")
                {
                    txtInfoRequested.Visible = true;
                    lblInfoRequested.Visible = false;
                }
                else
                {
                    txtInfoRequested.Visible = false;
                    lblInfoRequested.Visible = true;
                }
            }
        }

        protected void btnAction_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow row = btn.NamingContainer as GridViewRow;
            int projectId = (int)GridView1.DataKeys[row.RowIndex].Value;

            //updatePanel1.Update();

            int researcherId = int.Parse(Request.QueryString["Id"].ToString());

            TextBox txtInfoRequested = (TextBox)row.FindControl("txtInfoRequested");

            if (btn.Text == "Apply")
            {
                bool result = new Business.BusinessManager().ApplyForProject(researcherId, projectId);
            }
            else
            {
                bool result = new Business.BusinessManager().SaveInformationRequested(projectId, researcherId, txtInfoRequested.Text);
            }

            ProjectDto updatedDto = new Business.BusinessManager().GetProjectById(projectId, researcherId);
            List<ProjectDto> dtos = ((List<ProjectDto>)Session["ResearcherProjects"]);
            ProjectDto existing = dtos.First(p => p.ProjectId==projectId);
            dtos.Remove(existing);
            dtos.Add(updatedDto);
            dtos = dtos.OrderBy(p => p.ProjectId).ToList();
            GridView1.DataSource = dtos;
            GridView1.DataBind();
        }

        protected void updatePanel1_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    BindProjects();
            //}
        }
    }
}
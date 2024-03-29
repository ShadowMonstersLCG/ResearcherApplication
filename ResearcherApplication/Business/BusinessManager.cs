﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using ResearcherInfoService.Models;

namespace ResearcherApplication.Business
{
    public class BusinessManager
    {
        //private System.Uri baseUri = new Uri("http://ec2-34-205-61-100.compute-1.amazonaws.com/researcherinfoservice/");
        private System.Uri baseUri = new Uri("http://localhost/researcherinfoservice/");
        private System.Net.Http.HttpClient client = new HttpClient();

        public async Task<ResearcherInfoService.Models.ExpertiseDto> GetAllExpertiseAsync()
        {
            var requestUri = this.baseUri + "api/User/GetAllExpertise";
            var responseMessage = await client.GetAsync(Uri.EscapeUriString(requestUri));
            responseMessage.EnsureSuccessStatusCode();
            var stream = await responseMessage.Content.ReadAsStreamAsync();
            using (JsonReader jsonReader =
                   new JsonTextReader(new System.IO.StreamReader(stream)))
            {
                var serializer = new JsonSerializer();
                return serializer.Deserialize<ResearcherInfoService.Models.ExpertiseDto>(jsonReader);
            }
        }

        public List<ResearcherInfoService.Models.ExpertiseDto> GetAllExpertise()
        {
            var requestUri = this.baseUri + "api/User/GetAllExpertise";
            var responseMessage = this.client.GetAsync(Uri.EscapeUriString(requestUri)).Result;
            responseMessage.EnsureSuccessStatusCode();
            var stream = responseMessage.Content.ReadAsStreamAsync().Result;
            using (JsonReader jsonReader =
                   new JsonTextReader(new System.IO.StreamReader(stream)))
            {
                var serializer = new JsonSerializer();
                return serializer.Deserialize<List<ResearcherInfoService.Models.ExpertiseDto>>(jsonReader);
            }
        }

        public int RegisterUser(string firstName, string lastName, string email, string hashPwd, string city, string state, long phonenumber, string expertiseIdsStr, string organization, string almaMater, string availableMonthsStr)
        {
            //var expertiseJson = JsonConvert.SerializeObject(expertiseIds);
            //var availableMonthsJSon = JsonConvert.SerializeObject(availableMonths);
            var requestUri = this.baseUri + "api/User/RegisterUser?firstname=" + firstName +
                                           "&lastName=" + lastName+ "&email=" +email + "&hashPwd="+ hashPwd + "&city=" + city + "&state=" + state + "&phonenumber=" + phonenumber + "&organization=" + organization + "&almaMater=" + almaMater + "&expertiseIdsStr=" + expertiseIdsStr + "&availableMonthsStr=" +availableMonthsStr;

            var responseMessage = this.client.GetAsync(Uri.EscapeUriString(requestUri)).Result;
            responseMessage.EnsureSuccessStatusCode();
            var stream = responseMessage.Content.ReadAsStreamAsync().Result;
            using (JsonReader jsonReader =
                   new JsonTextReader(new System.IO.StreamReader(stream)))
            {
                var serializer = new JsonSerializer();
                return serializer.Deserialize<int>(jsonReader);
            }
        }

        internal bool SaveInformationRequested(int projectId, int researcherId, string informationRequested)
        {
            var requestUri = this.baseUri + "api/Project/SaveInformationRequested?researcherId=" + researcherId + "&projectId=" + projectId + "&informationRequested" + informationRequested;

            var responseMessage = this.client.GetAsync(Uri.EscapeUriString(requestUri)).Result;
            responseMessage.EnsureSuccessStatusCode();
            var stream = responseMessage.Content.ReadAsStreamAsync().Result;

            using (JsonReader jsonReader =
                   new JsonTextReader(new System.IO.StreamReader(stream)))
            {
                var serializer = new JsonSerializer();
                //string str= serializer.Deserialize(jsonReader).ToString();
                return serializer.Deserialize<bool>(jsonReader);
            }
        }

        public List<ResearcherInfoService.Models.ProjectDto> GetProjects(int researcherId)
        {
            var requestUri = this.baseUri + "api/Project/GetProjects?researcherId=" + researcherId;

            var responseMessage = this.client.GetAsync(Uri.EscapeUriString(requestUri)).Result;
            responseMessage.EnsureSuccessStatusCode();
            var stream = responseMessage.Content.ReadAsStreamAsync().Result;

            using (JsonReader jsonReader =
                   new JsonTextReader(new System.IO.StreamReader(stream)))
            {
                var serializer = new JsonSerializer();
               //string str= serializer.Deserialize(jsonReader).ToString();
                return serializer.Deserialize<List<ResearcherInfoService.Models.ProjectDto>>(jsonReader);
            }
        }

        public bool ApplyForProject(int researcherId, int projectId)
        {
            var requestUri = this.baseUri + "api/Project/ApplyForProject?researcherId=" + researcherId + "&projectId=" + projectId;

            var responseMessage = this.client.GetAsync(Uri.EscapeUriString(requestUri)).Result;
            responseMessage.EnsureSuccessStatusCode();
            var stream = responseMessage.Content.ReadAsStreamAsync().Result;

            using (JsonReader jsonReader =
                   new JsonTextReader(new System.IO.StreamReader(stream)))
            {
                var serializer = new JsonSerializer();
                //string str= serializer.Deserialize(jsonReader).ToString();
                return serializer.Deserialize<bool>(jsonReader);
            }
        }

        public ProjectDto GetProjectById(int projectId, int researcherId)
        {
            var requestUri = this.baseUri + "api/Project/GetProjectById?researcherId=" + researcherId + "&projectId=" + projectId;

            var responseMessage = this.client.GetAsync(Uri.EscapeUriString(requestUri)).Result;
            responseMessage.EnsureSuccessStatusCode();
            var stream = responseMessage.Content.ReadAsStreamAsync().Result;

            using (JsonReader jsonReader =
                   new JsonTextReader(new System.IO.StreamReader(stream)))
            {
                var serializer = new JsonSerializer();
                //string str= serializer.Deserialize(jsonReader).ToString();
                return serializer.Deserialize<ProjectDto>(jsonReader);
            }
        }


    }
}
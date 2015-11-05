using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Xml.Linq;

namespace ms8.code.Pricing.Endpoints
{
    public class WebService
    {
        public string Url { get; private set; }
        public string MethodName { get; private set; }
        public string MethodNamespace { get; private set; }
        public string MethodNamespaceXmlns { get; private set; }
        public string PostValueWrapper { get; set; }

        public Dictionary<string, string> Params = new Dictionary<string, string>();

        public XDocument ResultXml;

        public string ResultString;

        public WebService(string url, string methodName, string methodNamespace, string methodNamespaceXmlns)
        {
            Url = url;
            MethodName = methodName;
            MethodNamespace = methodNamespace;
            MethodNamespaceXmlns = methodNamespaceXmlns;
        }

        /// <summary>
        /// Invokes service
        /// </summary>
        public void Invoke()
        {
            Invoke(true);
        }

        /// <summary>
        /// Invokes service
        /// </summary>
        /// <param name="encode">Added parameters will encode? (default: true)</param>
        public void Invoke(bool encode)
        {
            string soapStr =
                @"<?xml version=""1.0"" encoding=""utf-8""?>
<soapenv:Envelope xmlns:soapenv=""http://schemas.xmlsoap.org/soap/envelope/"" xmlns:MethodNamespaceName=""MethodNamespaceXmlns"">
    <soapenv:Header /> 
    <soapenv:Body>
        <{0}>
            {1}
        </{0}>
    </soapenv:Body>
</soapenv:Envelope>";

            soapStr = soapStr.Replace("MethodNamespaceName", MethodNamespace);
            soapStr = soapStr.Replace("MethodNamespaceXmlns", MethodNamespaceXmlns);

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url);
            request.Headers.Add("SOAPAction", "\"http://tempuri.org/" + MethodNamespace + ":" + MethodName + "\"");
            request.ContentType = "text/xml;charset=\"utf-8\"";
            request.Accept = "text/xml";
            request.Method = "POST";

            string authInfo = "www.crcpress.com" + ":" + "overlord";
            authInfo = Convert.ToBase64String(Encoding.Default.GetBytes(authInfo));
            request.Headers["Authorization"] = "Basic " + authInfo;

            using (Stream stm = request.GetRequestStream())
            {
                string postValues = "";
                foreach (var param in Params)
                {
                    if (encode)
                        postValues += string.Format("<{0}>{1}</{0}>", HttpUtility.UrlEncode(param.Key), HttpUtility.UrlEncode(param.Value));
                    else
                        postValues += string.Format("<{0}>{1}</{0}>", param.Key, param.Value);
                }

                soapStr = string.Format(soapStr, MethodNamespace + ":" + MethodName, WrapPostValues(postValues));
                using (StreamWriter stmw = new StreamWriter(stm))
                {
                    stmw.Write(soapStr);
                }
            }

            //Console.WriteLine("Posting: " + soapStr);

            using (StreamReader responseReader = new StreamReader(request.GetResponse().GetResponseStream()))
            {
                string result = responseReader.ReadToEnd();
                ResultXml = XDocument.Parse(result);
                ResultString = result;
            }
        }

        private string WrapPostValues(string value)
        {
            if (!String.IsNullOrWhiteSpace(PostValueWrapper))
            {
                return "<" + PostValueWrapper + ">" + value + "</" + PostValueWrapper + ">";
            }

            return value;
        }
    }
}

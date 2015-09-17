using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Configuration;

namespace qzha.Model
{
    /// <summary>
    /// 系统参数设置
    /// </summary>
    class SysConfig
    {
        //public static string APP_ID = WebConfigurationManager.AppSettings["wx_id"].ToString();
        //public static string APP_SECRET = WebConfigurationManager.AppSettings["wx_secret"].ToString();
        //public static string BMOB_ID = WebConfigurationManager.AppSettings["bmob_id"].ToString();
        //public static string BMOB_SECRET = WebConfigurationManager.AppSettings["bmob_secret"].ToString();

        /// <summary>
        /// 微博的APP_KEY APP_SECRET CALLBACK_URL
        /// </summary>
        public static string APP_KEY = WebConfigurationManager.AppSettings["appKey"].ToString();
        public static string APP_SECRET = WebConfigurationManager.AppSettings["appSecret"].ToString();
        public static string CALLBACK_URL = WebConfigurationManager.AppSettings["callbackUrl"].ToString();
    }
}

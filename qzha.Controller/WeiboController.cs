using NetDimension.OpenAuth.Sina;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Configuration;

namespace qzha.Controller
{
    public class WeiboController : System.Web.Mvc.Controller
    {
        /// <summary>
        /// 封装一个方法来初始化OpenAuth客户端
        /// </summary>
        /// <returns></returns>
        private SinaWeiboClient GetOpenAuthClient()
        {
            var accessToken = "2.00Q5n8YF0zIyYp976ef8a9cd0_9enY";
            //var uid = Request.Cookies["uid"] == null ? string.Empty : Request.Cookies["uid"].Value;
            var uid = "761927485";

            var settings = ConfigurationManager.AppSettings;
            var client = new SinaWeiboClient(settings["appKey"], settings["appSecret"], settings["callbackUrl"], accessToken, uid);

            return client;
        }

        /// <summary>
        /// 授权认证
        /// </summary>
        /// <param name="code">新浪返回的code</param>
        /// <returns></returns>
        public ActionResult Authorized(string code)
        {
            if (string.IsNullOrEmpty(code))
            {
                return RedirectToAction("Index");
            }


            var client = GetOpenAuthClient();

            client.GetAccessTokenByCode(code);

            if (client.IsAuthorized)
            {
                //用session记录access token
                Session["access_token"] = client.AccessToken;
                //用cookie记录uid
                Response.AppendCookie(new HttpCookie("uid", client.UID) { Expires = DateTime.Now.AddDays(7) });
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("Index");
            }

        }

        /// <summary>
        /// 获取最新微博
        /// </summary>
        /// <returns></returns>
        public ActionResult GetPublicTimeline()
        {
            var client = GetOpenAuthClient();

            if (!client.IsAuthorized)
            {
                return Json(new
                {
                    authorized = false,
                });
            }
            // 调用获取当前登录用户及其所关注用户的最新微博api
            // 参考：http://open.weibo.com/wiki/2/statuses/friends_timeline
            var response = client.HttpGet("statuses/friends_timeline.json", new
            {

            });
            return Content(response.Content.ReadAsStringAsync().Result, "application/json");
        }

        /// <summary>
        /// 获取第几页的微博
        /// </summary>
        /// <returns></returns>
        public string GetFriendTimelineOfPage(string page_no)
        {
            var client = GetOpenAuthClient();

            // 调用获取当前登录用户及其所关注用户的最新微博api
            // 参考：http://open.weibo.com/wiki/2/statuses/friends_timeline
            var response = client.HttpGet("statuses/friends_timeline.json", new
            {
                page = page_no
            });
            return response.Content.ReadAsStringAsync().Result;
        }

        
        /// <summary>
        /// 获取主页微博
        /// </summary>
        /// <returns></returns>
        public string GetHomeTimeline()
        {
            var client = GetOpenAuthClient();
            // 调用获取当前登录用户及其所关注用户的最新微博api
            // 参考：http://open.weibo.com/wiki/2/statuses/home_timeline
            var response = client.HttpGet("statuses/friends_timeline.json");
            return response.Content.ReadAsStringAsync().Result;
        }


        /// <summary>
        /// 获取用户粉丝数目
        /// </summary>
        /// <returns></returns>
        public string  GetUserCounts()
        {
            var client = GetOpenAuthClient();
            var response = client.HttpGet("users/counts.json", new
            {
                uids = "5089684300"
            });
            return response.Content.ReadAsStringAsync().Result;
        }

        /// <summary>
        /// 获取用户信息
        /// </summary>
        /// <returns></returns>
        public ActionResult GetUserState()
        {
            var client = GetOpenAuthClient();

            if (!client.IsAuthorized)
            {
                return Json(new
                {
                    authorized = false,
                    url = client.GetAuthorizationUrl()
                });
            }

            // 调用获取获取用户信息api
            // 参考：http://open.weibo.com/wiki/2/users/show
            var response = client.HttpGet("users/show.json", new
            {
                uid = client.UID
            });

            if (response.IsSuccessStatusCode)
            {
                var json = new JObject();
                json["authorized"] = true;
                json["data"] = JObject.Parse(response.Content.ReadAsStringAsync().Result);
                return Content(json.ToString(Formatting.None), "application/json");
            }
            else
            {
                var json = new JObject();
                json["authorized"] = false;
                json["data"] = JObject.Parse(response.Content.ReadAsStringAsync().Result);

                json["authorized"] = true;
                return Content(json.ToString(Formatting.None), "application/json");
            }
        }

        /// <summary>
        /// 发微博
        /// </summary>
        /// <param name="status"></param>
        /// <param name="img"></param>
        /// <returns></returns>
        public ActionResult PostStatus(string status, string img)
        {
            var imgFile = new FileInfo(img);


            var client = GetOpenAuthClient();

            if (!client.IsAuthorized)
            {
                return Json(false);
            }

            if (imgFile.Exists)
            {
                // 调用发图片微博api
                // 参考：http://open.weibo.com/wiki/2/statuses/upload
                var response = client.HttpPost("statuses/upload.json", new
                {
                    status = status,
                    pic = imgFile //imgFile: 对于文件上传，这里可以直接传FileInfo对象
                });

                if (response.IsSuccessStatusCode)
                {
                    return Json(true);
                }
                else
                {
                    return Json(false);
                }


            }
            else
            {
                // 调用发微博api
                // 参考：http://open.weibo.com/wiki/2/statuses/update
                var response = client.HttpPost("statuses/update.json", new
                {
                    status = status
                });

                if (response.IsSuccessStatusCode)
                {
                    return Json(true);
                }
                else
                {
                    return Json(false);
                }
            }
        }

    }

}

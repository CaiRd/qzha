<%@ WebHandler Language="C#" Class="WeiboHandler" %>

using System;
using System.Web;
using qzha.Controller;
using System.Web.Mvc;



public class WeiboHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string type = context.Request.QueryString["type"];
        string returnstr = string.Empty;
        if (type == "GetPublicTimeline")
        {
            WeiboController controller = new WeiboController();
            //ActionResult authorized = controller.GetPublicTimeline();
            context.Response.Write(controller.GetHomeTimeline());
        }
        else if (type == "GetFriendTimelineOfPage")
        {
            string page = context.Request.QueryString["page"];
            WeiboController controller = new WeiboController();
            //ActionResult authorized = controller.GetPublicTimeline();
            context.Response.Write(controller.GetFriendTimelineOfPage(page));
        }
        else if (type == "GetUsersCounts")
        {
            WeiboController controller = new WeiboController();
            context.Response.Write(controller.GetUserCounts());
        }
        else if (type == "UploadImage")
        {
            // 获得浏览器传过来的第一个文件选择框的数据
            HttpPostedFile hpFile = context.Request.Files[0];

            // 获得文件的类型,限制上传只能为"image/jpeg"  "image/png"  "image/gif"
            string contentType = hpFile.ContentType;

            // 获得文件的大小,单位是字节
            int contentLength = hpFile.ContentLength;

            // 要保存的目录路径
            string filePath = "../Upimages";

            // 判断文件是否问图片
            if(contentType != "image/jpeg" && contentType != "image/png" && contentType != "image/gif")
            {
                context.Response.Write("typeFalse");
            }
            // 判断图片是否大于5M
            else if(contentLength > 5242000)
            {
                context.Response.Write("lengthFalse");
            }
            // 判断长度
            else if (contentLength > 0)
            { 
                //获取上传上来的文件名称
                string fileName = System.IO.Path.GetFileName(hpFile.FileName);
                
                // 把图片重命名为按照时间格式的唯一名字照片
                fileName = string.Format("{0:yyyyMMddHHmmss}{1}", DateTime.Now, fileName.Substring(fileName.LastIndexOf('.')));
                
                //获得要保存的物理路径
                filePath = context.Server.MapPath(filePath + "/" + fileName);
                
                //将上传上来的文件数据保存在对应的物理路径上
                hpFile.SaveAs(filePath);
                
                context.Response.Write(fileName);
            }
            else
            {
                context.Response.Write("uploadFalse");
            }
        }
        else if(type == "PostStatus")
        {
            string status = context.Request["status"];
            string img = context.Request["img"];
            string filePath = context.Server.MapPath("../Upimages/" + img);
            img = filePath;
            WeiboController controller = new WeiboController();
            context.Response.Write(controller.PostStatus(status, img));
        }
    }
    
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
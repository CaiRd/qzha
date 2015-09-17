$(document).ready(function () {
    sessionStorage.setItem('page', '1');
    var lst = $('#statuses-lst');

    //加载用户最新微博(第一页)
    $.getJSON("/ajax/WeiboHandler.ashx?type=GetPublicTimeline").done(function (d) {
        console.log(d);
        if (d.statuses) {
            for (var i in d.statuses) {
                var status = d.statuses[i];

                // 修改微博来源
                if (status.source_type == 1) {
                    status.source = "侨中海岸";
                }

                // 转换时间
                var s = status.created_at;
                s = new Date(s);
                status.created_at = s.toHyphenDateString();

                // 是否有图片
                if (status.thumbnail_pic && status.thumbnail_pic != '') { // 有图模式一定是原创博文
                    var tpl = "<div class=\"media col-sm-12\"><div class=\"media-left\"><a href=\"#\"><img class=\"media-object\" width=\"60\" alt=\"...\" src=\"images/logo.jpg\"></a></div><div class=\"media-body\"><h3 class=\"media-heading\">侨中海岸</h3><p>" + status.text + "</p><img id='img" + status.idstr + "' value='0' class=\"enless\" onclick=\"changePic('img" + status.idstr + "','" + status.thumbnail_pic + "')\"   src=\"" + status.thumbnail_pic + " \"/><h5>" + status.created_at + " 来自 " + status.source + "</h5><br></div><p class=\"pull-right\"><a class=\"btn btn-primary\" role=\"button\" href=\"#\">转发[" + status.reposts_count + "]</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class=\"btn btn-default\" role=\"button\" href=\"#\">评论[" + status.comments_count + "]</a></p></div>";
                    lst.append(tpl);
                }
                // 判断是否为转发微博
                else if (status.retweeted_status && status.retweeted_status != '') { // 存在retweeted_status字段, 为转发微博
                    if (status.retweeted_status.thumbnail_pic && status.retweeted_status.thumbnail_pic != '') { 
                        var retweetedStatus = "<blockquote class=\"retweeted_status\"><h5>@" + status.retweeted_status.user.name + "</h5><p>" + status.retweeted_status.text + "</p><img id='img" + status.retweeted_status.idstr + "' value='0' class=\"enless\" onclick=\"changePic('img" + status.retweeted_status.idstr + "','" + status.retweeted_status.thumbnail_pic + "')\"   src=\"" + status.retweeted_status.thumbnail_pic + " \"/></blockquote>";
                        var tpl = "<div class=\"media col-sm-12\"><div class=\"media-left\"><a href=\"#\"><img class=\"media-object\" width=\"60\" alt=\"...\" src=\"images/logo.jpg\"></a></div><div class=\"media-body\"><h3 class=\"media-heading\">侨中海岸</h3><p>" + status.text + "</p>" + retweetedStatus + "<h5>" + status.created_at + " 来自 " + status.source + "</h5></div><p class=\"pull-right\"><a class=\"btn btn-primary\" role=\"button\" href=\"#\">转发[" + status.reposts_count + "]</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class=\"btn btn-default\" role=\"button\" href=\"#\">评论[" + status.comments_count + "]</a></p></div>";
                        lst.append(tpl);
                    }
                    else {
                        var retweetedStatus = "<blockquote class=\"retweeted_status\"><h5>@" + status.retweeted_status.user.name + "</h5><p>" + status.retweeted_status.text + "</p></blockquote>";
                        var tpl = "<div class=\"media col-sm-12\"><div class=\"media-left\"><a href=\"#\"><img class=\"media-object\" width=\"60\" alt=\"...\" src=\"images/logo.jpg\"></a></div><div class=\"media-body\"><h3 class=\"media-heading\">侨中海岸</h3><p>" + status.text + "</p>" + retweetedStatus + "<h5>" + status.created_at + " 来自 " + status.source + "</h5></div><p class=\"pull-right\"><a class=\"btn btn-primary\" role=\"button\" href=\"#\">转发[" + status.reposts_count + "]</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class=\"btn btn-default\" role=\"button\" href=\"#\">评论[" + status.comments_count + "]</a></p></div>";
                        lst.append(tpl);
                    }
                }
                else {
                    var tpl = "<div class=\"media col-sm-12\"><div class=\"media-left\"><a href=\"#\"><img class=\"media-object\" width=\"60\" alt=\"...\" src=\"images/logo.jpg\"></a></div><div class=\"media-body\"><h3 class=\"media-heading\">侨中海岸</h3><p>" + status.text + "</p><h5>" + status.created_at + " 来自 " + status.source + "</h5><br></div><p class=\"pull-right\"><a class=\"btn btn-primary\" role=\"button\" href=\"#\">转发[" + status.reposts_count + "]</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class=\"btn btn-default\" role=\"button\" href=\"#\">评论[" + status.comments_count + "]</a></p></div>";
                    lst.append(tpl);
                }
            }
            //获取粉丝数目,微博数
            $.getJSON("/ajax/WeiboHandler.ashx?type=GetUsersCounts").done(function (d) {
                console.log(d);
                $("#followers_count").text(d[0].followers_count);
                $("#friends_count").text(d[0].friends_count);
                $("#statuses_count").text(d[0].statuses_count);
            });
        }
        else {
            lst.append("请先登录。");
        }
    });

    

    // 点击上传图片
    $('#img-btn').click(function (e) {
        $.upload({
            // 上传地址
            url: '/ajax/WeiboHandler.ashx?type=UploadImage',
            // 文件域名字
            fileName: 'file',
            // 上传完成后, 返回json, text
            dataType: 'json',
            // 上传之前回调,return true表示可继续上传
            onSend: function () {
                return true;
            },
            onSubmit: function (){
                $("#uploadBtn").text(" 正在上传...");
                return true;
            },
            // 上传之后回调
            onComplate: function (data) {
                if (data == "uploadFalse") {
                    $("#uploadBtn").text("");
                    $('#post-btn').removeData('img');
                }
                else if(data == "typeFalse")
                {
                    $("#uploadBtn").text("");
                    $('#post-btn').removeData('img');
                    alert("海岸菌温馨提示: 仅支持上传jpg png gif类型图片");
                }
                else if (data == "lengthFalse") {
                    $("#uploadBtn").text("");
                    $('#post-btn').removeData('img');
                    alert("海岸菌温馨提示: 仅支持上传小于5M图片");
                }
                else {
                    //$('#post-btn').data('img', data.fileName);
                    $('#post-btn').data('img', data);

                    $("#uploadBtn").text("");
                    var previewPanel = $('#img-preview');

                    previewPanel.find('img').remove();

                    //previewPanel.append($('<img src="/Upimages/' + data.fileName + '" class="img-thumbnail" style="width:140px;" />'));
                    previewPanel.append($('<img src="/Upimages/' + data + '" class="img-thumbnail" style="width:140px;" />'));

                    previewPanel.css('display', 'block');
                }
            }
        });
        $("#uploadBtn").text("");
    });

    // 点击发布微博按钮
    $('#post-btn').click(function (e) {
        var text = $('#status-text').val();
        var img = $(this).data('img');

        var btn = $(this);

        if (text.trim() == '') {
            alert('说点什么吧？');
            return;
        }

        btn.button('loading');

        //发布微博
        $.ajax('/ajax/WeiboHandler.ashx?type=PostStatus', {
            data: {
                status: text,
                img: img
            },
            type: 'POST'
        }).done(function () {
            alert("发布成功~");
            $('#post-btn').removeData('img');
            $('#status-text').val('');
            var previewPanel = $('#img-preview');
            previewPanel.find('img').remove();
            previewPanel.css('display', 'none')
            //loadStatuses();
        }).fail(function (d) {
            console.log(d);
        }).always(function () {
            btn.button('reset');
        });


    });

    /*
    修改时间格式函数
    */
    Date.prototype.toHyphenDateString = function () {
        var year = this.getFullYear();
        var month = this.getMonth() + 1;
        var date = this.getDate();
        if (month < 10) { month = "0" + month; }
        if (date < 10) { date = "0" + date; }
        var hours = this.getHours();
        //var mins = this.getMin
        var mins = this.getMinutes();
        //var second = this.getSeconds();
        if (hours < 10) { hours = "0" + hours; }
        if (mins < 10) { mins = "0" + mins; }
        var today = new Date();
        if (year == today.getFullYear()) //同一年内
        {
            if (month == (today.getMonth() + 1) && date == today.getDate()) // 今天内
            {
                if (hours == today.getHours()) // 同一个小时内
                {
                    return today.getMinutes() - mins + "分钟前";
                }
                else if ((hours == (today.getHours() - 1)) || (mins > today.getMinutes)) // 同一个小时内
                {
                    return today.getMinutes() + 60 - mins + "分钟前";
                }
                else {
                    return "今天 " + hours + ":" + mins;
                }
            }
            else // 不是今天
            {
                return month + "月" + date + "日 " + hours + ":" + mins;
            }
        }
        else // 去年
        {
            return year + "-" + month + "-" + date + " " + hours + ":" + mins;
        }

    };

    //读取用户信息
    /*$.ajax("/Demo/GetUserState", { type: 'POST' }).done(function (d) {

        if (d.authorized === false) {
            //没有登录	
            var tpl = $($("#unauthorizedTpl").html());
            tpl.find('a').attr('href', d.url);
            var panel = $('#statePanel');
            panel.append(tpl);

        }
        else {
            //已经登录
            var tpl = $($("#authorizedTpl").html());
            tpl.find('.media-object').attr('src', d.data.profile_image_url);
            tpl.find('h4').text(d.data.screen_name);
            tpl.find('span').text(d.data.description);
            var panel = $('#statePanel');

            panel.removeClass('panel-danger').addClass('panel-success');

            panel.append(tpl);
            loadStatuses();


        }
    }).fail(function (e) {
        console.log(e);
    });*/
});


/*
点击图片放大缩小
*/
function changePic(id, src) {

    var img_id = id;
    var style_val = $('#' + img_id).attr("value");
    if (style_val == 0) {// 需要放大
        var img_src = src.replace('thumbnail', 'large');
        $('#' + img_id).removeClass("enless").addClass("carousel-inner").addClass("img-responsive").addClass("img-rounded").addClass("enlarge");
        $('#' + img_id).attr("value", 1).attr("src", img_src);
    }
    else {// 需要缩小
        var img_src = src.replace('large', 'thumbnail');
        $('#' + img_id).removeClass("carousel-inner").removeClass("img-responsive").removeClass("img-rounded").removeClass("enlarge").addClass("enless");
        $('#' + img_id).attr("value", 0).attr("src", img_src);
        $('html,body').animate({ scrollTop: $('#' + img_id).offset().top }, 800);
    }
};

/*
点击下一页按钮
*/
function nextPage() {
    var page = Number(sessionStorage.getItem('page')) + 1;
    turnToPage(page);
    sessionStorage.setItem('page', page);
    if (page >= 2) {
        $("#lastPage").removeClass("disabled");
    }
};

/*
点击上一页按钮
*/
function lastPage() {
    var page = Number(sessionStorage.getItem('page')) - 1;
    if (page == 1) {
        $("#lastPage").addClass("disabled");
    }
    turnToPage(page);
    sessionStorage.setItem('page', page);
    
};

/*
跳转至某一页微博
*/
function turnToPage(page) {
    var lst = $('#statuses-lst');
    $.getJSON("/ajax/WeiboHandler.ashx?type=GetFriendTimelineOfPage&page="+page).done(function (d) {
        console.log(d);
        if (d.statuses) {
            // 翻页先清空原本list里的内容
            lst.empty();
            $('html,body').animate({ scrollTop: $('#post-btn').offset().top }, 800);
            for (var i in d.statuses) {
                var status = d.statuses[i];
                if (status.source_type == 1) {
                    status.source = "侨中海岸";
                }
                var s = status.created_at;
                s = new Date(s);
                status.created_at = s.toHyphenDateString();

                if (status.thumbnail_pic && status.thumbnail_pic != '') {
                    var tpl = "<div class=\"media col-sm-12\"><div class=\"media-left\"><a href=\"#\"><img class=\"media-object\" width=\"60\" alt=\"...\" src=\"images/logo.jpg\"></a></div><div class=\"media-body\"><h3 class=\"media-heading\">侨中海岸</h3><p>" + status.text + "</p><img id='img" + status.idstr + "' value='0' class=\"enless\" onclick=\"changePic('img" + status.idstr + "','" + status.thumbnail_pic + "')\"   src=\"" + status.thumbnail_pic + " \"/><h5>" + status.created_at + " 来自 " + status.source + "</h5><br></div><p class=\"pull-right\"><a class=\"btn btn-primary\" role=\"button\" href=\"#\">转发[" + status.reposts_count + "]</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class=\"btn btn-default\" role=\"button\" href=\"#\">评论[" + status.comments_count + "]</a></p></div>";
                    lst.append(tpl);
                }
                else {
                    var tpl = "<div class=\"media col-sm-12\"><div class=\"media-left\"><a href=\"#\"><img class=\"media-object\" width=\"60\" alt=\"...\" src=\"images/logo.jpg\"></a></div><div class=\"media-body\"><h3 class=\"media-heading\">侨中海岸</h3><p>" + status.text + "</p><h5>" + status.created_at + " 来自 " + status.source + "</h5><br></div><p class=\"pull-right\"><a class=\"btn btn-primary\" role=\"button\" href=\"#\">转发[" + status.reposts_count + "]</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class=\"btn btn-default\" role=\"button\" href=\"#\">评论[" + status.comments_count + "]</a></p></div>";
                    lst.append(tpl);
                }
            }
        }
        else {
            lst.append("请先登录。");
        }
    });
};
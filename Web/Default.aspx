<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>新侨中海岸</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/index.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <script src="js/JQuery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.upload.js"></script>
    <script src="js/textCalculate.js"></script>
    <link type="image/x-icon" href="images/logo.jpg" rel="shortcut icon">

    <meta name="format-detection" content="telephone=no" />
    <!--告诉设备忽略将页面中的数字识别为电话号码  -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <!--指定的iphone中safari顶端的状态条的样式-->
    <link rel="apple-touch-startup-image" href="images/strat.png" />
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="images/logo_57.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/logo_72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/logo_114.png" />
</head>
<body>
    <!-- 模态弹出框 -->
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-send"></span>&nbsp;&nbsp;转发微博</h4>
                </div>
                <div class="modal-body">
                    <textarea name="content" class="form-control" style="height: 80px; resize: vertical; overflow: auto;" id="" placeholder="" maxlength="140"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary">转发</button>
                </div>
            </div>
        </div>
    </div>

    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">
                    <img alt="QZHA" src="images/logo.jpg" width="20">
                </a>
                <a class="navbar-brand" href="#">侨中海岸</a>

            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">海岸首页 <span class="sr-only">(current)</span></a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">照片墙 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">School IT</a></li>
                            <li><a href="#">Live-in 乐社</a></li>
                            <li><a href="#">星心文学社</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">社团艺术节</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">侨中海岸</a></li>
                        </ul>
                    </li>
                    <li><a href="about.aspx">关于海岸</a></li>
                </ul>
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">搜索</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">School IT</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">客户端下载 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">PC 客户端</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Android 客户端</a></li>
                            <li><a href="#">iOS 客户端</a></li>
                            <li><a href="#">Windows Phone 客户端</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    <div class="container main">
        <div class="row">
            <div class="col-sm-9">
                <p class="pull-right visible-xs">
                    <button class="btn-xs btn btn-primary">扩展</button>
                </p>
                <div class="jumbotron">
                    <div class="container">
                        <h1>侨中海岸</h1>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                广东汕头华侨中学学生交流平台 由侨中School IT社搭建及管理.
                            </div>
                            <div class="panel-body">
                                <textarea onkeyup="javascript:checkWord(this);" onmousedown="javascript:checkWord(this);" name="content" class="form-control" style="height: 80px; resize: vertical; overflow: auto;" id="status-text" placeholder="请不要发布无意义内容，不要骂人，不要重复发布，不要刷屏，谢谢配合~" maxlength="140"></textarea>
                            </div>

                            <div class="panel-body" id="img-preview" style="display: none">
                            </div>

                            <div class="panel-footer clearfix">
                                <button id="img-btn" class="btn btn-success pull-left"><span class="glyphicon glyphicon-picture" id="uploadBtn"></span></button>

                                <button id="post-btn" class="btn btn-primary pull-right" data-loading-text="正在发布..."><span class="glyphicon glyphicon-send"></span>&nbsp;&nbsp;发微博 <span class="badge" id="wordCheck">140</span></button>
                            </div>
                        </div>
                        <%--                        <p>广东汕头华侨中学学生交流平台 由侨中School IT社搭建及管理.</p>
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <textarea id="TextBox1" class="col-sm-11 form-control" placeholder="请不要发布无意义内容，不要骂人，不要重复发布，不要刷屏，谢谢配合~" name="TextBox1"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-10 col-sm-2">
                                    <button type="submit" class="btn btn-default">&nbsp;发微博&nbsp;</button>
                                </div>
                            </div>
                        </form>--%>
                        <!--倒计时效果html开始-->
                        <h3>距离2016年高考还有
                            <span id="day" class="label label-primary">00</span> 天
                            <span id="hours" class="label label-primary" style="display: none;">00</span>
                            <span id="mins" class="label label-primary" style="display: none;">00</span>
                            <span id="seconds" class="label label-primary" style="display: none;">00</span>
                            <span id="minisec" class="label label-primary" style="display: none;">00</span>.</h3>
                        <script src="js/timeline.js"></script>
                        <!--效果html结束-->
                    </div>
                </div>
                <div class="row">
                    <div class="container col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">最新微博 </div>
                            <div id="statuses-lst" class="panel-body">
                                <div class="media col-sm-12">
                                    <div class="media-left">
                                        <a href="#">
                                            <img class="media-object" width="60" alt="..." src="images/logo.jpg">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h3 class="media-heading">侨中海岸</h3>
                                        <p>这里是广东汕头华侨中学学生交流平台侨中海岸 海岸发布方法请看大图～  @广东汕头华侨中学SchoolIT社</p>
                                        <%--<img id="img1" class="enless" src="images/fabufangfa.jpg" value="0" onclick="changePic('img1','src')"/>--%>

                                        <%--<blockquote class="retweeted_status">
                                            <h5>School IT</h5>
                                            <p>这里是广东汕头华侨中学学生交流平台侨中海岸 海岸发布方法请看大图～ 这里是广东汕头华侨中学学生交流平台侨中海岸 海岸发布方法请看大图～ </p>
                                        </blockquote>--%>
                                        <img id="img1" class="carousel-inner img-responsive img-rounded" src="images/fabufangfa.jpg" />
                                        <h5>海岸置顶微博 来自 School IT PC</h5>
                                        <br>
                                    </div>
                                    <p class="pull-right">
                                        <a class="btn btn-primary" role="button" href="#" data-toggle="modal" data-target="#myModal">转发</a>&nbsp;&nbsp;&nbsp;
                                            <a class="btn btn-default" role="button" href="#">评论</a>
                                    </p>
                                    <br /><br />
                                    <div class="alert alert-info alert-dismissible fade in" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                        <h4><strong>评论微博</strong></h4>
                                        <textarea name="content" class="form-control" style="height: 80px; resize: vertical; overflow: auto;" id="" placeholder="" maxlength="140"></textarea>
                                        <br />
                                        <p class="pull-right">
                                            <a class="btn btn-default" role="button" href="#">评论</a>
                                        </p>
                                        <br />
                                        <hr />
                                        <h4><strong>评论列表</strong></h4>
                                        <blockquote class="retweeted_status">
                                            <h5>School IT</h5>
                                            <p>这里是广东汕头华侨中学学生交流平台侨中海岸 海岸发布方法请看大图～ 这里是广东汕头华侨中学学生交流平台侨中海岸 海岸发布方法请看大图～ </p>
                                        </blockquote>
                                        <blockquote class="retweeted_status">
                                            <h5>School IT</h5>
                                            <p>这里是广东汕头华侨中学学生交流平台侨中海岸 海岸发布方法请看大图～ 这里是广东汕头华侨中学学生交流平台侨中海岸 海岸发布方法请看大图～ </p>
                                        </blockquote>
                                        <blockquote class="retweeted_status">
                                            <h5>School IT</h5>
                                            <p>这里是广东汕头华侨中学学生交流平台侨中海岸 海岸发布方法请看大图～ 这里是广东汕头华侨中学学生交流平台侨中海岸 海岸发布方法请看大图～ </p>
                                        </blockquote>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--<div class="media col-sm-12">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object" src="images/logo.jpg" alt="..." width="80">
                        </a>
                    </div>
                    <div class="media-body">
                        <h3 class="media-heading">@侨中海岸</h3>
                        <p>这里是广东汕头华侨中学学生交流平台侨中海岸 海岸发布方法请看大图～  @广东汕头华侨中学SchoolIT社</p>
                        <img src="images/logo.jpg" alt="..."><br />
                        <p class="pull-right"><a href="#" class="btn btn-primary" role="button">转发</a> <a href="#" class="btn btn-default" role="button">评论</a></p>
                    </div>
                </div>--%>


                <%--                <div class="row" id="statuses-lst">
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <div class="caption">
                                <h3>@侨中海岸</h3>
                                <p class="status_content">这里是广东汕头华侨中学学生交流平台侨中海岸 海岸发布方法请看大图～  @广东汕头华侨中学SchoolIT社</p>

                            </div>
                            <img src="images/logo.jpg" alt="..."><br />
                            <p class="pull-right"><a href="#" class="btn btn-primary" role="button">转发</a> <a href="#" class="btn btn-default" role="button">评论</a></p>
                            <br />
                            <br />
                        </div>
                    </div>

                </div>--%>
                <nav>
                    <ul class="pager">
                        <li id="lastPage" class="previous disabled"><a href="javascript:lastPage();"><span aria-hidden="true">&larr;</span> 上一页</a></li>
                        <li id="nextPage" class="next"><a href="javascript:nextPage();">下一页 <span aria-hidden="true">&rarr;</span></a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-sm-3">
                <ol class="breadcrumb">
                    <li>关注
                        <label id="followers_count"></label>
                    </li>
                    <li>粉丝
                        <label id="friends_count"></label>
                    </li>
                    <li>微博
                        <label id="statuses_count"></label>
                    </li>
                </ol>
                <ul class="list-group">
                    <li class="list-group-item"><span class="glyphicon glyphicon-star"></span>&nbsp;&nbsp;等级:&nbsp;&nbsp;Lv 22
                    </li>
                    <li class="list-group-item"><span class="glyphicon glyphicon-pushpin"></span>&nbsp;&nbsp;位置:&nbsp;&nbsp;广东&nbsp;汕头
                    </li>
                    <li class="list-group-item"><span class="glyphicon glyphicon-education"></span>&nbsp;&nbsp;学校:&nbsp;&nbsp;毕业于&nbsp;广东汕头华侨中学 
                    </li>
                    <li class="list-group-item"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;生日:&nbsp;&nbsp;1932年4月1日
                    </li>
                    <li class="list-group-item"><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;简介:&nbsp;&nbsp;广东汕头华侨中学学生交流平台, 由侨中School IT社搭建及管理.
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <hr />
    <footer class="footer ">
        <div class="container">
            <div class="row footer-top">
                <div class="col-sm-6 col-lg-6">
                    <h4>
                        <img src="images/logo.jpg" height="33">侨中海岸
                    </h4>
                    <p>
                        本网站由侨中School IT社搭建及管理.有任何技术问题探讨可以私信海岸菌.
                    </p>
                </div>
                <div class="col-sm-6 col-lg-5 col-lg-offset-1">
                    <div class="row about">
                        <div class="col-xs-3">
                            <h4>关于</h4>
                            <ul class="list-unstyled">
                                <li>
                                    <a href="##">关于我们</a>
                                </li>
                                <li>
                                    <a href="##">School IT</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-xs-3">
                            <h4>联系方式</h4>
                            <ul class="list-unstyled">
                                <li>
                                    <a target="_blank" title="侨中海岸官方微博" href="http://weibo.com/577250000">新浪微博</a>
                                </li>
                                <li>
                                    <a href="mailto:gdstqzsd@163.com">电子邮件</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-xs-3">
                            <h4>照片墙</h4>
                            <ul class="list-unstyled">
                                <li>
                                    <a target="_blank" href="##">话剧社</a>
                                </li>
                                <li>
                                    <a target="_blank" href="##">Live-in 乐社</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-xs-3">
                            <h4>客户端下载</h4>
                            <ul class="list-unstyled">
                                <li>
                                    <a target="_blank" href="##">PC 客户端</a>
                                </li>
                                <li>
                                    <a target="_blank" href="##">Android 客户端</a>
                                </li>
                                <li>
                                    <a target="_blank" href="##">iOS 客户端</a>
                                </li>
                                <li>
                                    <a target="_blank" href="##">WP 客户端</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="row footer-bottom">
                <ul class="list-inline text-center">
                    <li>@侨中海岸 Copyright © 2014-2015  IT-BOBO IT-BO姐 IT-榕儿</li>
                </ul>
            </div>
        </div>
    </footer>
    <script src="js/weibo.js"></script>
</body>
</html>

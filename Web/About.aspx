<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>关于海岸</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/JQuery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link type="image/x-icon" href="images/logo.jpg" rel="shortcut icon">
    <link href="css/about.css" rel="stylesheet" />
</head>
<body>
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
                    <li ><a href="default.aspx">海岸首页 <span class="sr-only">(current)</span></a></li>
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
                    <li class="active"><a href="#">关于海岸</a></li>
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
    <header class="jumbotron subhead">
        <div class="container">
            <h1>关于 侨中海岸</h1>
            <p class="lead">广东汕头华侨中学学生交流平台 由侨中School IT社搭建及管理.</p>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <div class="col-md-3 ">
                <div id="toc" class="bc-sidebar">
                    <ul class="nav">
                        <li class="toc-h2 toc-active">
                            <a href="#toc0">关于海岸</a>
                        </li>
                        <li class="toc-h2">
                            <a href="#toc1">关于School IT</a>
                        </li>
                        <li class="toc-h2">
                            <a href="#toc2">加入我们</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <article class="post page">
                    <section class="post-content">
                        <span id="toc0"></span>
                        <h2 id="">关于海岸</h2>
                        <p>
                            <a href="http://weibo.com/">@侨中海岸</a> -- 创建于2014年, 由侨中School IT社搭建及管理, 是一个广东汕头华侨中学学生交流平台.
                            
                        </p>

                        <span id="toc1"></span>
                        <h2 id="bootstrap">关于School IT</h2>
                        <p>学校最早创立的四大社团之一.</p>
                        <p>为侨中的信息技术爱好者提供一个交流与展示的平台.</p>
                        <p>我们秉承以技术为核心的宗旨, 不断学习, 提高 ,创新. 使每个社员能够在这里学习与进步.</p>
                        
                        <span id="toc2"></span>
                        <h2 id="">加入我们</h2>
                        <p>School IT 拥有来自各种语言的开发人员，坚持分享、开放的互联网精神，旨在为广大侨中程序猿提供交流的平台，如果你和我们有相同的目标，我们乐意一起携手前行。</p>
                        <p>如果你也来自侨中, 如果你也喜欢编程, 欢迎和我们联系，更欢迎你加入我们的团队！</p>
                        <blockquote>
                            <p>
                                请发邮件到下面的邮箱，并在邮件标题上注明（想为海岸贡献一份能力）。
                                <br>
                                Mail： stqz520@qq.com
                            </p>
                        </blockquote>
                    </section>
                </article>
            </div>
        </div>
    </div>
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
</body>
</html>

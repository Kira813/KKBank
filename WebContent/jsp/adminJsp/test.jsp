<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<html><head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>KK Bank | Log in</title>
  <base href="<%=basePath%>">
	<%@ taglib uri="/struts-tags" prefix="s"%>
	<%@include file="./headMeta.jsp"%></head>
  <!-- Tell the browser to be responsive to screen width -->
    <!-- Favicon -->
    <link rel="icon" href="/img/favicon.png?v=1.2" type="image/x-icon">
    <link rel="shortcut icon" href="/img/favicon.png?v=1.2" type="image/x-icon">
    <link rel="apple-touch-icon" href="/img/favicon.png?v=1.2">

    <title>Free Bootstrap Admin Template</title>

    <link href="/css/theme.css?id=3" rel="stylesheet">

                <!-- Fonts -->
    <link href="//fonts.googleapis.com/css?family=Roboto:100,400,300,400italic,500" rel="stylesheet" type="text/css">
    <!-- Font-Awesome -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

  
    <script id="twitter-wjs" src="https://platform.twitter.com/widgets.js"></script><script id="facebook-jssdk" src="//connect.facebook.net/en_US/sdk.js#xfbml=1&amp;version=v2.0"></script><script src="https://pagead2.googlesyndication.com/pub-config/r20160212/ca-pub-4495360934352473.js"></script><script async="" src="//www.google-analytics.com/analytics.js"></script><script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                        (i[r].q = i[r].q || []).push(arguments)
                    }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-46680343-1', 'almsaeedstudio.com');
        ga('send', 'pageview');
    </script>
    <!-- async page-level ads -->
    <script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({
            google_ad_client: "ca-pub-4495360934352473",
            enable_page_level_ads: true
        });
    </script>
<script type="text/javascript" charset="utf-8" async="" src="https://platform.twitter.com/js/button.6d24da2c00b9af5d2a76b0455b2b1752.js"></script></head>
</head>

<body class="hold-transition login-page">
<nav class="navbar navbar-default navbar-static-top transparent" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#collapse-menu">
                <span class="sr-only">Toggle navigation</span>
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="/"><b>Almsaeed</b> Studio</a>
        </div>
        <!-- /.navbar-header -->
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="collapse-menu">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="/">Home</a></li>
                <li>
                    <a href="/themes/AdminLTE/documentation/index.html">Docs</a>
                </li>
                <li>
                    <a href="https://github.com/almasaeed2010/AdminLTE/issues">Support</a>
                </li>
                <li>
                    <a href="/premium">Premium Templates</a>
                </li>
                <li>
                    <a href="/blog">Blog</a>
                </li>
                <li>
                    <a href="/#subscribe">Subscribe</a>
                </li>
                <li>
                    <a href="/about">About Me</a>
                </li>
                                    <li>
                        <a href="/auth/login">Login</a>
                    </li>
                    <li>
                        <a href="/auth/register">Register</a>
                    </li>
                            </ul>
            <!-- /.navbar-nav -->
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>


</body></html>
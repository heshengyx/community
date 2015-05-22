<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title><decorator:title default="默认title"/></title>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/css/dashboard.css" rel="stylesheet">
    <!-- js -->
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/bootstrap.min.js"></script>
    <decorator:head/>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="${ctx}/security/logout">退出</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <%-- li class="active"><a href="${ctx}/manage/building">楼盘管理 <span class="sr-only">(current)</span></a></li> --%>
            <li><a href="${ctx}/manage/building">楼盘管理 <span class="sr-only">(current)</span></a></li>
            <li><a href="#">地区管理</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="${ctx}/manage/province">省份管理</a></li>
            <li><a href="${ctx}/manage/city">市县管理</a></li>
            <li><a href="${ctx}/manage/district">城区管理</a></li>
            <li><a href="${ctx}/manage/town">村镇管理</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="${ctx}/manage/permission">权限管理</a></li>
            <li><a href="${ctx}/manage/role">角色管理</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>
          <ul class="nav nav-sidebar">
          	<li><a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">地区管理</a></li>   
          </ul>
          <ul class="nav collapse" id="collapseExample">
          	<li><a href="${ctx}/manage/province">省份管理</a></li>
            <li><a href="${ctx}/manage/city">市县管理</a></li>
          </ul>
        </div>
        <!-- content -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        	<decorator:body />
        </div>
        <!-- content -->
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/bootstrap.min.js"></script>
     -->
  </body>
</html>
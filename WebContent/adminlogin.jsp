<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
 
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#loginbox{
			background:aliceblue;
			width: 300px;
			height: 300px;
			border:1px solid lightgreen;
		}
	</style>
 
  </head>
  
  <body>
  <div id="loginbox">
    <p>登录</p> <br>
    <form action="admincheck.jsp" method="post">
    	管理员id：<input type="text" placeholder="请输入管理员id" name="adminid"><br>
    	管理员密码：<input type="password" placeholder="请输入密码" name="adminpsd"><br>
    	<input type="submit" value="登录">
    </form><br>
    <h3>${name}</h3>
    </div>
  </body>
</html>
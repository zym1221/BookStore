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
	*{margin: 0;padding: 0}
        html,body{height: 100%} 
		#loginbox{
			background:aliceblue;
			width: 100%;
			height: 100%;
			border:1px solid lightgreen;
		}
		 .outer-wrap{
            /*只有同时为html和body设置height: 100%时，这里的height才生效，
            并且随浏览器窗口变化始终保持和浏览器视窗等高*/
            height: 100%;    
            position: relative;
            /* background-color: aliceblue; */
            background:url(img/bg6.jpg);
        }
        .login-panel{
            width: 400px;
            height: 300px;
            /* background-color: aliceblue; */
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -150px;
            margin-left: -200px;
        }
        .btn{width: 60px;
        height: 30px;
        
        }
        input{height:30px;}
		
	</style>
  </head>
  
  <body>
		<!-- <div id="loginbox"> -->
		<div class="outer-wrap">
		<center><h1>图书销售管理系统</h1></center>
        <div class="login-panel">
       
        <center>
        
        <h2>用户登录</h2> <br>
    <form action="check.jsp" method="post">
    	用户名：<input type="text" placeholder="请输入用户名" name="username"><br><br>
    	密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" placeholder="请输入密码" name="userpsd"><br><br>
    	<input type="submit" value="登录" class="btn">
    </form><br>
    <a href="register.jsp">没有账号？去注册</a>
    <h3>${name}</h3>
    </center>
        </div>
    </div>
		
  </body>
</html>
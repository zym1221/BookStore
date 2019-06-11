<%@page import="zym.Test"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <base href="<%=basePath%>"> 
    <title>My JSP 'regcheck.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head> 
  <body>
    	<%
    	request.setCharacterEncoding("utf-8");
     	response.setCharacterEncoding("utf-8");
     	String id=new String((request.getParameter("id")).getBytes("UTF-8"),"UTF-8"); 
     	String username=new String((request.getParameter("username")).getBytes("UTF-8"),"UTF-8"); 
     	String userpsd=new String((request.getParameter("userpsd")).getBytes("UTF-8"),"UTF-8");
     	String telephone=new String((request.getParameter("telephone")).getBytes("UTF-8"),"UTF-8"); 
     	//String email=new String((request.getParameter("email")).getBytes("UTF-8"),"UTF-8"); 
     	String sql="insert into bookstore.user(id,username,userpsd,telephone) values(?,?,?,?)";
     	String sql1="select from bookstore.user where id=id";
     	String sql2="select from bookstore.user where username=username";
     	String sql3="select from bookstore.user where iuserpsd=userpsd";
     	String sql4="select from bookstore.user where telephone=telephone";
     	Object[] myarg={id,username,userpsd,telephone};
     	String arg1=request.getParameter("id");
     	Object[] myargs1={request.getParameter("id"),request.getParameter("username"),request.getParameter("userpsd"),request.getParameter("telephone")};
     	Test T1=new Test();
     	if(T1.executeREG(sql, myarg)){
     		System.out.println("注册成功");
     		request.getSession().setAttribute("info", "注册成功");
     		response.sendRedirect("register.jsp");
     		}else {
     		System.out.println("注册失败");
     		request.getSession().setAttribute("info", "注册失败");
     	}
     	
     	/* if(T1.executeREG(sql, myarg)){
     		System.out.println("注册成功");
     		request.getSession().setAttribute("info", "注册成功");
     		response.sendRedirect("register.jsp");
     	}else if(T1.executeDML1(sql1, myarg)){
     		System.out.println("注册失败");
     		request.getSession().setAttribute("info", "注册失败");
     	} */
     	%>
  </body>
</html>

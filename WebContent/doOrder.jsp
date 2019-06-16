<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="zym.Order"%>
<%@ page import="zym.Test"%>
<%@ page import="zym.MyTools"%>
<%@ page import="zym.Connectdb"%>
<%@ page import="javax.swing.JOptionPane"%>
<%@ page import="java.util.*,com.jspsmart.upload.*" errorPage="" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <base href="<%=basePath%>"> 
    <title>zym图书商城</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    </head>
    <body>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
Connectdb order = new Connectdb();
    Test t1 = new Test();
    request.setCharacterEncoding("utf-8");
    int orderId = Integer.parseInt(request.getParameter("orderId"));
    int bookId = Integer.parseInt(request.getParameter("bookId"));
		String name = new String(request.getParameter("name").getBytes("UTF-8"),"UTF-8");
		String address = new String(request.getParameter("address").getBytes("UTF-8"),"UTF-8");
		String salesDate = new String(request.getParameter("salesDate").getBytes("UTF-8"),"UTF-8");
		String express = new String(request.getParameter("express").getBytes("UTF-8"),"UTF-8");
		String telephone = new String(request.getParameter("telephone"));
		String status = new String(request.getParameter("status").getBytes("UTF-8"),"UTF-8");

		String sql2 = "update order_table set bookId='" + bookId + "',name='" + name 
				+ "',address='" + address + "',salesDate='" + salesDate 
				+ "',express='" + express +"',telephone=" + telephone + ",status='"+ status+"' where orderId='" + orderId + "'" ;
				
		order.executeUpdate(sql2);
		response.sendRedirect("updateOrder.jsp");
		 %>
		 </html>
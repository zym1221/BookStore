<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="zym.Order"%>
<%@ page import="zym.Test"%>
<%@ page import="zym.MyTools"%>
<%@ page import="zym.Connectdb"%>
<%@ page import="java.util.List"%>
<%@page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>"> 
<title>修改商品</title>
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<style type="text/css">
* {
	font-family: "Microsoft YaHei";
}

.nav {
	width: 800px;
	margin: 0 auto;
	background-color: #E1E6F6;
	padding: 20px;
}

.nav form{
	display:block;
	position:relative;
	padding:20px 20px 20px 40px;
	width:340px;
	margin:0 auto;
}

.nav .title {
	display:block;
	width:100%;
	text-align: center;
}

.nav form input[type=text],select{
	width: 200px;
	height: 30px;
	margin-left: 10px;
	padding-left: 20px;
}
.nav form select{
	width: 220px;
}

.nav .btn {
	display:block;
	position:relative;
	text-align: center;
	height: 40px;
}

.btn a {
	display: inline-block;
	text-decoration: none;
	font-size: 12px;
	margin-left: 20px;
}
.nav .divimg{
	width:200px;
	height:150px;
	border:1px #999 solid;
	margin:0 auto;
	margin-bottom:20px;
	padding:5px;
}
#bookImg{
	display:block;
	height:150px;
	width:auto;
	margin:0 auto;
}
#imgfile{
	width: 160px;
	height: 30px;
	margin-left: 60px;
	
}
#filebtn{
	height:30px;
	width:50px;
	text-align:center;
}
</style>
<script type="text/javascript">
	function showpic(){
	 	var img= document.getElementById("bookImg");
	 	var file=document.getElementById("imgfile");
	 	img.src=file.value;
	 	img.style.display="block";
	}
</script>
</head>
<body>
	<%
   /*  ArrayList bookslist = (ArrayList) session.getAttribute("bookslist"); */
	Test t1 = new Test();
    request.setCharacterEncoding("utf-8");
	//Book bk=new Book();
	String sql5 = "select * from bookstore.order_table";
	List<Order> orderlist = t1.getOrder(sql5);
		int myid = Integer.parseInt(request.getParameter("id"));
		Order single = (Order) orderlist.get(myid);
	%>
	<div class="nav">
		<h2 class="title">修改订单信息</h2>
		
		<form method="post" action="doOrder.jsp" class="textform" onsubmit="return checkForm(this)">
			<table>
			<tr height="40">
					<td>订单编号</td>
					<td><input type="text" name="orderId" value="<%=single.getOrderId()%>" readonly /></td>
				</tr>
				<tr height="40">
					<td>图书编码</td>
					<td><input type="text" name="bookId" value="<%=single.getBookId()%>" readonly /></td>
				</tr>
				<tr height="40">
					<td>快递信息</td>
					<td>
						<select name="express">
							<option value="暂无快递" selected>暂无快递</option>
							<option value="韵达快递">韵达快递</option>
							<option value="申通快递">申通快递</option>
							<option value="天天快递">天天快递</option>
							
						</select>
					</td>
				</tr>
				<tr height="40">
					<td>物流信息</td>
					<td>
						<select name="status">
							<option value="待发货" selected>待发货</option>
							<option value="已发货">已发货</option>
							<option value="已签收">已签收</option>	
						</select>
					</td>
				</tr>
				<tr height="40">
					<td>收货人</td>
					<td><input type="text" name="name"
						value="<%=single.getName()%>"/></td>
				</tr>
				<tr height="40">
					<td>收货地址</td>
					<td><input type="text" name="address"
						value="<%=single.getAddress()%>"/></td>
				</tr>
				 <tr height="40">
					<td>联系电话</td>
					<td><input type="text" name="telephone"
						value="<%=single.getTelephone()%>"/></td>
				</tr>
				<tr height="40">
					<td>下单时间</td>
					<td><input type="text" name="salesDate"
						value="<%=single.getSalesDate()%>"/></td>
				</tr>
			</table>
			<p class="btn">
				<input type="submit" value="确定"/>&nbsp;&nbsp; <input
					type="reset" value="重置"/> <a href="updateOrder.jsp">返回>></a>
			</p>
		</form>
	</div>
</body>
</html>
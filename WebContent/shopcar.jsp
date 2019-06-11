<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="zym.Book"%>
<!-- 通过动作标识，获取ShopCar类实例 -->
<jsp:useBean id="myCar" class="zym.ShopCar" scope="session" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<html>
<head>
     <base href="<%=basePath%>">
<title>zym图书商城</title>
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/shopcar.css"/>
<style type="text/css">
* {
	font-family: "Microsoft YaHei";
}

.nav {
	width: 800px;
	margin: 0 auto;
	/* background-color: #E1E6F6; */
	padding: 20px;
}

.nav form{
	display:block;
	position:relative;
	padding:5px 20px 5px 40px;
	width:340px;
	margin:0 auto;
}

.nav .title {
	display:block;
	width:100%;
	text-align: center;
}

.nav form input[type=text] {
	width: 200px;
	height: 30px;
	margin-left: 10px;
	padding-left: 20px;
}
.nav form select{
	padding-left: 20px;
}
.footer-1{
position:relative;
	width:400px;
	left:50%;
	margin-left:-100px;
}
.info{
	position:absolute;
	left:100px;
}
.price{
	position:absolute;
	left:500px;
}
.count{
	position:absolute;
	right:0;
}


</style>
</head>
<body>
<%
	ArrayList buylist = myCar.getBuylist(); //获取实例中用来存储购买的商品的集合
	float total = 0; //用来存储应付金额
%>
	<div class="header">
		<h2 class="title">购物车</h2>
		<span class="info">图书信息</span>
		<span class="price">价格</span>
		<span class="count">数量</span>
	</div>
	<div class="main">
	<%
		if (buylist == null || buylist.size() == 0) {
	%>
	<h3 class="null">您的购物车为空！</h3>
	<%
		} else {
			for (int i = 0; i < buylist.size(); i++) {
				Book book = (Book) buylist.get(i);
				Integer bookId = book.getBookId(); //获取商品的编号
				String bookName = book.getBookName(); //获取商品名称
				String bookAuthor = book.getBookAuthor();
				String bookPublish = book.getBookPublish();
				String bookImg = book.getBookImg();
				double bookPrice = book.getBookPrice(); //获取商品价格
				int bookNum = book.getBookNum(); //获取购买数量				
				double money = ((int) ((bookPrice * bookNum + 0.05) * 10)) / 10; //计算当前商品总价，并进行四舍五入
				total += money; //计算应付金额
	%>
	<div class="book">
		<img src="d:\\booksImg\<%=bookImg%>" alt="<%=bookImg%>"/>
		<div class="bookinfo">
			<p>
				<span class="bookName">《<%=bookName %>》</span>
				<span class="price">￥<%=bookPrice*bookNum %></span>
				<span class="num"><%=bookNum %></span>
			</p>
			<p><span class="bookAuthor">作者：&nbsp;<%=bookAuthor %></span></p>
			<p><span class="bookPublish">出版社：<%=bookPublish %></span></p>
			<p>
				<span class="bookPrice">单价：&nbsp;<%=bookPrice %></span>
				<a class="delete" href="docar.jsp?action=remove&bookId=<%=book.getBookId()%>&total=<%=total%>">移除</a>
			</p>
		</div>
	</div>
	<%
		}
		}
	%>
	<div class="nav">
		<h2 class="title">填写收货信息</h2>
	<form  action="docar.jsp?action=pay&total=<%=total%>" method="post" class="myForm" >
		<table>
		<tr height="40">
					<td>收货人姓名</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr height="40">
					<td>收货人电话号码</td>
					<td><input type="text" name="telephone"></td>
				</tr>
				<tr height="40">
					<td>收货人地址</td>
					<td><input type="text" name="address"></td>
				</tr>
			<tr height="40">
					<td>应付金额：</td>
					<td>￥<%=total %></td>
				</tr>
				
				</table>
				<!-- 请检查收货信息<input type="submit" value="确定">
				&nbsp;&nbsp; <input
					type="reset" value="重置"> <a href="getbooks.jsp">返回>></a>
					</form> -->
				</div>
	<div class="footer">
		<p class="footer-1">
			<%-- <span class="money">应付金额：￥<%=total %></span><br> --%>
			<%-- <a class="pay" href="docar.jsp?action=pay&total=<%=total%>">下单</a> --%> 
			<!-- <a class="pay" href="order.jsp">下单</a> -->
		请检查收货信息然后下单
		<input type="submit" value="确定">
				&nbsp;&nbsp; <input
					type="reset" value="重置">
					</form>
		</p>
		<p class="footer-2">
			<a class="clear" href="docar.jsp?action=clear">清空购物车</a>
			<a class="shop" href="vip.jsp">继续购物</a>
		</p>
	</div>
<% session.setAttribute("buylist", buylist);%>
	</div>
</body>
</html>
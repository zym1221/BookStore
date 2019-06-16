<%@page import="com.sun.xml.internal.bind.v2.model.core.ID"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="zym.Test" %>
<%@ page import="zym.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="zym.MyTools"%>
<%@ page import="zym.Connectdb"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>zym图书商城</title>
<link rel="stylesheet" type="text/css" href="css/detail.css"/>
<script type="text/javascript">
	function countdown(){
		var num = document.getElementById("num").value;
		if(num>1){
			num=num-1;
		}else{
			num=1;
		}
		document.getElementById("num").value=num;
	}
	function countup(){
		var count = parseInt(document.getElementById("count").value);
		var num = parseInt(document.getElementById("num").value);
		if(num<count){
			num=num + 1;
		}else{
			num=count;
		}
		document.getElementById("num").value=num;
	}
	function doSubmit(){
		var num = document.getElementById("num").value;
		var bookName=document.getElementsByName("bkName")[0].innerText;
		var bookId=document.getElementsByName("bkId")[0].innerText;
		//alert(bookName);
		//alert(bookId)
		//window.location.href="docar.jsp?action=buy&id="+myId+"&num="+num;
		window.location.href="docar.jsp?action=buy&num="+num+"&bookId="+bookId;
		return false;
	}
</script>
</head>
<body>

<%

        Connectdb dobooks = new Connectdb();
        Test t1 = new Test();
        request.setCharacterEncoding("utf-8");
		String sql = "select bookstore.books_table.bookId,bookstore.books_table.bookName,bookstore.type_table.typeName,bookstore.books_table.bookAuthor,bookstore.books_table.bookPublish,bookstore.books_table.bookPrice,bookstore.books_table.bookCount,bookstore.books_table.bookImg from bookstore.books_table,bookstore.type_table where bookstore.books_table.bookType=bookstore.type_table.bookType";
        List<Book> bookslist = t1.getBook2(sql);
		int myid = MyTools.strToint(request.getParameter("id"));
		System.out.println(myid);
		Book book = (Book) bookslist.get(myid);
		int bookId = book.getBookId();
		//String sql = "select bookstore.books_table.bookId,bookstore.books_table.bookName,bookstore.type_table.typeName,bookstore.books_table.bookAuthor,bookstore.books_table.bookPublish,bookstore.books_table.bookPrice,bookstore.books_table.bookCount,bookstore.books_table.bookImg from bookstore.books_table,bookstore.type_table where bookstore.books_table.bookType=bookstore.type_table.bookType";
		String sql1 = "select * from bookstore.books_table where bookId='" + bookId + "'";
		List<Book> lst = t1.getBook(sql1);
        for (Book bk : lst) {
        	%>
        <div class="header">
		<h2 class="title">欢迎购买图书</h2>
		<a class="getback" href="vip.jsp">返回</a>
		<input type="text" id="count" value="<%=bk.getBookCount() %>" />
	</div>
	<div class="main-1">
		<img src="d:\\booksImg\<%=bk.getBookImg() %>" alt="书籍图片" />
		<div class="text">
			<span class="bookName" name="bkName" value="<%=bk.getBookName() %>"><%=bk.getBookName() %></span>
			<span class="bookAuthor">作者：<%=bk.getBookAuthor() %></span>
			<span class="bookPublish">出版社：<%=bk.getBookPublish() %></span>
			<h1>编码：</h1><span class="bookId" name="bkId" value="<%=bk.getBookId() %>"><%=bk.getBookId() %></span>
			<em class="bookPrice">价格：￥<%=bk.getBookPrice() %></em>
			<em class="bookCount" id="bookCount">库存：<%=bk.getBookCount() %></em>
			<span>数量：<b onclick="countdown()">-</b><input type="text" name="num" id="num" value="1" /><b onclick="countup()">+</b></span>
			<!--<span>数量：<input type="text" name="num" id="num" value="1" readonly/></span>-->
		     <a href="javascript:doSubmit()" class="dogood">加入购物车</a>
			<!-- <a href="" class="dogood">购买</a> -->
		</div>
		<div class="main-2">
			<h2>详细介绍</h2>
			<div class="mainbody">
			<%
			String sql2 = "select bookInformation from bookstore.books_table,bookstore.book_info where bookstore.books_table.bookId='" + bookId + "' and bookstore.books_table.bookId=bookstore.book_info.id";
			ResultSet rs=dobooks.executeQuery(sql2);
			while (rs.next()) {
				rs.getString(1);
			%>
				<p><%=rs.getString(1)%>
				</p>
 			<%
		}
	%> 
				<%
		}
	%>
			</div>
		</div>
	</div>

</body>
</html>
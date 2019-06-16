<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="zym.Test" %>
<%@ page import="zym.Book" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>zym图书商城</title>
<style type="text/css">
/* html{background:url(img/bg6.jpg);} */
a {
	text-decoration: none;
}
.title{
	font-size:20px;
	font-weight:bold;
}
.login,.adminlogin,.salesinfo{
	display:inline-block;
	width:85px;
	height:35px;
	text-align:center;
	line-height:35px;
	border-radius:5px;
	background-color:#B2B7BC;
}
.bookImg{
	height:50px;
	width:auto;
}
        td {
            width: 350px;
            height: 25px;
        }
        table{float:center;}
</style>  
 <script type="text/javascript">   
/*  function demo(elem){
     var tr = elem.parentNode;
     var i=tr.rowIndex-1;
     alert(i);
     window.location.href="dobooks.jsp?action=delete&id="+i;
		return false;
 } */
/*   function doSubmit(){
		var bookName=document.getElementsByName("bkName")[0].innerText;
		alert(bookName);
		//window.location.href="docar.jsp?action=buy&id="+myId+"&num="+num;
		window.location.href="dobooks.jsp?action=delete&bookName="+bookName;
		return false;
	}    */   
</script>

</head>
<body>
<div id="box1">
	<center><h1>图书销售管理系统</h1></center>
	
</div>

<table border="1" cellspacing="0">
		<td colspan="10" align="center" class="title">书城书籍信息如下</td>
	</tr>
	<tr align="center"  bgcolor="lightgrey">
		<td>编码</td>
		<td>书名</td>
		<td>类型</td>
		<td>作者</td>
		<td>出版社</td>
		<td>图片</td>
		<td>单价（元/本）</td>
		<td>库存</td>
		<td>删除</td>
		<td>更新</td>
	</tr>

    <%
        Test t1 = new Test();
        String sql = "select * from bookstore.books_table";
        List<Book> lst = t1.getBook(sql);
        for(int i=0;i<lst.size();i++){
        	Book bk = lst.get(i);
        /* for (Book bk : lst) { */
        	%>

	<tr height="60" align="center">
		<td><%=bk.getBookId()%></td>
		<td class="bookName" name="bkName" value="<%=bk.getBookName() %>"><%=bk.getBookName() %></td>
		<td><%=bk.getBookType()%></td>
		<td><%=bk.getBookAuthor()%></td>
		<td><%=bk.getBookPublish()%></td>
		<td><img src="d:\\booksImg\<%=bk.getBookImg()%>" class="bookImg"></img></td>
		<td><%=bk.getBookPrice()%></td>
		<td><%=bk.getBookCount()%></td>
		<%-- <td><%=i%></td> --%>
	    <td><a href="dobooks.jsp?action=delete&id=<%=i %>">删除</a></td>
	    <td><a href="updatebooks.jsp?id=<%=i %>">更新</a></td>
	   <!--  <td><a href="javascript:doSubmit()" >删除</a></td> -->
	</tr>
	<%
		}
	%>
<tr height="50">
		<td align="center" colspan="10">
			<a class="login" href="addbooks.jsp">添加书籍</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="login" href="updateOrder.jsp">查看订单</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="login" href="index.html">返回主页</a>
			&nbsp;&nbsp;&nbsp;&nbsp;

		</td>

</body>
</html>
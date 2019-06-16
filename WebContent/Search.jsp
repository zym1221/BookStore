<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="zym.Test" %>
<%@ page import="zym.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.*" %> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>zym图书商城</title>
<style type="text/css">
			input{
			    width: 87.5%;
			    border: 1px solid #e2e2e2;
			    height: 22px;
			    float: left;
			    background-image: url(img/reserch.png);
			    background-repeat: no-repeat;
			    background-size: 25px;
			    background-position:5px center;
			    padding:0 0 0 40px;
			}
			#search{
			    width: 8.3%;
			    height: 32px;
			    float: right;
			    background: skyblue;
			    color: white;
			    text-align: center;
			    line-height: 32px;
			    cursor: pointer;
			}
			chaxun{
			background-color: white;
             color: black;
             border: 2px solid #4CAF50; /* Green */
			    }
			li{
				list-style-type: none;
				border: 3px solid skyblue;
				border-bottom:0px ;
			}
			#shuoming{
				width: ;
				height: ;
				border: 3px solid skyblue;
				position: fixed;
				top:60px;
			}
			#list{
				position: fixed;
				top:100px;
			}
			#last{
				border-bottom: 3px solid skyblue;
			}
			 
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
.getback{
	display:inline-block;
	height:20px;
	line-height:20px;
	margin:0 10px;
	text-decoration:none;
	position:fixed;
	right:20px;
	top:270px;
	}
        td {
            width: 350px;
            height: 25px;
        }
        table{float:center;}
        info{position: fixed;
				top:150px;}

</style>
</head>

<body>
<div id="box1">
	<center><h1>图书销售管理系统</h1></center>
	<p>欢迎选购图书，您查找的书籍信息如下：</p>
	
</div>

<table border="1" cellspacing="0">
		<td colspan="9" align="center" class="title">查找书籍信息如下</td>
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
		<td>详细信息</td>
	</tr>


<%
        Test t1 = new Test();
        request.setCharacterEncoding("UTF-8");
      String info = new String(request.getParameter("search").getBytes("UTF-8"),"UTF-8");
         info=java.net.URLDecoder.decode(info,"UTF-8");
	     out.println(info); 
        
        String name = new String(request.getParameter("search").getBytes("UTF-8"),"UTF-8");
        name=java.net.URLDecoder.decode(name,"UTF-8");
       // String sql = "select * from bookstore.books_table where bookName='"+name+"' ";//在sql语句中使用变量 
       String sql="select bookstore.books_table.bookId,bookstore.books_table.bookName,bookstore.type_table.typeName,bookstore.books_table.bookAuthor,bookstore.books_table.bookPublish,bookstore.books_table.bookPrice,bookstore.books_table.bookCount,bookstore.books_table.bookImg from bookstore.books_table,bookstore.type_table where bookstore.books_table.bookType=bookstore.type_table.bookType and bookstore.books_table.bookName='"+name+"' ";
       
        List<Book> lst = t1.getBook2(sql);
        for(int i=0;i<lst.size();i++){
            Book bk = lst.get(i);
       
%> 

<div id="info">
 <tr height="60" align="center">
		<td><%=bk.getBookId()%></td>
		<td><%=bk.getBookName()%></td>
		<td><%=bk.getBookType()%></td>
		<td><%=bk.getBookAuthor()%></td>
		<td><%=bk.getBookPublish()%></td>
		<td><img src="d:\\booksImg\<%=bk.getBookImg()%>" class="bookImg"></img></td>
		<td><%=bk.getBookPrice()%></td>
		<td><%=bk.getBookCount()%></td>
		<td><a href="bookinfo1.jsp?id=<%=bk.getBookId()%>"><%=bk.getBookName()%>详细信息</a></td>
	</tr>
	</div>
	<%
		}
	%>
<a class="getback" href="vip.jsp">返回</a>

	</body>
</html>
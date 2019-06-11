<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="zym.Test" %>
<%@ page import="zym.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%
    request.setCharacterEncoding("UTF-8");
%> 
<%
	ArrayList bookslist = (ArrayList) session.getAttribute("bookslist");
%> 

<head>
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
<!-- <script type="text/javascript">
    function demo(elem){
        var tr = elem.parentNode;
        var index=tr.rowIndex-1;
        alert(index);
    }
</script> -->
</head>
<body>
<div id="box1">
	<center>欢迎来到zym图书商城</center>
	<p>欢迎选购图书，您可以根据图书名搜索图书.</p>
	
</div>
<div class="search-container">
           <form id="searchForm" action="Search.jsp" method="post">
              <input type="text" placeholder="请输入书名搜索..." name="search">
              <button type="submit" name="chaxun">查询</button>
           </form>
        </div>  

<table border="1" cellspacing="0">
		<td colspan="9" align="center" class="title">书城书籍信息如下</td>
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
        //String sql = "select * from bookstore.books_table";
        String sql = "select bookstore.books_table.bookId,bookstore.books_table.bookName,bookstore.type_table.typeName,bookstore.books_table.bookAuthor,bookstore.books_table.bookPublish,bookstore.books_table.bookPrice,bookstore.books_table.bookCount,bookstore.books_table.bookImg from bookstore.books_table,bookstore.type_table where bookstore.books_table.bookType=bookstore.type_table.bookType";
        List<Book> lst = t1.getBook2(sql);
        for(int i=0;i<lst.size();i++){
            Book bk = lst.get(i);

        //for (Book bk : lst) {
        	%>
            <!--  out.println("</td></tr>"+"</td><td>" + bk.getBookId()+"</td><td>" + bk.getBookType() + "</td><td>" + bk.getBookName() + "</td><td>" + bk.getBookAuthor() + "</td><td>" + bk.getBookPublish() + "</td><td>" + "<img src=/booksImg/"+bk.getBookImg()+"class='bookImg'></img></td>" + "<td>" + bk.getBookPrice() + "</td><td>" + bk.getBookCount() + "</td><td>" +  "</td></tr>"); 
            //out.println("</td></tr>"+"</td><td>" + bk.getBookId()+"</td><td>" + bk.getBookType() + "</td><td>" + bk.getBookName() + "</td><td>" + bk.getBookAuthor() + "</td><td>" + bk.getBookPublish() + "</td><td>" +bk.getBookImg()+"</td>" + "<td>" + bk.getBookPrice() + "</td><td>" + bk.getBookCount() + "</td><td>" +  "</td></tr>");	
        } -->
	<tr height="60" align="center">
		<td><%=bk.getBookId()%></td>
		<td><%=bk.getBookName()%></td>
		<td><%=bk.getBookType()%></td>
		<td><%=bk.getBookAuthor()%></td>
		<td><%=bk.getBookPublish()%></td>
		<td><img src="d:\\booksImg\<%=bk.getBookImg()%>" class="bookImg"></img></td>
		<td><%=bk.getBookPrice()%></td>
		<td><%=bk.getBookCount()%></td>
	    <%-- <td onclick="demo(this);"><a href="<%= bk.getBookInfo() %>"><%=bk.getBookName()%>详细信息</a></td> --%>
	    <td><a href="bookinfo.jsp?id=<%=i %>"><%=bk.getBookName()%>详细信息</a></td>
	</tr>
	<%
		}
	%>


	<tr height="50">
		<td align="center" colspan="9">
			
			<!-- <a class="salesinfo" href="salesinfo.jsp">销售信息</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
			<a class="salesinfo" href="shopcar.jsp">查看购物车</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="salesinfo" href="order.jsp">查看订单</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="salesinfo" href="index.html">返回主页</a>
		</td>
		<!-- <td>
		<img src="/booksImg/1.jpg"></img>
		</td> -->
	</tr>
	</table>
	</body>
<%
	session.setAttribute("bookslist", bookslist);
%>
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
<title>zymͼ���̳�</title>
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
        /* Test t1 = new Test();
        String sql = "select * from bookstore.books_table where bookId=2";
        List<Book> lst = t1.getBook(sql); */
        Connectdb dobooks = new Connectdb();
        Test t1 = new Test();
        request.setCharacterEncoding("utf-8");
		int Id=MyTools.strToint(request.getParameter("id"));
        
		String sql = "select * from bookstore.books_table where bookId='"+Id+"' ";//��sql�����ʹ�ñ���
        List<Book> lst = t1.getBook(sql);
        for (Book bk : lst) {
        	%>
            <!--  out.println("</td></tr>"+"</td><td>" + bk.getBookId()+"</td><td>" + bk.getBookType() + "</td><td>" + bk.getBookName() + "</td><td>" + bk.getBookAuthor() + "</td><td>" + bk.getBookPublish() + "</td><td>" + "<img src=/booksImg/"+bk.getBookImg()+"class='bookImg'></img></td>" + "<td>" + bk.getBookPrice() + "</td><td>" + bk.getBookCount() + "</td><td>" +  "</td></tr>"); 
            //out.println("</td></tr>"+"</td><td>" + bk.getBookId()+"</td><td>" + bk.getBookType() + "</td><td>" + bk.getBookName() + "</td><td>" + bk.getBookAuthor() + "</td><td>" + bk.getBookPublish() + "</td><td>" +bk.getBookImg()+"</td>" + "<td>" + bk.getBookPrice() + "</td><td>" + bk.getBookCount() + "</td><td>" +  "</td></tr>");	
        } -->
        <div class="header">
		<h2 class="title">��ӭ����ͼ��</h2>
		<a class="getback" href="vip.jsp">����</a>
		<input type="text" id="count" value="<%=bk.getBookCount() %>" />
	</div>
	<div class="main-1">
		<img src="d:\\booksImg\<%=bk.getBookImg() %>" alt="�鼮ͼƬ" />
		<div class="text">
			<span class="bookName" name="bkName" value="<%=bk.getBookName() %>"><%=bk.getBookName() %></span>
			<span class="bookAuthor">���ߣ�<%=bk.getBookAuthor() %></span>
			<span class="bookPublish">�����磺<%=bk.getBookPublish() %></span>
			<h1>���룺</h1><span class="bookId" name="bkId" value="<%=bk.getBookId() %>"><%=bk.getBookId() %></span>
			<em class="bookPrice">�۸񣺣�<%=bk.getBookPrice() %></em>
			<em class="bookCount" id="bookCount">��棺<%=bk.getBookCount() %></em>
			<span>������<b onclick="countdown()">-</b><input type="text" name="num" id="num" value="1" /><b onclick="countup()">+</b></span>
			<!--<span>������<input type="text" name="num" id="num" value="1" readonly/></span>-->
		     <a href="javascript:doSubmit()" class="dogood">���빺�ﳵ</a>
			<!-- <a href="" class="dogood">����</a> -->
		</div>
		<div class="main-2">
			<h2>��ϸ����</h2>
			<div class="mainbody">
			<%
			/* Book book1 = (Book) bookslist.get(myid);
			int bookId1 = book1.getBookId(); */
			String sql2 = "select bookInformation from bookstore.books_table,bookstore.book_info where bookstore.books_table.bookId='" + Id + "' and bookstore.books_table.bookId=bookstore.book_info.id";
			ResultSet rs=dobooks.executeQuery(sql2);
			while (rs.next()) {
				rs.getString(1);
			/* List<Book> lst1 = t1.getBook(sql2);
	        for (Book bk1 : lst) { */
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
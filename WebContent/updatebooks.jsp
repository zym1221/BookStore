<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="zym.Book"%>
<%@ page import="zym.Test"%>
<%@ page import="zym.MyTools"%>
<%@ page import="zym.Connectdb"%>
<%@ page import="java.util.List"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>"> 
<title>更新书籍</title>

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
	String sql5 = "select * from bookstore.books_table";
	List<Book> bookslist = t1.getBook(sql5);
		int myid = Integer.parseInt(request.getParameter("id"));
		Book single = (Book) bookslist.get(myid);
	%>
	<div class="nav">
		<h2 class="title">修改书籍信息</h2>
		<form method="post" action="update_file.jsp?bookId=<%=single.getBookId() %>" enctype="multipart/form-data" class="imgform">
			<div class="divimg">
				<img src="d:\\booksImg\<%=single.getBookImg()%>" alt="图书图片" id="bookImg"/>
			</div>
			<input type="file" id="imgfile" name="bookImg" onchange="showpic()"/>&nbsp;&nbsp;
			<input type="submit" value="提交" id="filebtn" />
		</form>
		<form method="post" action="dobooks.jsp?action=update" class="textform">
			<table>
				<tr height="40">
					<td>编码</td>
					<td><input type="text" name="bookId" value="<%=single.getBookId()%>" readonly /></td>
				</tr>
				<tr height="40">
					<td>类型</td>
					<td>
						<select name="bookType">
							<option value="0001" selected>1.计算机类</option>
							<option value="0002">2.文学类</option>
							<option value="0003">3.管理类</option>
							<option value="0004">4.文化类</option>
							<option value="0005">5.科学类</option>
							<option value="0005">6.传记类</option>
							<option value="0005">7.励志类</option>
							<option value="0005">8.教育类</option>
						</select>
					</td>
				</tr>
				<tr height="40">
					<td>书名</td>
					<td><input type="text" name="bookName"
						value="<%=single.getBookName()%>"/></td>
				</tr>
				<tr height="40">
					<td>作者</td>
					<td><input type="text" name="bookAuthor"
						value="<%=single.getBookAuthor()%>"/></td>
				</tr>
				<tr height="40">
					<td>出版社</td>
					<td><input type="text" name="bookPublish"
						value="<%=single.getBookPublish()%>"/></td>
				</tr>
				<tr height="40">
					<td>价格</td>
					<td><input type="text" name="bookPrice"
						value="<%=single.getBookPrice()%>"/></td>
				</tr>
				<tr height="40">
					<td>库存</td>
					<td><input type="text" name="bookCount"
						value="<%=single.getBookCount()%>"/></td>
				</tr>
			</table>
			<p class="btn">
				<input type="submit" value="确定"/>&nbsp;&nbsp; <input
					type="reset" value="重置"/> <a href="getbooks.jsp">返回>></a>
			</p>
		</form>
	</div>
</body>
</html>
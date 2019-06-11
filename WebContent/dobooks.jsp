<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="zym.Book"%>
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
	Connectdb dobooks = new Connectdb();
    Test t1 = new Test();
    request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	/* String name=request.getParameter("bookName");
	String sql = "select * from bookstore.books_table where bookName='"+name+"' ";
	List<Book> bookslist = t1.getBook(sql); */
	if (action == null)
		action = "";
	if (action.equals("delete")) { //删除商品
		/* ArrayList bookslist = (ArrayList) session
				.getAttribute("bookslist"); */
				Book bk=new Book();
		//String name=request.getParameter("bookName");
		String sql5 = "select * from bookstore.books_table";
		List<Book> bookslist = t1.getBook(sql5);
		int myid = MyTools.strToint(request.getParameter("id"));
		System.out.println(myid);
		Book book = (Book) bookslist.get(myid);
		
		int bookId = book.getBookId();
		String sql = "delete from books_table where bookId='" + bookId + "'";
		dobooks.executeUpdate(sql);
		response.sendRedirect("getbooks.jsp");
		
	} /* else if (action.equals("update")) { //更新商品信息
		String bookId = request.getParameter("bookId");
		String bookType = request.getParameter("bookType");
		String bookName = MyTools.toChinese(request.getParameter("bookName"));
		String bookAuthor = MyTools.toChinese(request.getParameter("bookAuthor"));
		String bookPublish = MyTools.toChinese(request.getParameter("bookPublish"));
		double bookPrice = Double.parseDouble(request.getParameter("bookPrice"));
		int bookCount = Integer.parseInt(request.getParameter("bookCount"));
		String sql2 = "update books_table set bookId='" + bookId + "',bookType='" + bookType 
				+ "',bookName='" + bookName + "',bookAuthor='" + bookAuthor 
				+ "',bookPublish='" + bookPublish +"',bookPrice=" + bookPrice + ",bookCount=" + bookCount
				+ " where bookId='" + bookId + "'";
		dobooks.executeUpdate(sql2);
		response.sendRedirect("getbooks.jsp");
	} */
	else if (action.equals("update")) { //更新商品信息
		String bookId = request.getParameter("bookId");
		String bookType = request.getParameter("bookType");
		String bookName = new String(request.getParameter("bookName").getBytes("UTF-8"),"UTF-8");
		String  bookAuthor = new String(request.getParameter("bookAuthor").getBytes("UTF-8"),"UTF-8");
		String bookPublish = new String(request.getParameter("bookPublish").getBytes("UTF-8"),"UTF-8");
		double bookPrice = Double.parseDouble(request.getParameter("bookPrice"));
		int bookCount = Integer.parseInt(request.getParameter("bookCount"));
		String sql2 = "update books_table set bookId='" + bookId + "',bookType='" + bookType 
				+ "',bookName='" + bookName + "',bookAuthor='" + bookAuthor 
				+ "',bookPublish='" + bookPublish +"',bookPrice=" + bookPrice + ",bookCount=" + bookCount
				+ " where bookId='" + bookId + "'";
		dobooks.executeUpdate(sql2);
		response.sendRedirect("getbooks.jsp");
	}
	else if (action.equals("add")) { //新增商品
		// 新建一个SmartUpload对象
		SmartUpload su = new SmartUpload();
		// 上传初始化
		su.initialize(pageContext);
		// 设定上传限制
		// 1.限制每个上传文件的最大长度。
		su.setMaxFileSize(10000000);
		// 2.限制总上传数据的长度。
		su.setTotalMaxFileSize(20000000);	
		// 上传文件
		su.upload();
		// 将上传文件全部保存到指定目录
		//int count = su.save("//booksImg");
		int count = su.save("d:"+"\\"+"booksImg");
		com.jspsmart.upload.File file = su.getFiles().getFile(0);
		String sql6 = "select * from bookstore.books_table";
		List<Book> bookslist = t1.getBook(sql6);
		/* ArrayList bookslist = (ArrayList) session
				.getAttribute("bookslist"); */
		Integer bookId = MyTools.strToint(su.getRequest().getParameter("bookId"));
		String bookType = su.getRequest().getParameter("bookType");
		String bookName = su.getRequest().getParameter("bookName");
		String bookAuthor = su.getRequest().getParameter("bookAuthor");
		String bookPublish = su.getRequest().getParameter("bookPublish");
		String bookInfo = su.getRequest().getParameter("bookInfo");
		String bookImg = file.getFileName();
		Double bookPrice = Double.parseDouble(su.getRequest().getParameter("bookPrice"));
		int bookCount = Integer.parseInt(su.getRequest().getParameter("bookCount"));
		for (int i = 0; i < bookslist.size(); i++) {
			Book book = (Book) bookslist.get(i);
			if (bookId.equals(book.getBookId())) {
%>
			<script type="text/javascript">
				alert("您输入的书籍编码已存在！");
				window.location.href="addbooks.jsp";
			</script>
<%
				return;
			}
		}
		String sql3 = "insert IGNORE into books_table values('" + bookId + "','" + bookName + "','" + bookType + "','" 
				+ bookAuthor + "','" + bookPublish + "','" + bookPrice + "','" + bookCount + "','" + bookImg + "')";
		dobooks.executeUpdate(sql3);
		String sql8="insert IGNORE into book_info values('" + bookId + "','" + bookName + "','"  + bookInfo + "')";
		dobooks.executeUpdate(sql8);
		response.sendRedirect("addbooks.jsp");
	} else {
		response.sendRedirect("bookinfo.jsp");
	}
%>
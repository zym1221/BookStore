<%@page import="sun.misc.Signal"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="zym.Book"%>
<%@ page import="java.sql.*"%>
<%@ page import="zym.Connectdb"%>
<%
		//String sql = "select * from books_table";
		String sql = "select books_table.bookId,type_table.typeName,books_table.bookName,"+
				"books_table.bookAuthor,books_table.bookPublish,books_table.bookImg,books_table.bookPrice,books_table.bookCount "+
				"from books_table,type_table where books_table.bookType=type_table.bookType";
		Connectdb baseConnection = new Connectdb();
		ResultSet rs = baseConnection.executeQuery(sql);//执行SQL语句并取得结果集
	%>
<% ArrayList <Book> bookslist = new ArrayList <Book> (); //用来存储商品
		while(rs.next()){
			//定义一个Book类对象来封装商品信息			
			Book bk = new Book();
        	bk.setBookId(rs.getInt("bookId"));
        	bk.setBookName(rs.getString("bookName"));
        	//bk.setBookType(rs.getString("bookType"));
        	bk.setBookAuthor(rs.getString("bookAuthor"));
        	bk.setBookPublish(rs.getString("bookPublish"));
        	bk.setBookImg(rs.getString("bookImg"));
        	bk.setBookPrice(rs.getDouble("bookPrice"));
        	bk.setBookCount(rs.getInt("bookCount"));
        	//bk.setBookInfo(rs.getString("bookInfo"));
            bookslist.add(bk);
	}%>
<%
	session.setAttribute("bookslist", bookslist); //保存商品列表到session中
	response.sendRedirect("admin.jsp"); //跳转到booksinfo.jsp页面显示商品
%>
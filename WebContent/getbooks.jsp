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
		ResultSet rs = baseConnection.executeQuery(sql);//ִ��SQL��䲢ȡ�ý����
	%>
<% ArrayList <Book> bookslist = new ArrayList <Book> (); //�����洢��Ʒ
		while(rs.next()){
			//����һ��Book���������װ��Ʒ��Ϣ			
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
	session.setAttribute("bookslist", bookslist); //������Ʒ�б�session��
	response.sendRedirect("admin.jsp"); //��ת��booksinfo.jspҳ����ʾ��Ʒ
%>
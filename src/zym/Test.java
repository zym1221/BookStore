package zym;

import zym.Book;
import zym.Order;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Test {
	public Test() {
		// TODO Auto-generated constructor stub
	}

	public static Connection getConnection() throws SQLException,ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");  
		String url = "jdbc:mysql://localhost:3306/bookstore?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
		return DriverManager.getConnection(url, "root", "037441zym");
		//����URLΪ   jdbc:mysql//��������ַ/���ݿ���  �������2�������ֱ��ǵ�½�û���������

	}
	public List<Order> getOrder(String sql) throws SQLException, ClassNotFoundException {
        //��ѯ����ִ�н��Ϊһ����񣬼�����鼮����ļ��ϣ����п��Դ��������б�������洢
        List<Order> lst = new ArrayList<Order>();
        //��ȡ���Ӷ���
        Connection conn = getConnection();
        try {
            //���Ӷ���conn����createStatement()����������һ��ִ��SQL���Ķ���st
            Statement st = conn.createStatement();
            //ִ��SQL���Ķ���st����executeQuery()������ִ�в�ѯ��䣬����ѯ���Ľ�����ص�һ���������
            ResultSet rs = st.executeQuery(sql);
            //�������������
            while(rs.next()){
            	Order order = new Order();
            	order.setOrderId(rs.getInt("orderId"));
            	order.setBookId(rs.getInt("bookId"));
            	order.setName(rs.getString("name"));
            	order.setAddress(rs.getString("address"));
            	order.setSalesDate(rs.getString("SalesDate"));
            	order.setExpress(rs.getString("express"));
            	order.setTelephone(rs.getString("telephone"));
            	order.setStatus(rs.getString("status"));
            	//bk.setBookInfo(rs.getString("bookInfo"));
                lst.add(order);
            }
            
        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally {
            //��Դʹ����֮�����û�йرգ�����Ҫ�ر�
            if (conn!=null){
                conn.close();
            }
        }
        return lst;
    }
	
	public List<Book> getBook(String sql) throws SQLException, ClassNotFoundException {
        //��ѯ����ִ�н��Ϊһ����񣬼�����鼮����ļ��ϣ����п��Դ��������б�������洢
        List<Book> lst = new ArrayList<Book>();
        //��ȡ���Ӷ���
        Connection conn = getConnection();
        try {
            //���Ӷ���conn����createStatement()����������һ��ִ��SQL���Ķ���st
            Statement st = conn.createStatement();
            //ִ��SQL���Ķ���st����executeQuery()������ִ�в�ѯ��䣬����ѯ���Ľ�����ص�һ���������
            ResultSet rs = st.executeQuery(sql);
            //�������������
            while(rs.next()){
            	Book bk = new Book();
            	bk.setBookId(rs.getInt("bookId"));
            	bk.setBookName(rs.getString("bookName"));
            	bk.setBookType(rs.getString("bookType"));
            	bk.setBookAuthor(rs.getString("bookAuthor"));
            	bk.setBookPublish(rs.getString("bookPublish"));
            	bk.setBookImg(rs.getString("bookImg"));
            	bk.setBookPrice(rs.getDouble("bookPrice"));
            	bk.setBookCount(rs.getInt("bookCount"));
            	//bk.setBookInfo(rs.getString("bookInfo"));
                lst.add(bk);
            }
            /*if(!rs.next()){
            	System.out.println("�����鼮�����ڣ�����������������");
            	//System.out.println("document.write('<div>" + "�����鼮�����ڣ�����������������" + "</div>');");
            }else {
            	Book bk = new Book();
            	bk.setBookId(rs.getInt("bookId"));
            	bk.setBookName(rs.getString("bookName"));
            	bk.setBookType(rs.getString("bookType"));
            	bk.setBookAuthor(rs.getString("bookAuthor"));
            	bk.setBookPublish(rs.getString("bookPublish"));
            	bk.setBookImg(rs.getString("bookImg"));
            	bk.setBookPrice(rs.getDouble("bookPrice"));
            	bk.setBookCount(rs.getInt("bookCount"));
            	bk.setBookInfo(rs.getString("bookInfo"));
                lst.add(bk);
            }*/
        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally {
            //��Դʹ����֮�����û�йرգ�����Ҫ�ر�
            if (conn!=null){
                conn.close();
            }
        }
        return lst;
    }

	
	public List<Book> getBook2(String sql) throws SQLException, ClassNotFoundException {
        //��ѯ����ִ�н��Ϊһ����񣬼����ѧ������ļ��ϣ����п��Դ��������б�������洢
        List<Book> lst = new ArrayList<Book>();
        //��ȡ���Ӷ���
        Connection conn = getConnection();
        try {
            //���Ӷ���conn����createStatement()����������һ��ִ��SQL���Ķ���st
            Statement st = conn.createStatement();
            //ִ��SQL���Ķ���st����executeQuery()������ִ�в�ѯ��䣬����ѯ���Ľ�����ص�һ���������
            ResultSet rs = st.executeQuery(sql);
            //�������������
            while(rs.next()){
            	Book bk = new Book();
            	bk.setBookId(rs.getInt("bookId"));
            	bk.setBookName(rs.getString("bookName"));
            	bk.setBookType(rs.getString("typeName"));
            	bk.setBookAuthor(rs.getString("bookAuthor"));
            	bk.setBookPublish(rs.getString("bookPublish"));
            	bk.setBookImg(rs.getString("bookImg"));
            	bk.setBookPrice(rs.getDouble("bookPrice"));
            	bk.setBookCount(rs.getInt("bookCount"));
            	//bk.setBookInfo(rs.getString("bookInfo"));
                lst.add(bk);
            }
            /*if(!rs.next()){
            	System.out.println("�����鼮�����ڣ�����������������");
            	//System.out.println("document.write('<div>" + "�����鼮�����ڣ�����������������" + "</div>');");
            }else {
            	Book bk = new Book();
            	bk.setBookId(rs.getInt("bookId"));
            	bk.setBookName(rs.getString("bookName"));
            	bk.setBookType(rs.getString("bookType"));
            	bk.setBookAuthor(rs.getString("bookAuthor"));
            	bk.setBookPublish(rs.getString("bookPublish"));
            	bk.setBookImg(rs.getString("bookImg"));
            	bk.setBookPrice(rs.getDouble("bookPrice"));
            	bk.setBookCount(rs.getInt("bookCount"));
            	bk.setBookInfo(rs.getString("bookInfo"));
                lst.add(bk);
            }*/
        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally {
            //��Դʹ����֮�����û�йرգ�����Ҫ�ر�
            if (conn!=null){
                conn.close();
            }
        }
        return lst;
    }


	public boolean executeDML(String sql, Object[] args) throws SQLException,
			ClassNotFoundException {
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setObject(1, args[0]);
		pstmt.setObject(2, args[1]);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			return true;
		} else {
			return false;
		}
	}
	public boolean executeDML1(String sql, String args) throws SQLException,
	ClassNotFoundException {
          Connection conn = getConnection();
          PreparedStatement pstmt = conn.prepareStatement(sql);
          pstmt.setObject(1, args);
          ResultSet rs = pstmt.executeQuery();
          if (rs.next()) {
	          return true;
          } else {
	          return false;
          }
     }

	public boolean executeREG(String sql, Object[] args) throws SQLException,
			ClassNotFoundException {
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setObject(1, args[0]);
		pstmt.setObject(2, args[1]);
		pstmt.setObject(3, args[2]);
		pstmt.setObject(4, args[3]);
		//pstmt.setObject(5, args[4]);
		int rs = pstmt.executeUpdate();
		if (rs > 0) {
			return true;
		} else {
			return false;
		}

	}

}
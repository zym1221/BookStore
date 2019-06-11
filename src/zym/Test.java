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
		//连接URL为   jdbc:mysql//服务器地址/数据库名  ，后面的2个参数分别是登陆用户名和密码

	}
	public List<Order> getOrder(String sql) throws SQLException, ClassNotFoundException {
        //查询语句的执行结果为一个表格，即多个书籍对象的集合，所有可以创建数组列表对象来存储
        List<Order> lst = new ArrayList<Order>();
        //获取连接对象
        Connection conn = getConnection();
        try {
            //连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
            Statement st = conn.createStatement();
            //执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
            ResultSet rs = st.executeQuery(sql);
            //遍历结果集对象
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
            //资源使用完之后，如果没有关闭，则需要关闭
            if (conn!=null){
                conn.close();
            }
        }
        return lst;
    }
	
	public List<Book> getBook(String sql) throws SQLException, ClassNotFoundException {
        //查询语句的执行结果为一个表格，即多个书籍对象的集合，所有可以创建数组列表对象来存储
        List<Book> lst = new ArrayList<Book>();
        //获取连接对象
        Connection conn = getConnection();
        try {
            //连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
            Statement st = conn.createStatement();
            //执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
            ResultSet rs = st.executeQuery(sql);
            //遍历结果集对象
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
            	System.out.println("查找书籍不存在！请重新输入书名！");
            	//System.out.println("document.write('<div>" + "查找书籍不存在！请重新输入书名！" + "</div>');");
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
            //资源使用完之后，如果没有关闭，则需要关闭
            if (conn!=null){
                conn.close();
            }
        }
        return lst;
    }

	
	public List<Book> getBook2(String sql) throws SQLException, ClassNotFoundException {
        //查询语句的执行结果为一个表格，即多个学生对象的集合，所有可以创建数组列表对象来存储
        List<Book> lst = new ArrayList<Book>();
        //获取连接对象
        Connection conn = getConnection();
        try {
            //连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
            Statement st = conn.createStatement();
            //执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
            ResultSet rs = st.executeQuery(sql);
            //遍历结果集对象
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
            	System.out.println("查找书籍不存在！请重新输入书名！");
            	//System.out.println("document.write('<div>" + "查找书籍不存在！请重新输入书名！" + "</div>');");
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
            //资源使用完之后，如果没有关闭，则需要关闭
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
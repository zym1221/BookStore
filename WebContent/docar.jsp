<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@ page import="zym.Book"%>
<%@ page import="zym.Test"%>
<%@ page import="zym.MyTools"%>
<%@ page import="zym.Connectdb"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List" %>
<jsp:useBean id="myCar" class="zym.ShopCar" scope="session" />

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<%	request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	int num = MyTools.strToint(request.getParameter("num"));
	String bookid=request.getParameter("bookId");
	Test t1 = new Test();
    request.setCharacterEncoding("utf-8");
    String sql = "select * from bookstore.books_table where bookId='"+bookid+"' ";
	System.out.println(num);
	int id = MyTools.strToint(request.getParameter("id"));
	 List<Book> bookslist = t1.getBook(sql);
	if (action == null)
		action = "";
	if (action.equals("buy")) { 
        
        //购买商品
		 for (Book book : bookslist) {
		if(book.getBookCount()>num){
			book.setBookNum(num);
			myCar.addItem(book); //调用ShopCar类中的addItem()方法添加商品
			book.setBookCount(book.getBookCount()-num);//点击购买，从数据库获取的结果集中的库存缓存减1；
		}else{
			book.setBookCount(0); //如果库存数量为0，则不能购买
		}
		response.sendRedirect("shopcar.jsp");
		 }
	} else if (action.equals("remove")) { //移除商品
		//ArrayList bookslist = (ArrayList) session.getAttribute("bookslist");
		String bookName = request.getParameter("bookName"); //获取商品name
		int bookId = MyTools.strToint(request.getParameter("bookId"));
		for(int i=0;i<bookslist.size();i++){
			Book book = (Book) bookslist.get(i);
			if(book.getBookId().equals(bookId)){
				book.setBookCount(book.getBookCount()+1);
			}

		}
		myCar.removeItem(bookId); //调用ShopCar类中的removeItem()方法移除商品
		response.sendRedirect("shopcar.jsp");
	} else if (action.equals("clear")) { //清空购物车
		//ArrayList bookslist = (ArrayList) session.getAttribute("bookslist");
		ArrayList buylist = (ArrayList)session.getAttribute("buylist");
		for(int i=0;i<buylist.size();i++){
			Book buytemp = (Book) buylist.get(i);
			for(int j = 0;j<bookslist.size();j++){
				Book book = (Book) bookslist.get(j);
				if(buytemp.getBookId().equals(book.getBookId())){
					book.setBookCount(book.getBookCount()+buytemp.getBookNum());
				}
			}
		}
		myCar.clearCar(); //调用ShopCar类中的clearCar()方法清空购物车
		response.sendRedirect("shopcar.jsp");
	}else if(action.equals("pay")){
		request.setCharacterEncoding("utf-8");
     	response.setCharacterEncoding("utf-8");
		Connectdb update1=new Connectdb();
		ArrayList buylist = (ArrayList)session.getAttribute("buylist");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String telephone=request.getParameter("telephone");
		String express=new String("暂无快递");
		String status=new String("待发货");
		
		for(int i=0;i<buylist.size();i++){
			Book buytemp = (Book) buylist.get(i);
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date mydate = new Date();
					String date = dateFormat.format(mydate);
					Integer bookId = buytemp.getBookId();
					int bookNum = buytemp.getBookNum();
					String sql1="update books_table set bookCount=bookCount-"+bookNum+" where bookId='"+bookId+"'";
					update1.executeUpdate(sql1);
					String bookName = buytemp.getBookName();
					String bookType = buytemp.getBookType();
					String sql2 = "select * from sales_table where bookId = '"+ bookId+"'";
					ResultSet rs = update1.executeQuery(sql2);
					if(rs.next()){
						String sql3 = "update sales_table set sales=sales+"+bookNum+" where bookId='"+bookId+"'";
						update1.executeUpdate(sql3);
					}else{
						String sql4 = "insert into sales_table values('" + bookId + "','" + bookName + "','" + bookType + "'," 
								+ bookNum + ")";
						update1.executeUpdate(sql4);
					}
					String sql5 = "insert into sales_date(bookId,bookName,bookType,sales,salesDate) values('" 
							+ bookId + "','" + bookName + "','" + bookType + "'," + bookNum + ",'" + date + "')";
					update1.executeUpdate(sql5);
					System.out.println("插入成功！");
					
					String sql7="insert into order_table(bookId,name,address,salesDate,express,status,telephone) values('" 
							+ bookId + "','" + name + "','" + address + "','" + date + "','" + express + "','" + status + "','" + telephone + "')";
					update1.executeUpdate(sql7);
					System.out.println("插入成功！");
		}
		myCar.clearCar(); //调用ShopCar类中的clearCar()方法清空购物车
		response.sendRedirect("shopcar.jsp");
	} else {
		response.sendRedirect("index.jsp");
	}

%>
</body>
</html>
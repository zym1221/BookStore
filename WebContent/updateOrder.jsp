<%@page import="zym.Order"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="zym.Test" %>
<%@ page import="zym.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.*" %> 
<%@ page import="zym.Connectdb"%>
<%@ page import="java.sql.ResultSet"%>
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
      /* .getback{
	display:inline-block;
	height:20px;
	line-height:20px;
	margin:0 10px;
	text-decoration:none;
	position:fixed;
	right:20px;
	
	}  */

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

<table border="1" cellspacing="0">
		<td colspan="9" align="center" class="title">订单信息如下</td>
	</tr>
	<tr align="center"  bgcolor="lightgrey">
		<td>订单编号</td>
		<td>图书编码</td>
		<td>收货人</td>
		<td>收货地址</td>
		<td>下单日期</td>
		<td>物流</td>
		<td>订单状态</td>
		<td>收货电话</td>
		<td>更新</td>
	</tr>

    <%
    Test t1 = new Test();
    //String sql = "select * from bookstore.books_table";
    String sql = "select * from bookstore.order_table";
    List<Order> lst = t1.getOrder(sql);
    for(int i=0;i<lst.size();i++){
    	Order bk = lst.get(i);

    	%>
    	<tr height="60" align="center">
    	<td><%=bk.getOrderId()%></td>
		<td><%=bk.getBookId()%></td>
		<td><%=bk.getName()%></td>
		<td><%=bk.getAddress()%></td>
		<td><%=bk.getSalesDate()%></td>
		<td><%=bk.getExpress()%></td>
		<td><%=bk.getStatus()%></td>
		<td><%=bk.getTelephone()%></td>
	    <%-- <td onclick="demo(this);"><a href="<%= bk.getBookInfo() %>"><%=bk.getBookName()%>详细信息</a></td> --%>
	    <td><a href="update_order.jsp?id=<%=i %>">修改订单</a></td>
	</tr>
	<%
		}
	%>
	
	</table>
	<a class="getback" href="admin.jsp">返回</a>
	</body>
<%
	session.setAttribute("bookslist", bookslist);
%>
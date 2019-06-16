<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.data.general.DefaultPieDataset" %>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation" %>
<%@ page import="org.jfree.chart.entity.StandardEntityCollection" %>
<%@ page import="org.jfree.chart.ChartRenderingInfo" %>
<%@ page import="org.jfree.chart.servlet.ServletUtilities" %>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@ page import="org.jfree.chart.StandardChartTheme"%>
<%@ page import="java.awt.Font"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List" %>
<%@ page import="zym.SaleSingle" %>
<%@ page import="zym.StatisticSingle" %>
<%@ page import="zym.MyTools"%>
<%@ page import="zym.Connectdb"%>
<%
  float numAll=0;
  String sql="select type_table.typeName,sum(sales) as salesTotal from sales_table,type_table "+
  "where sales_table.bookType=type_table.bookType group by sales_table.bookType";
  Connectdb connection = new Connectdb();
  ResultSet rs = connection.executeQuery(sql);//ִ��SQL��䲢ȡ�ý����
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>ͼ����ʾ���۽��</title>
	<link style="text/css" rel="stylesheet" href="css/statistic.css"/>
    <script type="text/javascript">
         
    // JSʵ��ѡ��л�
        window.onload = function(){
             var oTab = document.getElementById("tabs");
             var oUl = oTab.getElementsByTagName("ul")[0];
             var oLis = oUl.getElementsByTagName("li");
             var oDivs= oTab.getElementsByTagName("div");

             for(var i= 0,len = oLis.length;i<len;i++){
                 oLis[i].index = i;
                 oLis[i].onclick = function() {
                     for(var n= 0;n<len;n++){
                         oLis[n].className = "";
                         oDivs[n].className = "hide";
                     }
                     this.className = "on";
                     oDivs[this.index].className = "";
                 };
             };
        };
    
 	</script>
 </head>
<body>
<%
	ArrayList <StatisticSingle> saleslist = new ArrayList <StatisticSingle> (); //�����洢��Ʒ
	while(rs.next()){
		//����һ��BookSingle���������װ��Ʒ��Ϣ			
		StatisticSingle single = new StatisticSingle();
		single.setTypeName(rs.getString("typeName"));
		single.setSalesCount(rs.getInt("salesTotal"));
		saleslist.add(single); //������Ʒ��saleslist���϶�����
}
%>

<!-- HTMLҳ�沼�� -->
<div id="tabs">
	<h3 class="title">����ͳ�ƽ����ʾ</h3>
	<hr/>
    <ul>
        <li class="on">����ͳ��</li>
        <!-- <li>����ͼ</li>
        <li>��ͼ</li> -->
    </ul>
    <div>
    	<table width="400">
    		<tr height="40" style="color:black;">
    			<td>���</td><td width="30%" align="right">����&nbsp;&nbsp;</td><td colspan="2">&nbsp;</td>
    		</tr>
         	<% if(saleslist==null||saleslist.size()==0){ %>
         	<tr height="200"><td align="center" colspan="4">û��ѡ�����ʾ��</td></tr>
         	<% 
         	}else{
              	int i=0;
              	int j=0;
              	while(j<saleslist.size()){
              		StatisticSingle single=(StatisticSingle)saleslist.get(j);
              		numAll += single.getSalesCount();
              		j++;
              	}
              	while(i<saleslist.size()){
              		StatisticSingle single=(StatisticSingle)saleslist.get(i);
         		    int numOne= single.getSalesCount();
         		    float picLen=numOne*145/numAll;						//����ͼƬ����
         		    float per=numOne*100/numAll;							//����Ʊ����ռ�İٷֱ�
         		    float doPer=((int)((per+0.05f)*10))/10f;				//�����ٷֱȺ��һλС������������������
         	%>
         	<tr height="30">
         		<td><%=single.getTypeName() %></td>
            	<td width="30%" align="right"><%=single.getSalesCount() %> ��&nbsp;&nbsp;</td> 
         		<td><img src="images/count.jpg" width="<%=picLen%>" height="15" alt="��״ͼ��<%=single.getTypeName()%>"/></td>
                <td width="15%" align="right"><%=doPer%>%</td>
         	</tr>                        
         	<% 
              		i++;
             	}
         	} 
         	%>
         	<tr height="40">
		 		<td colspan="4" align="center"><a href="salesinfo.jsp" class="getback">����</a></td>
         	</tr>
         </table>
    </div>
    <%
    StandardChartTheme standardChartTheme = new StandardChartTheme("CN");		//����������ʽ
    standardChartTheme.setExtraLargeFont(new Font("����", Font.BOLD, 20)); 		//���ñ�������
    standardChartTheme.setRegularFont(new Font("΢���ź�", Font.PLAIN, 15)); 		//����ͼ��������
    standardChartTheme.setLargeFont(new Font("΢���ź�", Font.PLAIN, 15)); 		//�������������
    ChartFactory.setChartTheme(standardChartTheme);							//����������ʽ
    DefaultCategoryDataset dataset1=new DefaultCategoryDataset();
	for(int i=0;i<saleslist.size();i++){
		StatisticSingle single1=(StatisticSingle)saleslist.get(i);
		dataset1.addValue(single1.getSalesCount(),"", single1.getTypeName());
	}
	//����JFreeChart�����ͼ�����
	JFreeChart chart=ChartFactory.createBarChart3D(
									"��ͬ���ͼ������",		//ͼ�����
									"���",		//x�����ʾ����
									"����",			//y�����ʾ����
									dataset1,	//���ݼ�
									PlotOrientation.VERTICAL,//ͼ����(��ֱ)
									false,		//�Ƿ����ͼ��
									false,		//�Ƿ������ʾ
									false		//�Ƿ����URL
									);
	//����ͼ����ļ���
	// �̶��÷�
	ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
	String fileName=ServletUtilities.saveChartAsPNG(chart,400,270,info,session);
	String url=request.getContextPath()+"/servlet/DisplayChart?filename="+fileName;
	%>
    <div class="hide">
		<img alt="����ͳ��" src="<%=url%>"/>
		<br/>
		<a href="salesinfo.jsp" class="getback">����</a>
    </div>
    <%
    
	DefaultPieDataset dataset2=new DefaultPieDataset();
    for(int i=0;i<saleslist.size();i++){
    	StatisticSingle single2=(StatisticSingle)saleslist.get(i);
    	dataset2.setValue(single2.getTypeName(), single2.getSalesCount());
    }
	//����JFreeChart�����ͼ�����
	JFreeChart chart2=ChartFactory.createPieChart(
										"��ͬ���ͼ������",	//ͼ�����
										dataset2,				//���ݼ�
										true,					//�Ƿ����ͼ��
										false,					//�Ƿ����ͼ��˵��
										false					//�Ƿ��������
										);
	//����ͼ����ļ���
	// �̶��÷�
	ChartRenderingInfo info2 = new ChartRenderingInfo(new StandardEntityCollection());
	String fileName2=ServletUtilities.saveChartAsPNG(chart2,400,270,info2,session);
	String url2=request.getContextPath()+"/servlet/DisplayChart?filename="+fileName2;
	%>
    <div class="hide">
		<img alt="����ͳ��" src="<%=url2 %>"/>
		<br/>
		<a href="salesinfo.jsp" class="getback">����</a>
    </div>
    
</div>
</body>
</html>
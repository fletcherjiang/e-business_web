<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>

<html>
	<head>
		<meta>
		<title>Happy ISD</title>
                <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<link href="web/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<link href="web/css/style.css" rel="stylesheet" type="text/css"/>
                <script src="web/js/jquery.js" type="text/javascript"></script>
		<script src="web/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
                <script>
                    
                     $(function(){
                        // var p=$(".contshop li").index();
                       // alert("dddd");
                         for(var i=0; i<$(".contshop li").length;i++){
                           
                             if(i%5==0){
                                 
                                 $(".contshop li").eq(i).addClass("cl");
                             }
                             
                         }
                        
                         
                         
                     })
                </script>
	</head>
	<body style="background-color: #fafafa;">
		
		<%@ include file="web/head.jsp"%>
		
		
		<div class="fenlei visible-lg-block" >
			<div class="fleft">
				
				
				
				
                                <a href="web/contentone.jsp?id=1">女装 / 内衣 / 家居</a>
				<a href="web/contentone.jsp?id=2">女鞋 / 男鞋 / 箱包</a>
				<a href="web/contentone.jsp?id=3">母婴 / 童装 / 玩具</a>
				<a href="web/contentone.jsp?id=4">男装 / 运动户外</a>
				<a href="web/contentone.jsp?id=5">美妆 / 彩妆 / 个护</a>
				<a href="web/contentone.jsp?id=6">手机 / 数码 / 企业</a>
				<a href="web/contentone.jsp?id=7">大家电 / 生活电器</a>
				<a href="web/contentone.jsp?id=8">零食 / 生鲜 / 茶酒</a>
				<a href="web/contentone.jsp?id=9">厨具 / 收纳 / 清洁</a>
				<a href="web/contentone.jsp?id=10">家纺 / 家饰 / 鲜花</a>
				<a href="web/contentone.jsp?id=11">图书音像 / 文具</a>
				<a href="web/contentone.jsp?id=12">医药保健 / 进口</a>
				<a href="web/contentone.jsp?id=13">汽车 / 二手车 / 用品</a>
				<a href="web/contentone.jsp?id=14">房产 / 装修家具 / 建材</a>
				<a href="web/contentone.jsp?id=15">手表 / 眼镜 / 珠宝饰品</a>
				
				
				
				
				
			</div>
			
			<div class="fmid">
				<div class="fmtop"><img src="web/images/b0.jpg" height="100%"/></div>
				<div class="fmbot"><img style="margin-left: 0px;" src="web/images/b1.jpg"/><img src="web/images/b2.jpg"/></div>
			</div>
			
			<div class="fright">
				<div class="frtop">
                                        
					<h2>GROUP 4</h2>
                                        <li>AST20201 Web Programming</li>
                                        <li>Angel: Bell Liu</li>
					<li>Group member</li>
					<li>JIANG Yiyang</li>
					<li>HUANG Yiting</li>
					<li>CHUNG Wing Hei</li>
					<li>QIAN Weifeng</li>
					<li>Yung Kam Kong</li>
					
					
				</div>
				
				<div class="frbot">
					<img src="web/images/b3.jpg"/>
					<img src="web/images/b4.jpg"/>
				</div>
				
			</div>
			
		</div>
		
		
		<div class="contshop visible-lg-block">
			<h3>热卖单品</h3>
                        
                        <jsp:useBean id="test" class="conns.ConnSql"/>
						    <%
       
                                                        Connection one=test.getConnection();//获取getConnection()方法
                                                        Statement statement = one.createStatement();//获取操作数据库的对象
                                                            String sql="select * from commodity limit 15";
                                                            ResultSet resultSet = statement.executeQuery(sql);//执行sql，获取结果集

                                                            while(resultSet.next()){ //遍历结果集，取出数据

                                                               int sid = resultSet.getInt("cid");//测试输出
                                                               String title = resultSet.getString("title");
                                                               String price = resultSet.getString("price");
                                                               String stock = resultSet.getString("stock");
                                                               String images = resultSet.getString("images");
                                                                //输出数据
                                                              // out.println(test_name);
                                                             out.println("<li>");
                                                             out.println("<a href='web/content.jsp?id="+sid+"' target='_blank'>");
                                                             out.println("<img src='./upload/"+images+"'/>");
                                                             out.println("<h4>"+title+"</h4>");
                                                             out.println("<span>￥"+price+"</span>");
                                                             out.println("</a>");
                                                             out.println("</li>");

                                                            }
        
       

    
                                                          %>
                        
                        
                        
			
			
		</div>
		
                
                                                          
                                                          
                                                          
                                                          
                <div class="contshopbt hidden-lg">
			
                        
                      
						    <%
       
                                                          String sqls="select * from commodity limit 15";
                                                            ResultSet resultSets = statement.executeQuery(sqls);//执行sql，获取结果集

                                                            while(resultSets.next()){ //遍历结果集，取出数据

                                                               int sids = resultSets.getInt("cid");//测试输出
                                                               String titles = resultSets.getString("title");
                                                               String prices = resultSets.getString("price");
                                                               String stocks = resultSets.getString("stock");
                                                               String imagess = resultSets.getString("images");
                                                                //输出数据
                                                              // out.println(test_name);
                                                             out.println("<li>");
                                                             out.println("<a href='web/content.jsp?id="+sids+"' target=''>");
                                                             out.println("<img src='./upload/"+imagess+"'/>");
                                                             out.println("<h4>"+titles+"</h4>");
                                                             out.println("<span>￥"+prices+"</span>");
                                                             out.println("</a>");
                                                             out.println("</li>");

                                                            }
        
       

    
                                                          %>
                        
                        
                        
			
			
		</div>
                
                
                <%@ include file="web/footer.jsp"  %>
		
	</body>
</html>

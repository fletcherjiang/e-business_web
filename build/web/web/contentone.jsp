<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>

<html>
	<head>
		<meta>
		<title>Happy ISD</title>
                <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<link href="css/style.css" rel="stylesheet" type="text/css"/>
		<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
                <script src="web/js/jquery.js" type="text/javascript"></script>
		
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
		
		<%@ include file="top.jsp"%>
		
		
		
		
		
		<div class="contshop">
			<h3>热卖单品</h3>
                        
                        <jsp:useBean id="test" class="conns.ConnSql"/>
						    <%
       
                                                           Connection one=test.getConnection();//获取getConnection()方法
                                                            Statement statement = one.createStatement();//获取操作数据库的对象
                                                            String id= request.getParameter("id");
                                                            String sql="select * from commodity where classes="+id;
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
                                                             out.println("<a href='content.jsp?id="+sid+"' target='_blank'>");
                                                             out.println("<img src='../upload/"+images+"'/>");
                                                             out.println("<h4>"+title+"</h4>");
                                                             out.println("<span>￥"+price+"</span>");
                                                             out.println("</a>");
                                                             out.println("</li>");

                                                            }
        
       

    
                                                          %>
                        
                        
                        
			
			
		</div>
		
                
                
                
                <%@ include file="footers.jsp"  %>
		
	</body>
</html>

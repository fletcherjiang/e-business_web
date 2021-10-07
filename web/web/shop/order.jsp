<%-- 
    Document   : shops
    Created on : 2021-4-18, 7:35:38
    Author     : admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<title>Happy ISD</title>
		<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<link href="../css/admin.css" rel="stylesheet" type="text/css"/>
		<script src="../js/jquery.js" type="text/javascript"></script>
		<script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script>
			$(function(){
				$(".login_cont").height($(window).height());
			})
			
		</script>
	</head>
	<body>
		<div class="login_cont">
		
				<%@ include file='left.jsp' %>
				<div class="admin_right">
					 <div class="top_r"></div>
					 
					 <div class="table_r" style="display: block; height:600px; overflow-y:scroll;">
						 <h2 align="center">Order Message</h2>
						 
						  <hr style="border: 1px solid #ddd;"/>
						 
						 <!-- Single button -->
						
						 
						 
						 
						 
						 <table class="table table-striped" style="margin: 10px;">
						  <tr>
						 							   <th>Num</th>
													    
						 							   <th>Commodity Title</th> 
						 							   <th>Price</th> 
						 							   <th>Order Message</th> 
						 							  
						 							  
						  </tr>
                                                   <jsp:useBean id="test" class="conns.ConnSql"/>
						    <%
       
                                                        Connection one=test.getConnection();//获取getConnection()方法
                                                        Statement statement = one.createStatement();//获取操作数据库的对象
                                                            Object shopid=request.getSession().getAttribute("shop");
                                                            String sql=" select * from orders LEFT JOIN commodity on orders.cid=commodity.cid  where shops='"+shopid+"'";
                                                            //String sql=" select * from orders";
                                                            ResultSet resultSet = statement.executeQuery(sql);//执行sql，获取结果集

                                                            while(resultSet.next()){ //遍历结果集，取出数据

                                                              int sid = resultSet.getInt("oid");//测试输出
                                                               String title = resultSet.getString("title");
                                                               String price = resultSet.getString("price");
                                                               String address = resultSet.getString("address");
                                                               String phone = resultSet.getString("phone");
                                                                String username = resultSet.getString("username");
                                                                //输出数据
                                                             // out.println(test_name);
                                                             out.println("<tr>");
                                                            out.println("<td>"+sid+"</td>");
                                                           out.println("<td>"+title+"</td>");
                                                            out.println("<td>"+price+"</td>");
                                                             out.println("<td>"+username+phone+address+"</td>");
                                                            
                                                            
                                                             
                                                             
                                                             out.println("</tr>");

                                                            }
        
       

    
                                                          %>
						  
						 </table>
						 
					 </div>
					 
				</div>
	       </div>
	</body>
</html>

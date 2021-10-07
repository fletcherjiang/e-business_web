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
					 
					 <div class="table_r"  style="display: block; height:600px; overflow-y:scroll;">
						 <h2 align="center">Commodity management</h2>
						 
						  <hr style="border: 1px solid #ddd;"/>
						 
						 <!-- Single button -->
						 <div class="btn-group" style="margin: 10px;">
						   <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						     Add Commodity<span class="caret"></span>
						   </button>
						   <ul class="dropdown-menu">
						     <li><a href="addshops.jsp">Add Commodity</a></li>
						    
						   </ul>
						 </div>
						 
						 
						 
						 
						 <table class="table table-striped" style="margin: 10px;">
						  <tr>
						 							   <th>Num</th>
													    
						 							   <th>Commodity Title</th> 
						 							   <th>Price</th> 
						 							   <th>Stock</th> 
						 							  <th>Edit</th> 
						 							  
						 							   <th>Delete</th> 
						  </tr>
                                                   <jsp:useBean id="test" class="conns.ConnSql"/>
						    <%
       
                                                        Connection one=test.getConnection();//获取getConnection()方法
                                                        Statement statement = one.createStatement();//获取操作数据库的对象
                                                            String sql="select * from commodity";
                                                            ResultSet resultSet = statement.executeQuery(sql);//执行sql，获取结果集

                                                            while(resultSet.next()){ //遍历结果集，取出数据

                                                               int sid = resultSet.getInt("cid");//测试输出
                                                               String shopname = resultSet.getString("title");
                                                               String password = resultSet.getString("price");
                                                               String address = resultSet.getString("stock");
                                                              
                                                                //输出数据
                                                              // out.println(test_name);
                                                             out.println("<tr>");
                                                             out.println("<td>"+sid+"</td>");
                                                             out.println("<td>"+shopname+"</td>");
                                                             out.println("<td>"+password+"</td>");
                                                             out.println("<td>"+address+"</td>");
                                                            
                                                            out.println("<td><a href='editshops.jsp?id="+sid+"'>edit</a></td>");
                                                             out.println("<td><a href='../../DeleteShops?id="+sid+"'>delete</a></td>");
                                                             
                                                             out.println("</tr>");

                                                            }
        
       

    
                                                          %>
						  
						 </table>
						 
					 </div>
					 
				</div>
	       </div>
	</body>
</html>

<%-- 
    Document   : indexs
    Created on : 2021-4-16, 17:43:25
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
		                <!--引入左侧-->
                                <%@ include file='left.jsp' %>
				<div class="admin_right">
					 <div class="top_r"></div>
					 
					 <div class="table_r"  style="display: block; height:800px; overflow-y:scroll;">
						 <h2 align="center">user management</h2>
						 
						  <hr style="border: 1px solid #ddd;"/>
						 
						 <!-- Single button -->
						 <div class="btn-group" style="margin: 10px;">
						   <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						     Add User <span class="caret"></span>
						   </button>
						   <ul class="dropdown-menu">
						     <li><a href="add.jsp">Add</a></li>
						    
						   </ul>
						 </div>
						 
						 
						 
						 
						 <table class="table table-striped" style="margin: 10px;">
						  <tr>
							   <th>Num</th>
							   <th>Uername</th> 
							   <th>Password</th> 
							   <th>Email</th> 
							   <th>Phone</th> 
							   <th>Edit</th> 
							   <th>Delete</th> 
						  </tr>
						      
                                                      <jsp:useBean id="test" class="conns.ConnSql"/>
						     <%
       
                                                        Connection one=test.getConnection();//获取getConnection()方法
                                                        Statement statement = one.createStatement();//获取操作数据库的对象
                                                            String sql="select * from user";
                                                            ResultSet resultSet = statement.executeQuery(sql);//执行sql，获取结果集

                                                            while(resultSet.next()){ //遍历结果集，取出数据

                                                               int userid = resultSet.getInt("uid");//测试输出
                                                               String username = resultSet.getString("username");
                                                               String password = resultSet.getString("password");
                                                               String email = resultSet.getString("email");
                                                               String phone = resultSet.getString("phone");
                                                                //输出数据
                                                              // out.println(test_name);
                                                             out.println("<tr>");
                                                             out.println("<td>"+userid+"</td>");
                                                             out.println("<td>"+username+"</td>");
                                                             out.println("<td>"+password+"</td>");
                                                             out.println("<td>"+email+"</td>");
                                                             out.println("<td>"+phone+"</td>");
                                                             out.println("<td><a href='editone.jsp?id="+userid+"'>edit</a></td>");
                                                             out.println("<td><a href='../../DeleteOne?id="+userid+"'>delete</a></td>");
                                                             
                                                             out.println("</tr>");

                                                            }
        
       

    
                                                          %>
						     
						  
						 </table>
						 
					 </div>
					 
				</div>
	       </div>
	</body>
</html>

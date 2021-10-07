<%-- 
    Document   : editone
    Created on : 2021-4-16, 21:08:38
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
					 
					 <div class="table_r">
						 <h2 align="center">Add User</h2>
						 
						  <hr style="border: 1px solid #ddd;"/>
						 
						 <!-- Single button -->
						 <div class="btn-group" style="margin: 10px;">
						   <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    Add Shop <span class="caret"></span>
						   </button>
						   <ul class="dropdown-menu">
						     <li><a href="addshop.html">Add</a></li>
						    
						   </ul>
						 </div>
						 
						 
						 
						 <div class="add_user">
							 
							 
							 <form action="../../SupdateOne" method="post">
                                                              <jsp:useBean id="test" class="conns.ConnSql"/>
                                                                  <%
       
                                                        Connection one=test.getConnection();//获取getConnection()方法
                                                        Statement statement = one.createStatement();//获取操作数据库的对象
                                                        String id= request.getParameter("id");
                                                            String sql="select * from shop where sid="+id;
                                                            //String sql="select * from user";
                                                            ResultSet resultSet = statement.executeQuery(sql);//执行sql，获取结果集

                                                            while(resultSet.next()){ //遍历结果集，取出数据

                                                               int userid = resultSet.getInt("sid");//测试输出
                                                               String username = resultSet.getString("shopname");
                                                               String password = resultSet.getString("password");
                                                               String address = resultSet.getString("address");
                                                               String classes = resultSet.getString("classes");
                                                               String phone = resultSet.getString("phone");
                                                                //输出数据
                                                              // out.println(test_name);
                                                             
                                                             
                                                              out.println("</tr>");
                                                             
                                                              out.println("<div class='form-group'>");
                                                              out.println("<label for='exampleInputEmail1'>classes</label>");
                                                              out.println("<input type='text' class='form-control' id='exampleInputEmail1' name='classes' value='"+classes+"'/>");
                                                              out.println("</div>");
                                                                
                                                                
                                                                
                                                              out.println("<div class='form-group'>");
                                                              out.println("<label for='exampleInputEmail1'>User name</label>");
                                                              out.println("<input type='text' class='form-control' id='exampleInputEmail1' name='shopname' value='"+username+"'>");
                                                              out.println("</div>");
                                                              
                                                              out.println("<div class='form-group'>");
                                                              out.println("<label for='exampleInputPassword1'>Password</label>");
                                                              out.println(" <input type='password' class='form-control' id='exampleInputPassword1' name='password'  value='"+password+"'>");
                                                              out.println("</div>");
                                                               
                                                              out.println("<div class='form-group'>");
                                                              out.println("<label for='exampleInputPassword1'>Address</label>");
                                                              out.println("  <input type='text' class='form-control' id='exampleInputPassword1' name='address' value='"+address+"'>");
                                                              out.println("</div>");
                                                              
                                                              
                                                              out.println("<div class='form-group'>");
                                                              out.println("<label for='exampleInputPassword1'>Phone</label>");
                                                              out.println("  <input type='text' class='form-control' id='exampleInputPassword1' name='phone' value='"+phone+"'>");
                                                              out.println("</div>");
                                                                
                                                                 out.println("  <input type='hidden'  name='uid' value='"+userid+"'>");
                                                           
                                                              out.println("<button type='submit' class='btn btn-default'>Edit Shop</button>");
                                                             
                                                             
                                                             
                                                             
                                                             
                                                             

                                                            }
        
       

    
                                                          %>   
                                                       
                                                        
                                                        
                                                          
							 </form>
							 
						 </div>
						 
						 
						 
						 
						 
					 </div>
					 
				</div>
	       </div>
	</body>
</html>

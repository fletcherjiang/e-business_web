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
						     Edit Shop <span class="caret"></span>
						   </button>
						   <ul class="dropdown-menu">
						     <li><a href="editshop.jsp">Edit</a></li>
						    
						   </ul>
						 </div>
						 
						 
						 
						 <div class="add_user">
							 
							 
							 <form action="../../InsertShop" method="post">
							   <div class="form-group">
							     <label for="exampleInputEmail1">Shop Name</label>
                                                             <input type="text" class="form-control" id="exampleInputEmail1" name="shopname" placeholder="Shopname">
							   </div>
							   <div class="form-group">
							     <label for="exampleInputEmail1">Password</label>
                                                             <input type="password" class="form-control" id="exampleInputEmail2" name="password" placeholder="Password">
							   </div>
							   <div class="form-group">
							     <label for="exampleInputEmail1">Shop Address</label>
                                                             <input type="text" class="form-control" id="exampleInputEmail3" name="address" placeholder="Shop address">
							   </div>
							   
							   <div class="form-group">
							     <label for="exampleInputPassword1">	Industry classification</label>
                                                             <input type="text" class="form-control" id="exampleInputPassword1" name="classes" placeholder="Industry classification">
							   </div>
							   <div class="form-group">
							     <label for="exampleInputPassword1">Phone</label>
                                                             <input type="text" class="form-control" id="exampleInputPassword2" name="phone" placeholder="Phone">
							   </div>
							   <button type="submit" class="btn btn-default">Add Shop</button>
							
							 </form>
							 
						 </div>
						 
						 
						 
						 
						 
					 </div>
					 
				</div>
	       </div>
	</body>
</html>

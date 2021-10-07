<%-- 
    Document   : index
    Created on : 2021-4-16, 16:27:53
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
			<div class="denglu">
				
                            <form action="../../LoginShop" method="post">
					
				  <h3 style="color: #fff;" align="center">Shop Login</h3>	
				  <hr/>
				  <div class="form-group">
				    <label for="exampleInputEmail1" style="color: #fff;">Admin</label>
				    <input type="text" class="form-control" name="admin" id="exampleInputEmail1" placeholder="admin">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1" style="color: #fff;">Password</label>
				    <input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="Password">
				  </div>
				  
				  
				  <button type="submit" class="btn btn-default">Login</button>
				</form>
			</div>
			
			
			
		</div>
		
	</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>

<html>
	<head>
		<meta>
		<title>Happy ISD</title>
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
		
		
		
		
		
		<div class="reg">
		
                    <div class="zcont">
                        
                        <div class="logg">
                            <img src="images/reg.png" width="750px" height="400px"/>
                        </div>
                        
                        <div class="ips" style="height: 300px; margin-top: 100px;">
                             <form action="../LoginUser" method="post">
                          
                                <h1>在线登录</h1>
                            <input type="text" placeholder="输入用户名" name="username" class="ipst"/>
                            <input type="password" placeholder="输入密码" name="password" class="ipst"/>
                          
                            <input type="submit" value="在线登录" class="ipsb"/>
                            </form>
                            <a href="reg.jsp">还没有账号，在线注册！</a>
                        </div>
                        
                    </div>
			
		</div>
		
                
                
                
                <%@ include file="footers.jsp"  %>
		
	</body>
</html>

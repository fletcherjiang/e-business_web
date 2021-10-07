<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Happy ISD</title>
                 <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<link href="css/style.css" rel="stylesheet" type="text/css"/>
		<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
                <script src="js/jquery.js" type="text/javascript"></script>
                
                <script>
                    
                  $(function(){
                      var num=$(".num_1").val();
                      $(".jia").click(function(){
                       num++;
                       $(".num_1").val(num);
                          
                      })
                      
                      
                     
                      $(".jian").click(function(){
                       num--;
                       if(num<1){
                           $(".num_1").val(1);
                           num=1;
                       }else{
                           $(".num_1").val(num);
                       }
                       
                         })
                 //ajax开始     
                   $("#cart").click(function(){
                            $.ajax({
                                type: "GET",
                                url:"cartcont.jsp",
                                data: {username:$(".username").val(), userid:$(".userid").val()},
                                success:function(result){
                                     
                                       alert("加购成功！");
                            
                            
                            
                                             }});
                                         
                                          });   
                      
                      
                  //结束    
                      
                      
                      
                  })  
                    
                    
                    
                   


                    
                    
                </script> 
                
	</head>
	<body style="background-color: #fafafa;">
		
            <%@include file="heads.jsp" %>
		
            <div class="btlogin">
                <img src="images/logoo.png"/>
                
                
                
                
                
                
                
                 <form action="../InsertOne" method="post">
                          
                            <%
                            if(request.getSession().getAttribute("username")==null){
                            // Object one=   request.getSession().getAttribute("username");
                              out.println(" <input type='text' placeholder='输入用户名' name='username' class='ipst'/>");
                            out.println("<input type='password' placeholder='输入密码' name='password' class='ipst'/>");
                           out.println(" <input type='password' placeholder='再次输入密码' name='passwords' class='ipst'/>");
                           out.println(" <input type='text' placeholder='输入邮箱' name='email' class='ipst'/>");
                           out.println(" <input type='text' placeholder='输入手机号码' name='phone' class='ipst'/>");
                          out.println("  <input type='submit' value='在线注册' class='ipsb'/> ");
                          
                         out.println(" <a href='mys.jsp'>已经有账号，在线登录！</a> ");
                             
                            }else{
                            
                              out.println("<div class='nas'><a href='orderone.jsp'>订单</a><a href='cart.jsp'>购物车</a></div>");  
                            
                            
                            }
                            %>
                     
                           
                 </form>
                            
            
            </div>	
		
		
            <%@include file="footers.jsp" %>
		
	</body>
</html>

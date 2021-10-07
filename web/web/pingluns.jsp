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
		
            <%@include file="top.jsp" %>
		
            <div class="cartone   visible-lg-block">
                
                <div class="pingluns">
                    <form action="pinglunin.jsp" method="post">
                      
                    <textarea name='message' class='plc'>评价内容 </textarea>
                     <%
       
                        Object username=request.getSession().getAttribute("username");
                        String id= request.getParameter("id");                                       
                        out.println("<input type='hidden' value='"+username+"'name='username'/>"); 
                        out.println("<input type='hidden' value='"+id+"'name='cid'/>"); 
    
                      %>
                
                    
                  <input type="submit" class="subc" value="提交评论"/>
                
                    
                   </form> 
                    
                </div>
                                                 
                                                  
            </div>
                   
		
		
		
		<!---->
                
                
               
		
		<!--底部-->
		
		
		
                <%@include file="footers.jsp" %>
		
	</body>
</html>

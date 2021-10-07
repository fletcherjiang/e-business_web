<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
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
		
            <div class="cartone  visible-lg-block">
                 <form action='orders.jsp' method="post">
               
                                                 <jsp:useBean id="test" class="conns.ConnSql"/>
                                                   <%
                                                       
                                                           String id= request.getParameter("id");
                                                           String images= request.getParameter("images");
                                                           String title= request.getParameter("title");
                                                           String price= request.getParameter("price");
                                                           String shopid= request.getParameter("shopid");
                                                          
       
                                                             out.println("<li>");
                                                            
                                                             out.println("<img src='../upload/"+images+"'/>");
                                                             out.println("<h4>"+title+"</h4>");
                                                             out.println("<span>￥"+price+"</span>");
                                                             
                                                             out.println("<input type='hidden' name='cid' value='"+id+"'/>");
                                                          out.println("<input type='hidden' name='shopid' value='"+shopid+"'/>");
                                                              Object c=request.getSession().getAttribute("username");
                                                             out.println("<input type='hidden' name='uid' value='"+c+"'/>");
                                                           
                                                          
       

    
                                                          %>
                                                          
                                                          
                                                          <div class="nums" style="float:left; width: 500px;margin-top: 10px; height: 40px; border-bottom-style: none;">
							
							<input type="button" value="-" class="jian"/>
							<input type="text" value="1" class="num_1" name="nums"/>
							<input type="button" value="+" class="jia"/>
					         	</div>
                                               </li>
                                               
                                               
                                               <div class="address">
                                                   <h1>填写信息</h1>
                                                  
                                                   <input type="text" placeholder="收货人姓名" name="username" class="ocl"/>
                                                   <input type="text" placeholder="收货人电话" name="phone" class="ocl"/>
                                                   <input type="text" placeholder="收货人地址" name="address" class="ocl"/>
                                                   <input type="submit" value="提交购买" class="ocb"/>
                                                   </form>
                                               </div>
                
                
                
            </div>
                   
		
		<!---->
                
                
                 <div class="cartonebt   hidden-lg">
                 <form action='orders.jsp' method="post">
               
                                                
                                                   <%
                                                       
                                                         
                                                          
       
                                                             out.println("<li style='list-style:none;'>");
                                                            
                                                             out.println("<img src='../upload/"+images+"' width='100%'/>");
                                                             out.println("<h4>"+title+"</h4>");
                                                             out.println("<span>￥"+price+"</span>");
                                                             
                                                             out.println("<input type='hidden' name='cid' value='"+id+"'/>");
                                                             out.println("<input type='hidden' name='shopid' value='"+shopid+"'/>");
                                                             
                                                             out.println("<input type='hidden' name='uid' value='"+c+"'/>");
                                                           
                                                          
       

    
                                                          %>
                                                          
                                                          
                                                          <div class="nums" style="float:left; width: 500px;margin-top: 10px; height: 40px; border-bottom-style: none;">
							
							<input type="button" value="-" class="jian"/>
							<input type="text" value="1" class="num_1" name="nums"/>
							<input type="button" value="+" class="jia"/>
					         	</div>
                                               </li>
                                               
                                               
                                               <div class="address">
                                                   <h1>填写信息</h1>
                                                  
                                                   <input type="text" placeholder="收货人姓名" name="username" class="ocl"/>
                                                   <input type="text" placeholder="收货人电话" name="phone" class="ocl"/>
                                                   <input type="text" placeholder="收货人地址" name="address" class="ocl"/>
                                                   <input type="submit" value="提交购买" class="ocb"/>
                                                   </form>
                                               </div>
                
                
                
            </div>
		
		
		
		<!--底部-->
		
		
		
                <%@include file="footers.jsp" %>
		
	</body>
</html>

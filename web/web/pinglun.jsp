<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Happy ISD</title>
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
		
		<div class="content">
			
			<div class="cont_left">
				<div class="cl_all">
					
                                             <jsp:useBean id="test" class="conns.ConnSql"/>
                                               <%
       
                                                        Connection one=test.getConnection();//获取getConnection()方法
                                                        Statement statement = one.createStatement();//获取操作数据库的对象
                                                            String id= request.getParameter("id");
                                                            String sql="select * from commodity where cid="+id;
                                                            ResultSet resultSet = statement.executeQuery(sql);//执行sql，获取结果集

                                                            while(resultSet.next()){ //遍历结果集，取出数据

                                                               int sid = resultSet.getInt("cid");//测试输出
                                                               String title = resultSet.getString("title");
                                                               String price = resultSet.getString("price");
                                                               String stock = resultSet.getString("stock");
                                                               String images = resultSet.getString("images");
                                                                //输出数据
                                                              // out.println(test_name);
                                                              
                                                              
                                                              //
					                   
                                                            out.println("<img src='../upload/"+images+"'/>");
                                                             out.println("<div class='cl_title'>");
                                                             out.println("<h1>"+title+"</h1>");
                                                             out.println("<span class='price'>价格："+price+"</span>");
                                                             out.println("<span class='kucun'>库存："+stock+"</span>");
                                                             
                                                             
                                                             out.println("</li>");

                                                            }
        
                                                              

    
                                                          %>
                                            
                                            
						          <input type="hidden"  value="<%=request.getParameter("id")  %>" class="userid"/>
                                                          <input type="hidden" name="username" value="<%=request.getSession().getAttribute("username") %>" class="username"/>
						
						<div class="nums">
							<span class="shul">数量：</span>
							<input type="button" value="-" class="jian"/>
							<input type="text" value="1" class="num_1"/>
							<input type="button" value="+" class="jia"/>
						</div>
                                                          
                                                          
                                                          
						<div class="cart">
                                                    
                                                <%     
                                                    
                                                            String sqls="select * from commodity where cid="+id;
                                                            ResultSet resultSets = statement.executeQuery(sqls);//执行sql，获取结果集
                                                    
                                                              while(resultSets.next()){ //遍历结果集，取出数据

                                                               int sids= resultSets.getInt("cid");//测试输出
                                                               String titles = resultSets.getString("title");
                                                               String prices = resultSets.getString("price");
                                                               String stocks = resultSets.getString("stock");
                                                               String imagess = resultSets.getString("images");
                                                               String shopid = resultSets.getString("shopid");
                                                              // out.println("<script>alert('"+shopid+"');</script>");
                                                              out.println("<a class='carts sc1' href='order.jsp?id="+sids+"&&title="+titles+"&&price="+prices+"&&stock="+stocks+"&&images="+imagess+"&&shopid="+shopid+"' id='goumai' style='text-align: center; line-height: 50px;'>立刻购买</a>");
                                                    }
                                                %>
                                                    
                                                    
                                                    
                                                    
							<input type="submit" class="carts sc2" id="cart" value="加入购物车"/>
						</div>
						
                                                
                                                
                                                
                                                
                                                
                                                
                                                
						
						
					</div>
				</div>
                                                          
                                                          
                                                          
                                                          
                                                          
                                                          
                                                          
                                                          
                                                          
                                                          
				
				<div class="pinglun">
					<div class="pinga">
						<a>宝贝详情</a>
						<a>宝贝评论</a>
					</div>
					
					<div class="pingimg">
                                            
                                            
                                            
                                               
                                            
                                            
                                            
						
                                            
                                            
                                            
                                            
                                           
                                            <%
       
                                                       
                                                          ResultSet s = statement.executeQuery(sql);//执行sql，获取结果集
                                                            while(s.next()){ //遍历结果集，取出数据

                                                             
                                                               String content = s.getString("content");
                                                               String imagess = s.getString("images");
                                                               out.println("<img src='../upload/"+imagess+"'/>");
                                                            
                                                             
                                                                 out.println("<p>"+content+"</p>");

                                                            }
        
       

    
                                                          %>
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
					</div>
					
				</div>
				
				
				
			</div>
			<div class="cont_right"></div>
			
		</div>
		
		
		
		
		
		
		
		<!--底部-->
		
		
		
                <%@include file="footers.jsp" %>
		
	</body>
</html>

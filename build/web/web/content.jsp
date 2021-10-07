<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>电商</title>
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
                       if(num>$(".kc").val()){
                           alert("库存没有这么多了！");
                           $(".num_1").val($(".kc").val());
                       }else{
                          $(".num_1").val(num); 
                           
                       }
                       
                          
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
                      
                      
                      
                      $("#cart1").click(function(){
                            $.ajax({
                                type: "GET",
                                url:"cartcont.jsp",
                                data: {username:$(".username").val(), userid:$(".userid").val()},
                                success:function(result){
                                     
                                       alert("加购成功！");
                            
                            
                            
                                             }});
                                         
                                          });   
                        $(".num_1").blur(function(){
                          
                           if(parseInt($(this).val())>parseInt($(".kc").val())){
                                alert("库存没有这么多了！");
                           $(this).val($(".kc").val());
                                
                            }
                            
                            
                        })
                      
                  //结束    
                      
                      
                      $(".pinga a").click(function(){
                          
                          if($(this).index()==0){
                              
                              $(".pingimg").fadeIn(300);
                               $(".pingimgs").fadeOut(300);
                              
                              
                          }else if($(this).index()==1){
                              
                              $(".pingimgs").fadeIn(300);
                               $(".pingimg").fadeOut(300);
                              
                              
                          }
                          
                          
                          
                          
                      })
                      
                      
                  })  
                    
                    
                    
                   


                    
                    
                </script> 
                
	</head>
	<body style="background-color: #fafafa;">
		
            <%@include file="top.jsp" %>
		
		<div class="content  visible-lg-block">
			
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
                                                              out.println("<input type='hidden' class='kc' value='"+stock+"'/>");
                                                             
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
                                                              
                                                              if(request.getSession().getAttribute("username")==null){
                           
                                                                    out.println("<a href='my.jsp'>请登录</a>");
                             
                                                                      }else{
                                                                            // out.println(request.getSession().getAttribute("username"));
                                                                             out.println("<a class='carts sc1' href='order.jsp?id="+sids+"&&title="+titles+"&&price="+prices+"&&stock="+stocks+"&&images="+imagess+"&&shopid="+shopid+"' id='goumai' style='text-align: center; line-height: 50px;'>立刻购买</a>");
                                                              
                                                                      }
                                                              
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
                                                          
                                                          
                                                          
                                        <div class="pingimgs" style="display: none;">
                                            
                                            
                                             <%
                        
                                                             String sql5="select * from pingluns where cid="+id;
                                                             ResultSet s5 = statement.executeQuery(sql5);//执行sql，获取结果集
                                                             while(s5.next()){ //遍历结果集，取出数据
                                                                String message5 = s5.getString("message");
                                                                String username5 = s5.getString("username");
                                                                 out.println("<li style='list-style:none;'><img src='images/111.png'/><span class='p4'>"+username5+"：</span><span class='p5'>"+message5+"</span></li>"); 
                                                                
                                                                
                                                            }



                        
                                          %>
                                          
                                        </div>
					
				</div>
				
				
				
			</div>
			<div class="cont_right"></div>
			
		</div>
		
		
		
		<!--响应式开始-->
                
                
                                                  <div class="contentbt  hidden-lg">
                    
                                                      <div class="shuli">
                                                            <input type="hidden"  value="<%=request.getParameter("id")  %>" class="userid"/>
                                                            <input type="hidden" name="username" value="<%=request.getSession().getAttribute("username") %>" class="username"/>
						
						           <div class="nums" style="height:60px; margin-top: 0px;padding-top: 10px; width: 140px;">
							          
							          <input type="button" value="-" class="jian"/>
							          <input type="text" value="1" class="num_1"/>
							          <input type="button" value="+" class="jia"/>
						            </div>
                                                          
                                                           
                                                          
                                                      </div>
                    
                    
                    
                     <%
       
                                                       
                                                          ResultSet s1 = statement.executeQuery(sql);//执行sql，获取结果集
                                                            while(s1.next()){ //遍历结果集，取出数据

                                                               int sids= s1.getInt("cid");//测试输出
                                                               String titles1 = s1.getString("title");
                                                               String prices1 = s1.getString("price");
                                                               String stocks1 = s1.getString("stock");
                                                               String imagess1 = s1.getString("images");
                                                               String shopid1 = s1.getString("shopid");
                                                               String content1 = s1.getString("content");
                                                               out.println("<img src='../upload/"+imagess1+"' width='100%'/>");
                                                               out.println("<h3 class='pri'>￥"+prices1+"</h3>");
                                                               out.println("<span class='hei'>"+titles1+"</span>");
                                                            //   out.println("<div class='ping'><li><h6>评论：</h6><span class='p1'>11111</span><span class='p2'>11111</span></li></div>"); 
                                                              // out.println("<div class='nei'>"+content1+"</div>");
                                                               
                                                               
                                                                 if(request.getSession().getAttribute("username")==null){
                           
                                                                    out.println("<div class='gou'><a href='mys.jsp' style='line-height:60px; padding-left:20px;'>还没有登录，请登录</a></div>");
                             
                                                                      }else{
                                                                    out.println("<div class='gou'><input type='submit' class='carts sc2' id='cart1' value='加入购物车'/><a class='carts sc1' href='order.jsp?id="+sids+"&&title="+titles1+"&&price="+prices1+"&&stock="+stocks1+"&&images="+imagess1+"&&shopid="+shopid1+"' id='goumai' style='text-align: center; line-height: 50px;'>立刻购买</a></div>");
                                              
                                                                 
                                                                 }
                                                               
                                                                             
                                                            }
        
       

    
                                                          %>
                    
                    <div class='ping'style='overflow: scroll;'>
                        <h6>评论：</h6>
                    <%
                        
                                                             String sql2="select * from pingluns where cid="+id;
                                                             ResultSet s2 = statement.executeQuery(sql2);//执行sql，获取结果集
                                                             while(s2.next()){ //遍历结果集，取出数据
                                                                String message = s2.getString("message");
                                                                String username = s2.getString("username");
                                                                 out.println("<li style='list-style:none;'><span class='p1'>"+username+"：</span><span class='p2'>"+message+"</span></li>"); 
                                                                
                                                                
                                                            }



                        
                        %>
                    </div>
                        <%
                                                           
                                                            String sql4="select * from commodity where cid="+id;
                                                            ResultSet s4 = statement.executeQuery(sql4);//执行sql，获取结果集
                                                             while(s4.next()){ //遍历结果集，取出数据
                                                                String content4 = s4.getString("content");
                                                                out.println("<div class='nei'>"+content4+"</div>");
                                                                
                                                                
                                                            }



                        
                        %>
                    
                </div>
		
		
		
		<!--底部-->
		
		
		
                <%@include file="footers.jsp" %>
		
	</body>
</html>

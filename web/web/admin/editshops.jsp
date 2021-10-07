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
		<title>电商</title>
		<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<link href="../css/admin.css" rel="stylesheet" type="text/css"/>
		<script src="../js/jquery.js" type="text/javascript"></script>
		<script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script>
			$(function(){
				
				$(".login_cont").height($(window).height());
                                 $("#adds").click(function(){
                                 var files = $('#files').get(0).files[0];
                                 if(!files){
                                      //alert($("#h1").val());
                                   var  h1= $("#h1").val();
                                   var  h2= $("#h2").val();
                                    var  h3= $("#h3").val();
                                     var  h4= $("#h4").val();
                                  var  h5= $("#h5").val();
                                var  url="../../UpdateShopsno";
                                var href=url + "?title="+h1+"&&price=" + h2+ "&&stock=" + h3+ "&&content=" + h4+"&&id="+h5;
                                 $("#tijiao").attr("action",href);
                                 
                                }else{
                                    
                                     var  h1= $("#h1").val();
                                   var  h2= $("#h2").val();
                                    var  h3= $("#h3").val();
                                     var  h4= $("#h4").val();
                                  var  h5= $("#h5").val();
                                var  url="../../UpdateShops";
                                var href=url + "?title="+h1+"&&price=" + h2+ "&&stock=" + h3+ "&&content=" + h4+"&&id="+h5;
                                 $("#tijiao").attr("action",href);
                                    
                                    
                                }   
                                
                                
                                   
                                  
                                   
                                
                                
                                
                        
                               }) 
                               
                                
				
			})
                        
                        
                         function validForm(fm){
                                   
                                     return true;
                                      } 
			
		</script>
	</head>
	<body>
		<div class="login_cont">
		
				<%@ include file='left.jsp' %>
				<div class="admin_right">
					 <div class="top_r"></div>
					 
					 <div class="table_r">
						 <h2 align="center">Editshops</h2>
						 
						  <hr style="border: 1px solid #ddd;"/>
						 
						
						 
						 
						 <div class="add_user">
							 
							 
                                                     <form action="../../UpdateShops" method="post" id="tijiao"   enctype="multipart/form-data" >
                                                              <jsp:useBean id="test" class="conns.ConnSql"/>
                                                                  <%
       
                                                        Connection one=test.getConnection();//获取getConnection()方法
                                                        Statement statement = one.createStatement();//获取操作数据库的对象
                                                        String id= request.getParameter("id");
                                                            String sql="select * from commodity where cid="+id;
                                                            //String sql="select * from user";
                                                            ResultSet resultSet = statement.executeQuery(sql);//执行sql，获取结果集

                                                            while(resultSet.next()){ //遍历结果集，取出数据

                                                               int cid = resultSet.getInt("cid");//测试输出
                                                               String title = resultSet.getString("title");
                                                               String price = resultSet.getString("price");
                                                               String stock = resultSet.getString("stock");
                                                               String content = resultSet.getString("content");
                                                                //输出数据
                                                              // out.println(test_name);
                                                             
                                                             
                                                              out.println("</tr>");
                                                             
                                                              out.println("<div class='form-group'>");
                                                              out.println("<label for='exampleInputEmail1'>title</label>");
                                                              out.println("<input type='text' class='form-control' id='h1' name='title' value='"+title+"'/>");
                                                              out.println("</div>");
                                                                
                                                          out.println(" <div class='form-group'><la bel for='exampleInputEmail1'>Images</label><input type='file' name='uploadFile' id='files'/></div> ");
                                                                
                                                              out.println("<div class='form-group'>");
                                                              out.println("<label for='exampleInputEmail1'>price</label>");
                                                              out.println("<input type='text' class='form-control' id='h2' name='price' placeholder='Username' value='"+price+"'>");
                                                              out.println("</div>");
                                                              
                                                              out.println("<div class='form-group'>");
                                                              out.println("<label for='exampleInputPassword1'>Password</label>");
                                                              out.println(" <input type='stock' class='form-control' id='h3' name='stock' placeholder='Password' value='"+stock+"'>");
                                                              out.println("</div>");
                                                                
                                                              out.println("<div class='form-group'>");
                                                              out.println("<label for='exampleInputPassword1'>Phone</label>");
                                                              out.println("  <textarea name='content' style='width:552px;height:200px; ' id='h4'>"+content+"</textarea>");
                                                              out.println("</div>");
                                                                
                                                                 out.println("  <input type='hidden' id='h5'  name='uid' value='"+cid+"'>");
                                                           
                                                              out.println("<input type='submit' class='btn btn-default' id='adds' value='Edit'/>");
                                                             
                                                             
                                                             
                                                             
                                                             
                                                             

                                                            }
        
       

    
                                                          %>   
                                                       
                                                        
                                                        
                                                          
							 </form>
							 
						 </div>
						 
						 
						 
						 
						 
					 </div>
					 
				</div>
	       </div>
	</body>
</html>

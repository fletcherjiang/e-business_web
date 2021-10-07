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
                <style>
                    .cartone li p {
    display: block;
    width: 800px;
    height: 20px;
    line-height: 20px;
    color: #333;
    float: left;
    margin-top: 2px;
    margin-bottom: 2px;
    margin-left: 50px;}
                    .cartone li span {
    display: block;
    width: 800px;
    height: 30px;
    line-height: 30px;
    margin-left: 50px;
    float: left;
    color: #333;
}
                 </style>
	</head>
	<body style="background-color: #fafafa;">
		
            <%@include file="top.jsp" %>
		
            <div class="cartone   visible-lg-block">
                
               
                                                 <jsp:useBean id="test" class="conns.ConnSql"/>
                                                   <%
       
                                                             Connection one=test.getConnection();//获取getConnection()方法
                                                             Statement statement = one.createStatement();//获取操作数据库的对象
                                                            //String sql="select * from commodity limit 15";
                                                            Object username=request.getSession().getAttribute("username");
                                                            String sql=" select * from orders LEFT JOIN commodity on orders.cid=commodity.cid where uid='"+username+"'";
                                                            
                                                            
                                                            ResultSet resultSet = statement.executeQuery(sql);//执行sql，获取结果集

                                                            while(resultSet.next()){ //遍历结果集，取出数据

                                                               int sid = resultSet.getInt("cid");//测试输出
                                                               String title = resultSet.getString("title");
                                                               String price = resultSet.getString("price");
                                                               String stock = resultSet.getString("stock");
                                                               String images = resultSet.getString("images");
                                                               
                                                               String usernames= resultSet.getString("username");
                                                               String phone = resultSet.getString("phone");
                                                               String address = resultSet.getString("address");
                                                                //输出数据
                                                              // out.println(test_name);
                                                             out.println("<li>");
                                                             out.println("<a href='pingluns.jsp?id="+sid+"' target='_blank'>");
                                                             out.println("<img src='../upload/"+images+"'/>");
                                                             out.println("<h4>"+title+"</h4>");
                                                             out.println("<span>￥"+price+"</span>");
                                                             
                                                             out.println("<p>收货人："+usernames+"</p>");
                                                             out.println("<p>电话："+phone+"</p>");
                                                             out.println("<p>地址："+address+"</p>");
                                                             out.println("</a>");
                                                             out.println("</li>");

                                                            }
        
       

    
                                                          %>
                
                
                
                
                
            </div>
                   
		
		
		
		<!---->
                
                
                <div class="cartonebt  hidden-lg">
                
               
                                                
                                                   <%
       
                                                          
                                                            ResultSet resultSet1 = statement.executeQuery(sql);//执行sql，获取结果集
                                                            while(resultSet1.next()){ //遍历结果集，取出数据

                                                               int sid1 = resultSet1.getInt("cid");//测试输出
                                                               String title1 = resultSet1.getString("title");
                                                               String price1 = resultSet1.getString("price");
                                                               String stock1 = resultSet1.getString("stock");
                                                               String images1 = resultSet1.getString("images");
                                                                //输出数据
                                                                
                                                                String usernames1= resultSet1.getString("username");
                                                               String phone1 = resultSet1.getString("phone");
                                                               String address1 = resultSet1.getString("address");
                                                              // out.println(test_name);
                                                             out.println("<li>");
                                                             out.println("<a href='pingluns.jsp?id="+sid1+"' target='_blank'>");
                                                             out.println("<img src='../upload/"+images1+"'/>");
                                                             out.println("<h4>"+title1+"</h4>");
                                                             out.println("<span>￥"+price1+"</span>");
                                                            // out.println("<p>"+usernames1+phone1+address1+"</p>");
                                                            out.println("<p>收货人："+usernames1+"</p>");
                                                             out.println("<p>电话："+phone1+"</p>");
                                                             out.println("<p>地址："+address1+"</p>"); 
                                                             
                                                             out.println("</a>");
                                                             out.println("</li>");

                                                            }
        
       

    
                                                          %>
                
                
                
                
                
            </div>
		
		<!--底部-->
		
		
		
                <%@include file="footers.jsp" %>
		
	</body>
</html>

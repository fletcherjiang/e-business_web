<%-- 
    Document   : cartcont
    Created on : 2021-4-19, 7:26:13
    Author     : admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy ISD</title>
    </head>
    <body>
        <jsp:useBean id="test" class="conns.ConnSql"/>
        
         <%
       
                                                            Connection one=test.getConnection();//获取getConnection()方法
                                                            Statement statement = one.createStatement();//获取操作数据库的对象
                                                           // String sql="select * from commodity limit 15";
                                                           String username = request.getParameter("username");
		                                           String userid = request.getParameter("userid");
                                                           String sql="INSERT INTO cart (username,cid) VALUES('"+username+"','"+userid+"')";
                                                           int resultSet = statement.executeUpdate(sql);//执行sql，获取结果集
                                                           if(resultSet>0){
                          
                                                                      out.println("添加成功");
                          
                          
                                                                      }else{
                          
                                                                         out.println("添加失败");
                          
                                                                        } 
                                                           
       

    
                                                          %>
        
        
        
        
    </body>
</html>

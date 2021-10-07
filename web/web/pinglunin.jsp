<%-- 
    Document   : pinglunin
    Created on : 2021-4-20, 14:37:23
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
                                                        response.setContentType("text/html;charset=utf-8");
		
		                                        request.setCharacterEncoding("utf-8");
                                                        String username = request.getParameter("username");
                                                        String cid = request.getParameter("cid");
                                                        String message = request.getParameter("message");
                                                         java.sql.Timestamp stamp=new java.sql.Timestamp(System.currentTimeMillis());
                                                       //  out.println("<script>alert('"+message+"');</script>");  
                                                         
                                                        
                                                        try{
                         
                                                      String sql="INSERT INTO pingluns (username,cid,message,dates) VALUES('"+username+"','"+cid+"','"+message+"','"+stamp+"')";
                                                      int resultSet = statement.executeUpdate(sql);//执行sql，获取结果集
                                                    if(resultSet>0){
                          
                                                              out.println("<script>alert('添加成功');window.location.href='orderone.jsp';</script>");
                          
                          
                                                    }else{
                          
                                                          out.println("<script>alert('添加错误');window.history.back();</script>");
                          
                                                    }
                       
                          
                                              }catch(Exception e){
                                           out.println("<script>alert('错误！');window.history.back();</script>");
                           
                                                   }
                                                        
                                                        %>
        
        
        
    </body>
</html>

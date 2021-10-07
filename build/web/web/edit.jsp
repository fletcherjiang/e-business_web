<%-- 
    Document   : edit
    Created on : 2021-4-18, 21:03:27
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
       <%  
           request.getSession().removeAttribute("username");
           response.sendRedirect("../index.jsp"); 
       
       %>　　　
    </body>
</html>

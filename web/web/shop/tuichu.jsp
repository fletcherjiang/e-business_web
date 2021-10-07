<%-- 
    Document   : left
    Created on : 2021-4-16, 17:44:59
    Author     : admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
  <%  
           request.getSession().removeAttribute("shop");
           response.sendRedirect("index.jsp"); 
       
       %>　　　
       
</body>    
</html>
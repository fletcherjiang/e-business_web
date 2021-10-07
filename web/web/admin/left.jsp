<%-- 
    Document   : left
    Created on : 2021-4-16, 17:44:59
    Author     : admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
                            if(request.getSession().getAttribute("admin")==null){
                            // Object one=   request.getSession().getAttribute("username");
                             out.println("<script>alert('您还没有登录，请登录后查看！');window.location.href='index.jsp';</script>");
                             
                            }
%>
<div class="admin_left">
					
					<div class="top_l">
						<img src="../images/logomi.png"/>
						<h3>Management System</h3>
					</div>
					
					
					<div class="topli">
						
						<li><a href="indexs.jsp"><img src="../images/user.png"/><span>User</span></a></li>
						<li><a href="shop.jsp"><img src="../images/shop.png"/><span>Shop</span></a></li>
						<li><a href="shops.jsp"><img src="../images/shops.png"/><span>Commodity</span></a></li>
						<li><a href="tuichu.jsp"><img src="../images/tuichu.png"/><span>Sign Out</span></a></li>
						
					</div>
					
					<div class="cr">Management System @ 2021</div>
					
					
</div>
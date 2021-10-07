/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;
import java.math.BigDecimal;
import java.sql.*;
import conns.ConnSql;
import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/SupdateOne")
public class SupdateOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	@Override
	protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String shopname = request.getParameter("shopname");
		String password = request.getParameter("password");
                String classes = request.getParameter("classes");
                String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		//out.println("<script>alert('ddd')</script>");
		if (shopname == null || shopname.length() == 0) {
			out.println("<script>alert('请输入用户名');window.history.back();</script>");
		} else if (password == null || password.length() == 0) {
			out.println("<script>alert('请输入密码');window.history.back();</script>");
		}else if (address == null || address.length() == 0) {
			out.println("<script>alert('请输入邮箱');window.history.back();</script>");
		}else if (phone == null || phone.length() == 0) {
			out.println("<script>alert('请输入电话');window.history.back();</script>");
		}else if (classes == null || classes.length() == 0) {
			out.println("<script>alert('请输入分类');window.history.back();</script>");
		}
                
                
                
                else if (shopname.length() > 0 && password.length() > 0 && address.length() > 0 && phone.length() > 0 && classes.length() > 0) {
                  
                         try{
                          ConnSql test=new ConnSql();
                          Connection one=test.getConnection();//获取getConnection()方法
                          Statement statement = one.createStatement();//获取操作数据库的对象
                          String userid = request.getParameter("uid");
                        
                          String sql="UPDATE shop SET shopname='"+shopname+"',address='"+address+"',phone='"+phone+"',password='"+password+"',classes='"+classes+"' WHERE sid="+userid;
                          int resultSet = statement.executeUpdate(sql);//执行sql，获取结果集
                          if(resultSet>0){
                          
                                  out.println("<script>alert('更新成功');window.location.href='web/admin/shop.jsp';</script>");
                          
                          
                          }else{
                          
                           out.println("<script>alert('更新失败');window.history.back();</script>");
                          
                          }
                       
                          
                         }catch(Exception e){
                          out.println("<script>alert('更新失败！');window.history.back();</script>");
                           
                         }
                             
                           
                         
                          
			
		}
		
	}
 
}

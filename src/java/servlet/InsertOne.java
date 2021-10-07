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
 
@WebServlet("/InsertOne")
public class InsertOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	@Override
	protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("GBK");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
                String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		//out.println("<script>alert('ddd')</script>");
		if (username == null || username.length() == 0) {
			out.println("<script>alert('请输入用户名');window.history.back();</script>");
		} else if (password == null || password.length() == 0) {
			out.println("<script>alert('请输入密码');window.history.back();</script>");
		}else if (email == null || email.length() == 0) {
			out.println("<script>alert('请输入邮箱');window.history.back();</script>");
		}else if (phone == null || phone.length() == 0) {
			out.println("<script>alert('请输入电话');window.history.back();</script>");
		}
                
                
                
                else if (username.length() > 0 && password.length() > 0 && email.length() > 0 && phone.length() > 0) {
                  
                         try{
                          ConnSql test=new ConnSql();
                          Connection one=test.getConnection();//获取getConnection()方法
                          Statement statement = one.createStatement();//获取操作数据库的对象
                          String sql="INSERT INTO user (username,password,email,phone) VALUES('"+username+"','"+password+"','"+email+"','"+phone+"')";
                          int resultSet = statement.executeUpdate(sql);//执行sql，获取结果集
                          if(resultSet>0){
                          
                                  out.println("<script>alert('添加成功');window.location.href='web/admin/indexs.jsp';</script>");
                          
                          
                          }else{
                          
                           out.println("<script>alert('账号或者密码错误');window.history.back();</script>");
                          
                          }
                       
                          
                         }catch(Exception e){
                          out.println("<script>alert('账号或者密码错误！');window.history.back();</script>");
                           
                         }
                             
                           
                         
                          
			
		}
		
	}
 
}

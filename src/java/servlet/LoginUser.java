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
import javax.servlet.http.HttpSession;
 
@WebServlet("/LoginUser")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	@Override
	protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("username");
                
		String password = request.getParameter("password");
		
             
		 if (name == null || name.length() == 0) {
			out.println("<script>alert('请输入用户名');window.history.back();</script>");
		} else if (password == null || password.length() == 0) {
			out.println("<script>alert('请输入密码');window.history.back();</script>");
		}else if (name.length() > 0 && password.length() > 0) {
                   
                        //  out.println("<script>"+password+"</script>");
                        try{
                          ConnSql test=new ConnSql();
                          Connection one=test.getConnection();//获取getConnection()方法
                          Statement statement = one.createStatement();//获取操作数据库的对象
                          String sql="select * from user where username = '"+name+"'";
                          ResultSet resultSet = statement.executeQuery(sql);//执行sql，获取结果集
                          if(resultSet.next()){
                        
                                  if(password.equals(resultSet.getString("password"))){
                                     
                                      // 获取session
                                        HttpSession hs = request.getSession();
                                        hs.setAttribute("username",name);
                                      out.println("<script>alert('登录成功');window.location.href='./index.jsp';</script>");
                                     }
                                else{
                                       out.println("<script>alert('密码错误');window.history.back();</script>");
                                       }
                          
                          
                          }else{
                          
                           out.println("<script>alert('账号或者密码错误');window.history.back();</script>");
                          
                          }
                       
                          
                         }catch(Exception e){
                          out.println("<script>alert('账号或者密码错误ss！');window.history.back();</script>");
                           
                         }
                             
                          
                         
                          
		
		}
		
	}
 
}

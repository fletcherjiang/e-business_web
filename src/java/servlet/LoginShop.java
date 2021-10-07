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
 
@WebServlet("/LoginShop")
public class LoginShop extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	@Override
	protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("GBK");
		String name = request.getParameter("admin");
		String password = request.getParameter("password");
		//out.println("<script>alert('ddd')</script>");
		if (name == null || name.length() == 0) {
			out.println("<script>alert('请输入用户名');window.history.back();</script>");
		} else if (password == null || password.length() == 0) {
			out.println("<script>alert('请输入密码');window.history.back();</script>");
		} else if (name.length() > 0 && password.length() > 0) {
                   // out.println("1111");
                         try{
                          ConnSql test=new ConnSql();
                          Connection one=test.getConnection();//获取getConnection()方法
                          Statement statement = one.createStatement();//获取操作数据库的对象
                          String sql="select * from shop where shopname ='"+name+"'";
                          ResultSet resultSet = statement.executeQuery(sql);//执行sql，获取结果集
                          if(resultSet.next()){
                          
                                  if(password.equals(resultSet.getString("password"))){
                                     // 获取session
                                        HttpSession hs = request.getSession();
                                        hs.setAttribute("shop",name);
                                      out.println("<script>alert('登录成功');window.location.href='web/shop/shops.jsp';</script>");
                                     }
                                else{
                                       out.println("<script>alert('密码错误');window.history.back();</script>");
                                       }
                          
                          
                          }else{
                          
                           out.println("<script>alert('账号或者密码错误');window.history.back();</script>");
                          
                          }
                       
                          
                         }catch(Exception e){
                          out.println("<script>alert('账号或者密码错误！');window.history.back();</script>");
                           
                         }
                             
                           
                         
                          
			
		}
		
	}
 
}

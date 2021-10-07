/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;
import java.math.BigDecimal;
import java.sql.*;
import conns.ConnSql;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/UpdateShopsnoone")
public class UpdateShopsnoone extends HttpServlet {
        private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String price = request.getParameter("price");
                String stock = request.getParameter("stock");
		String content = request.getParameter("content");
		//out.println("<script>alert('"+price+"')</script>");
                
                  
                         try{
                          ConnSql test=new ConnSql();
                          Connection one=test.getConnection();//获取getConnection()方法
                          Statement statement = one.createStatement();//获取操作数据库的对象
                          String userid = request.getParameter("id");
                        
                          String sql="UPDATE commodity SET title='"+title+"',price='"+price+"',stock='"+stock+"',content='"+content+"' WHERE cid="+userid;
                          
                          
                          int resultSet = statement.executeUpdate(sql);//执行sql，获取结果集
                          if(resultSet>0){
                          
                                  out.println("<script>alert('更新成功');window.location.href='web/shop/shops.jsp';</script>");
                          
                          
                          }else{
                          
                           out.println("<script>alert('更新失败');window.history.back();</script>");
                          
                          }
                       
                          
                         }catch(Exception e){
                          out.println("<script>alert('更新失败！');window.history.back();</script>");
                           
                         }
                             
                           
                         
                          
			
		
		
	}
}
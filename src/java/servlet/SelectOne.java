/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;
import java.math.BigDecimal;
import java.sql.*;
import conns.ConnSql;

/**
 * Servlet implementation class add
 */
public class SelectOne{
  
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOne() {
        
        
    }

    public static void main(String[] args)throws Exception {  //测试数据库是否连通
       ConnSql test=new ConnSql();
       Connection one=test.getConnection();//获取getConnection()方法
        Statement statement = one.createStatement();//获取操作数据库的对象
            String sql="select * from test";
            ResultSet resultSet = statement.executeQuery(sql);//执行sql，获取结果集
 
            while(resultSet.next()){ //遍历结果集，取出数据
               
                String test_name = resultSet.getString("iname");//测试输出
            
                //输出数据
               System.out.println(test_name);
                             
            }
       
        System.out.println(one);
    }
 
}

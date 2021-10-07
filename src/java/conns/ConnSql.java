/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conns;

/**
 *
 * @author admin
 */
import java.math.BigDecimal;
import java.sql.*;

 
public class ConnSql {
    public static String url = "jdbc:mysql://localhost:3306/students?useSSL=false";  //数据库地址
    public static String userName = "root";  //数据库用户名
    public static String passWord = "root";  //数据库密码
    public static Connection conn = null;
     
    public ConnSql(){
         
    }
     
    public static Connection getConnection(){
        if(null == conn){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, userName, passWord);
           /*   Statement statement = conn.createStatement();//获取操作数据库的对象
            String sql="select * from test";
            ResultSet resultSet = statement.executeQuery(sql);//执行sql，获取结果集

            while(resultSet.next()){ //遍历结果集，取出数据
               
                String book_name = resultSet.getString("iname");
            
                //输出数据
                
                System.out.print(book_name);
                
              
            }
*/
                
                
                
                
                
                
                
                
                
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return conn;
        
         
    }
     
    public static void main(String[] args) {  //测试数据库是否连通
        System.out.println(getConnection());
    }
}
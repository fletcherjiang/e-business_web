# Introduction 

The website is an e-commerce JavaWeb project made by reference Taobao website. Users and buyers can register and log in online, join the shopping cart and purchase goods. Goods can be evaluated after purchase. It is a basic electronic commerce to meet the procedures. 



# **Layout Design** 

Before and after the website you design the basic principles and basic modules are introduced. 

* **Front-end design:** The front-end design adopts the responsive design of Bootstrap framework, which is divided into PC end and mobile end. PC side with jQuery + JS, HTML5, etc. Adopt upper and lower structure layout. 

## **Client Design** 

* **Top:**  Sign in and what it looks like after logging in. 

* **Header:** Logo + search function. 

* **Menu:** the whole menu USES green, the use of CSS3 unique gradient attributes.  **Background-image:** -webkit-linear-gradient(left,#98FB98 0,#2E8B57 100%);

* **Bottom**: The bottom is white to highlight the bottom information. 

* **Categorized area on the first page:** list the categories on the left. 

* **Home page merchandise area:** merchandise area use simple design, generous and elegant. 

* Mobile terminals are as follows: 

  The META section is used for mobile META: 

  <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/> 

* **Header:** Logo + search bar, the search bar has a round-edged design, which look gentler 
* **Footer:** A fixed floating menu commonly found in the mobile terminal. 
* **Commodity page:** Using a percentage design and a two-column style to highlight the characteristic of the commodities. Displayed by the format of image + title + price. 
* **Register and login page:** The design of the form is simple, with a white background. The buttons have a tangerine background and white font. And the logo is kept on top, which is beautiful 
* **Implementation of technology:** As the design of the whole website is under the bootstrap framework, it fits the style of bootstrap and uses its featured responsive web design. 
* **Responsive web design:** Using media query and classes to display and hide page contents under different devices easily, which speed-up the development of responsive webpages. Also, it includes classes for displaying and hiding contents on printers. Applying these classes accordingly can avoid creating different versions for the same website, but to provide different forms of display on different devices. 



The display for computer pages applies the .visible-lg-block class while the display for mobile pages only applies the .hidden-lg class. It also uses the special classes of the responsive web design for the layout design to achieve multiterminal display. 

Jquery is used for the alignment of the page and the submission of ajax parameters. Such as the code in the cart page: 

```javascript
$("#cart").click(function(){
$.ajax({
type: "GET",
url:"cartcont.jsp",
data: {username:$(".username").val(),
userid:$(".userid").val()
},
success:function(result){
alert("加购成功！ ！");
}});
});
```

## **Administrator Terminal** 

**1. Administrator terminal:** 

User management, Merchandise management, Shop management 



**2. Structure:** 

Left: Logo, Title, Category, System Information 

Right: Module details



**3. Back-end Design:** 

The back-end is designed with a combination of ‘jsp+sevrlet+javabean’. Use jdbc to realize the basic addition, modification, deletion and check of the database.

 

**4. Link of the database with JavaBean:** 

Connect to the database of the model layer through JavaBean, and then cooperate with jsp and servlet to operate the database. 



**5. Servlet Controller Layer:** 

Processing the submitted message of jsp page, such as form submission and ajax submission. 



**6.  JSP Page, View Layer:** 

Display data message with javabean. 



**7. Connection of the database with JavaBean (Excerpt):** 

```java
package conns;
/**
* @author Fletcher
*/

import java.math.BigDecimal;
import java.sql.*;

public class ConnSql {
public static String url = "jdbc:mysql://localhost:3306/students"; // Address of
database
public static String userName = "root"; // Username of database
public static String passWord = "123456"; // Password of database
public static Connection conn = null;
public ConnSql(){
}
public static Connection getConnection(){
if(null == conn){
try {
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, userName, passWord);
} catch (Exception e)
e.printStackTrace();
return conn;
}
public static void main(String[] args) { //Test whether the database is connected
System.out.println(getConnection());
}
```



8. **Servlet page: Code of data insertion:** 

   ```java
   try{
   ConnSql test=new ConnSql();
   Connection one=test.getConnection();
   Statement statement = one.createStatement();
   String sql="INSERT INTO user (username,password,email,phone)
   VALUES('"+username+"','"+password+" password+"','"+email+"','"+
   int resultSet = statement.executeUpdate(sql);
   if(resultSet>0){
   out.println("<script>alert('Add
   successfully');window.location.href='web/admin/indexs.jsp';</script>");
   }
   out.println("<script>alert(' A dd failed');window.history.back();</script>");
   }catch(Exception
   out.println("<script>alert(' A dd
   failed');window.history.back();</script>");
   ```

   

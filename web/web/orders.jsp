<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>

<html>
	<head>
		<meta>
		<title>Happy ISD</title>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<link href="css/style.css" rel="stylesheet" type="text/css"/>
		<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
                <script src="web/js/jquery.js" type="text/javascript"></script>
		
                <script>
                    
                     $(function(){
                     
                         
                     })
                </script>
	</head>
	<body>
	
                        
                        <jsp:useBean id="test" class="conns.ConnSql"/>
						    <%
                 response.setContentType("text/html;charset=utf-8");
		
		request.setCharacterEncoding("utf-8");
               String cid = request.getParameter("cid");                                            
                String username = request.getParameter("username");
		//String dates = request.getParameter("password");
                 String uid = request.getParameter("uid");
                String address = request.getParameter("address");
		String phone = request.getParameter("phone");
                String nums = request.getParameter("nums");
                String shopid = request.getParameter("shopid");
                 java.sql.Timestamp stamp=new java.sql.Timestamp(System.currentTimeMillis());
		
		if (username == null || username.length() == 0) {
			out.println("<script>alert('请输入用户名');window.history.back();</script>");
		} else if (address == null || address.length() == 0) {
			out.println("<script>alert('请输入地址');window.history.back();</script>");
		}else if (phone == null || phone.length() == 0) {
			out.println("<script>alert('请输入电话');window.history.back();</script>");
		}
                
                
                
                else if (username.length() > 0 && address.length() > 0  && phone.length() > 0) {
                    
                  //  out.println("<script>alert('"+shopid+"');</script>");
                    
                  
                       try{
                         Connection one=test.getConnection();//获取getConnection()方法
                         Statement statement = one.createStatement();//获取操作数据库的对象
                         
                          String sql="INSERT INTO orders (cid,username,address,phone,dates,uid,nums,shops) VALUES(?,?,?,?,?,?,?,?)";
                          
                          PreparedStatement ptm=one.prepareStatement(sql);
   
                          ptm.setObject(1,cid);
                         
                          ptm.setObject(2,username);
                          ptm.setObject(3,address);
                         
                          ptm.setObject(4,phone);
                           ptm.setObject(5,stamp);
                           ptm.setObject(6,uid);
                          ptm.setObject(7,nums);
                          ptm.setObject(8,shopid);
                          
                          //int resultSet = statement.executeUpdate(sql);//执行sql，获取结果集
                          
                          int resultSet=ptm.executeUpdate();
                          if(resultSet>0){
                          
                                  out.println("<script>alert('购买成功');window.location.href='contentone.jsp?id=1';</script>");
                          
                          
                          }else{
                          
                           out.println("<script>alert('购买失败');window.history.back();</script>");
                          
                          }
                       
                          
                         }catch(Exception e){
                          out.println("<script>alert('购买失败!');window.history.back();</script>");
                           
                         }
                             
                           
                         
                        
			
		}





    
   %>
                        
                        
                        
			
			
	
	</body>
</html>

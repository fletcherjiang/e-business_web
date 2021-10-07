<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<title>Happy ISD</title>
		<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<link href="../css/admin.css" rel="stylesheet" type="text/css"/>
		<script src="../js/jquery.js" type="text/javascript"></script>
		<script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
                
		<script>
			$(function(){
				
				$(".login_cont").height($(window).height());
                               $("#adds").click(function(){
                                   
                                 var files = $('#files').get(0).files[0];
                                 
                                 if(!files){
                                    alert("Please upload the picture");
                                    return false;
                                }   
                        
                               }) 
                                
                                
                                
                                
			})
			 function validForm(fm){
                                   var  h1= document.getElementById("h1").value;
                                   var  h2= document.getElementById("h2").value;
                                   var  h3= document.getElementById("h3").value;
                                   var  h4= document.getElementById("h4").value;
                                    var  d7= document.getElementById("d7").value;
                                    fm.action = fm.action + "?title=" + h1+ "&&price=" + h2+ "&&stock=" + h3+ "&&content=" + h4+ "&&classes=" + d7;
                                     return true;
                                      }
		</script>
	</head>
	<body>
		<div class="login_cont">
		
				<%@ include file='left.jsp' %>
				<div class="admin_right">
					 <div class="top_r"></div>
					 
					 <div class="table_r">
						 <h2 align="center">Add User</h2>
						 
						  <hr style="border: 1px solid #ddd;"/>
						 
						 <!-- Single button -->
						 <div class="btn-group" style="margin: 10px;">
						   <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						     Edit Shop <span class="caret"></span>
						   </button>
						   <ul class="dropdown-menu">
						     <li><a href="editshop.jsp">Edit</a></li>
						    
						   </ul>
						 </div>
						 
						 
						 
						 <div class="add_user">
							 
							 
							 <form action="../../InsertShops" enctype="multipart/form-data"  method="post" onsubmit="return validForm(this)">
							  
                                                              <div class="form-group">
							     <label for="exampleInputEmail1">classes</label>
                                                             <select name="classes" class="form-control" id="d7">
                                                                 
                                                                 
                                                                 <option value="1">女装 / 内衣 / 家居</option>
                                                                <option value="2">女鞋 / 男鞋 / 箱包</option>
                                                                <option value="3">母婴 / 童装 / 玩具</option>
                                                               <option value="4"> 男装 / 运动户外</option>
                                                                <option value="5">美妆 / 彩妆 / 个护</option>
                                                                <option value="6">手机 / 数码 / 企业</option>
                                                                <option value="7">大家电 / 生活电器</option>
                                                                <option value="8">零食 / 生鲜 / 茶酒</option>
                                                                <option value="9">厨具 / 收纳 / 清洁</option>
                                                                <option value="10">家纺 / 家饰 / 鲜花</option>
                                                                <option value="11">图书音像 / 文具</option>
                                                                <option value="12">医药保健 / 进口</option>
                                                                <option value="13">汽车 / 二手车 / 用品</option>
                                                                <option value="14">房产 / 装修家具 / 建材</option>
                                                               <option value="15"> 手表 / 眼镜 / 珠宝饰品</option>
                                                                 
                                                                 
                                                             </select>
                                                             
							     </div>
                                                             
                                                             <div class="form-group">
							     <label for="exampleInputEmail1">Commodity Title</label>
                                                             <input type="text" class="form-control" id="h1" name="title" placeholder="Commodity Title">
							     </div>
                                                             
                                                             
                                                             
                                                             <div class="form-group">
							     <label for="exampleInputEmail1">Images</label>
                                                             <input type="file" name="uploadFile" id="files"/>
							   </div>
                                                             
                                                             
                                                             
                                                             
							   <div class="form-group">
							     <label for="exampleInputEmail1">Price</label>
                                                             <input type="text" class="form-control" id="h2" name="price" placeholder="Price">
							   </div>
                                                             
                                                             
                                                             
							   <div class="form-group">
							     <label for="exampleInputEmail1">Stock</label>
                                                             <input type="text" class="form-control" id="h3" name="stock" placeholder="Stock">
							   </div>
							   
							    <div class="form-group">
							     <label for="exampleInputEmail1">content</label>
                                                             <textarea  style="height:300px;"class="form-control"id="h4" name="content"></textarea>
							   </div>
							 
							   <button type="submit" id="adds" class="btn btn-default">Add Commodity</button>
							
							 </form>
							 
						 </div>
						 
						 
						 
						 
						 
					 </div>
					 
				</div>
	       </div>
                                
                                
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/wangeditor@latest/dist/wangEditor.min.js"></script>
                <script type="text/javascript">
  const E = window.wangEditor
  const editor = new E("#div1")
  // 或者 const editor = new E(document.getElementById('div1'))
  editor.create()
</script>
	</body>
</html>

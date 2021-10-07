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
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload; 
@WebServlet("/UpdateShopsone")
public class UpdateShopsone extends HttpServlet {
     
    private static final long serialVersionUID = 1L;
     
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
 
    /**
     * 上传数据及保存文件
     */
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        // 检测是否为多媒体上
        response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
        if (!ServletFileUpload.isMultipartContent(request)) {
            // 如果不是则停止
            PrintWriter writer = response.getWriter();
            writer.println("Error: 表单必须包含 enctype=multipart/form-data");
            writer.flush();
            return;
        }
 
        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);
        
        // 中文处理
        upload.setHeaderEncoding("UTF-8"); 

        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
        String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
       
         
        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
 
        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        HttpSession session = request.getSession(true);
                      
                        
                        //out.println(session.setAttribute("username"));
                        String filePath = uploadPath + File.separator + fileName;
                       // String stock = upload.getParameter("stock");
                        File storeFile = new File(filePath);
                        // 在控制台输出文件的上传路径
                        System.out.println(filePath);
                        // 保存文件到硬盘
                        item.write(storeFile);
                       response.setContentType("text/html;charset=utf-8");
		       request.setCharacterEncoding("utf-8");
                       String title = request.getParameter("title");
		       String price = request.getParameter("price");
                       String stock = request.getParameter("stock");
                       String content = request.getParameter("content");
                       // Object shopid=request.getSession().getAttribute("shop");
                    //  out.println("<script>alert('"+price+"')</script>");
		if (title.length() > 0 && price.length() > 0 && stock.length() > 0 && content.length() > 0) {
                  
                         try{
                          ConnSql test=new ConnSql();
                          Connection one=test.getConnection();//获取getConnection()方法
                          Statement statement = one.createStatement();//获取操作数据库的对象
                          String userid = request.getParameter("id");                       
                          String sql="UPDATE commodity SET title='"+title+"',images='"+fileName+"',price='"+price+"',stock='"+stock+"',content='"+content+"' WHERE cid="+userid;
                          
                          int resultSet = statement.executeUpdate(sql);//执行sql，获取结果集
                          if(resultSet>0){
                          
                                 out.println("<script>alert('更新成功');window.location.href='web/shop/shops.jsp';</script>");
                          
                          
                         }else{
                          
                          out.println("<script>alert('更新失败');window.history.back();</script>");
                          
                          }
                          // out.println("<script>alert('"+shopid+"');window.history.back();</script>");
                          
                         }catch(Exception e){
                          out.println("<script>alert('错误！');window.history.back();</script>");
                           
                         }
                             

		}    
                       
    
                      }

                }
    
            }
   
        } catch (Exception ex) {
            request.setAttribute("message",
                    "错误信息: " + ex.getMessage());
        }
        // 跳转到 message.jsp
       // getServletContext().getRequestDispatcher("/web/admin/message.jsp").forward(
              //  request, response);
    }
}
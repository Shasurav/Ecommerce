import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.util.UUIDGenerator;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import org.bson.Document;

import com.mongodb.MongoClient;

public class signup extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	    resp.setContentType("text/html");  
	    String first_name="";  
	    String last_name="";  
	    String email_id="";  
	    String password="";  
	    String mobile="";  
	    String type=""; 
	    String address = "";
	    String name ="";
	    UUID uuid = UUID.randomUUID();
	    if(ServletFileUpload.isMultipartContent(req)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(new ServletRequestContext(req));
                for(FileItem item1 : multiparts){
                    if(!item1.isFormField()){
                        name = uuid.toString();
                        item1.write( new File("/Users/shashank/Desktop/java/mini-flipkart/WebContent/user" + File.separator + name+".jpg"));  
                        
                    }
                    if (item1.isFormField()) { 
             			 
            			if (item1.getFieldName().equals("first_name")) {
            			    first_name  = item1.getString();
            			  }
            			else if (item1.getFieldName().equals("last_name")) {
            			    last_name  = item1.getString();
            			  }
            			else if (item1.getFieldName().equals("email")) {
            			    email_id  = item1.getString();
            			  }
            			else if (item1.getFieldName().equals("pwd")) {
            			    password  = item1.getString();
            			  }
            			else if (item1.getFieldName().equals("mob")) {
            			    mobile  = item1.getString();
            			  }
            			else if (item1.getFieldName().equals("gender")) {
            			    type = item1.getString();
            			  }
            			else if (item1.getFieldName().equals("address")) {
            			    address = item1.getString();
            			  }
                    }
                }
            } catch (Exception ex) {
               ex.printStackTrace();
            } 
	    }
	    
	   
	    mongodbSingleton mongodb = mongodbSingleton.getInstance();
	   if( mongodb.identify(name).equals("yes")){
	    mongodb.insert(first_name,last_name,name,email_id,password,mobile,type,address);
	    
	    HttpSession session = req.getSession();
		session.setAttribute("user", name);
		
			 if(type.equals("Seller")){
			 RequestDispatcher rd=req.getRequestDispatcher("seller.jsp");  
		        rd.forward(req,resp); 
			 }else if(type.equals("Buyer")){
				 RequestDispatcher rd=req.getRequestDispatcher("buyer.jsp");  
			        rd.forward(req,resp);  
			 }
	   }
	   else if (mongodb.identify(name).equals("no")){
		   RequestDispatcher rd=req.getRequestDispatcher("signup-page.html");
	   }
	}
}

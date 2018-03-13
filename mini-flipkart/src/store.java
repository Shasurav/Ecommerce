import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import org.json.JSONArray;


@WebServlet("/store")
@MultipartConfig 
public class store extends HttpServlet
{
	
	 @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 	
		 	String item = "";
		    String price = "";
		    String warranty = "";
		    String detail = "";
		    String quantity = "";
		    String user = "";
		    UUID item_id = UUID.randomUUID();
		    ArrayList<String> arr = new ArrayList();
		    if(ServletFileUpload.isMultipartContent(req)){
	            try {
	                List<FileItem> multiparts = new ServletFileUpload(
	                                         new DiskFileItemFactory()).parseRequest(new ServletRequestContext(req));
	                for(FileItem item1 : multiparts){
	                    if(!item1.isFormField()){
	                    	UUID item_name = UUID.randomUUID();
	                        String name = item_name.toString();
	                        item1.write( new File("/Users/shashank/Desktop/java/mini-flipkart/WebContent/images" + File.separator + name+".jpg"));  
	                        arr.add(name+".jpg");
	                    }
	                    if (item1.isFormField()) { 
	             			 
	            			if (item1.getFieldName().equals("item")) {
	            			    item  = item1.getString();
	            			  }
	            			else if (item1.getFieldName().equals("price")) {
	            			    price  = item1.getString();
	            			  }
	            			else if (item1.getFieldName().equals("years")) {
	            			    warranty  = item1.getString();
	            			  }
	            			else if (item1.getFieldName().equals("detail")) {
	            			    detail  = item1.getString();
	            			  }
	            			else if (item1.getFieldName().equals("quantity")) {
	            			    quantity  = item1.getString();
	            			  }
	            			else if (item1.getFieldName().equals("user")) {
	            			    user  = item1.getString();
	            			  }
	                    }
	                }
	            } catch (Exception ex) {
	               ex.printStackTrace();
	            } 
		    }
		    
		    mongodbSingleton mongodb = mongodbSingleton.getInstance();
		    mongodb.mystore(item,item_id.toString(), price, warranty, detail, quantity,arr.toString(),user);
		    RequestDispatcher rd=req.getRequestDispatcher("SellerUpload.jsp");  
	        rd.forward(req,resp);
	}
	 
}

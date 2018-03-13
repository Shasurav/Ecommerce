import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class signin extends  HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	    resp.setContentType("text/html");  
	    String email =req.getParameter("email");
	    String password =req.getParameter("pwd");
	    
	    
	    mongodbSingleton mongodb = mongodbSingleton.getInstance();
	    String pass = mongodb.search(email);
	    String type = mongodb.matchs(email);
	    String user = mongodb.searchuser(email);
	    HttpSession session = req.getSession();
		session.setAttribute("user",user);
		 if(password.equals(pass))
		 { 
			 if(type.equals("Seller")){
			 RequestDispatcher rd=req.getRequestDispatcher("seller.jsp");  
		        rd.forward(req,resp); 
			 }else if(type.equals("Buyer")){
				 RequestDispatcher rd=req.getRequestDispatcher("buyer.jsp");  
			        rd.forward(req,resp);  
			 }
		 }else
		 {
			 RequestDispatcher rd=req.getRequestDispatcher("signup-page.html");  
		        rd.include(req,resp); 
		 }
	}
}

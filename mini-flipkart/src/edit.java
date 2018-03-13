import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
@WebServlet("/edit")
public class edit extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String address = req.getParameter("address");
		String email = req.getParameter("email");
		String mob = req.getParameter("mob");
		String user = req.getParameter("user");
		
		
		Document query = new Document("EmailId",user);
		mongodbSingleton mongodb = mongodbSingleton.getInstance();
		Document doc = new Document();
		if(firstname!=""){
			doc.append("FirstName",firstname);
		}
		if(lastname!=""){
			doc.append("LastName", lastname);
		}
		if(address!=""){
			doc.append("Address",address);
		}
		if(email!=""){
			doc.append("EmailId", email);
		}
		if(mob!=""){
			doc.append("Mobile", mob);
		}
		MongoCollection<Document> collection = mongodb.edit();
		collection.updateOne(Filters.eq("EmailId",user), new Document("$set",doc));
		mongodb.close();
		String type = mongodb.match(user);
		 if(type.equals("Seller")){
			 RequestDispatcher rd=req.getRequestDispatcher("seller.jsp");  
		        rd.forward(req,resp); 
			 }else if(type.equals("Buyer")){
				 RequestDispatcher rd=req.getRequestDispatcher("buyer.jsp");  
			        rd.forward(req,resp);  
			 }
	}
}

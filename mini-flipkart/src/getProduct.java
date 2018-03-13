import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.mongodb.client.MongoCursor;
@WebServlet("/id")
public class getProduct extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		mongodbSingleton mongodb = mongodbSingleton.getInstance();
		MongoCursor<Document> cursor = mongodb.id(id);
		try {
		    while (cursor.hasNext()) {
		    	resp.getWriter().write(cursor.next().toJson());
		    }
		} finally {
		    cursor.close();
		
		}
		mongodb.close();
	}
}

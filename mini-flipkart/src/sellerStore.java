import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;
import org.json.JSONArray;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import jdk.nashorn.internal.runtime.JSONListAdapter;
@WebServlet("/sellerStore")
public class sellerStore extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JSONArray arr = new JSONArray();
		String user = req.getParameter("user");
		mongodbSingleton mongodb = mongodbSingleton.getInstance();
		MongoCursor<Document> cursor = mongodb.sellerStore(user);
		try {
		    while (cursor.hasNext()) {
		    	arr.put(cursor.next());
		    }
		    resp.getWriter().write(arr.toString());
		} finally {
		    cursor.close();
		}
		mongodb.close();
		
	
	}

}

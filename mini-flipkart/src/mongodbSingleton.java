import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoWriteException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.IndexOptions;
import com.mongodb.client.model.Projections;

public class mongodbSingleton {

	private static mongodbSingleton mongodb;
	private static MongoClient mongoclient;
	private mongodbSingleton(){ }
	
	synchronized public static mongodbSingleton getInstance(){
		
		if(mongodb==null)
		{
			mongodb = new mongodbSingleton();
		}
		return mongodb;
	}
	
	private static MongoDatabase getdatabase(){
		
		mongoclient = new MongoClient("localhost",27017);
		MongoDatabase database = mongoclient.getDatabase("sampledatabase");
		return database;
	}
	private void duplicate(){
		Document index = new Document("user", 1);
	    MongoCollection<Document> collection = mongoclient.getDatabase("sampledatabase").getCollection("miniflipkart");
	    collection.createIndex(index, new IndexOptions().unique(true));
	}
	
	 public void insert(String first_name, String last_name,String uuid, String email_id,String password,String mobile,String type,String address){
		
		    
		 Document doc = new Document("FirstName",first_name)
				 	.append("LastName", last_name)
				 	.append("user", uuid)
	                .append("EmailId",email_id)
	                .append("Password",password)
	                .append("Mobile",mobile)
	                .append("Type", type)
	                .append("Address", address);
		 MongoDatabase database = this.getdatabase();
		  MongoCollection<Document> collections = database.getCollection("miniflipkart");
		  collections.insertOne(doc);
		 
		  
		  
		  if(mongoclient!=null)
			  mongoclient.close();
		  
	 }
	 public String search(String email){
		 MongoDatabase database = this.getdatabase();
		 MongoCollection<Document> collection = database.getCollection("miniflipkart");
		 Document document = collection
		            .find(new BasicDBObject("EmailId",email))
		             .projection(Projections.fields(Projections.include("Password"), Projections.excludeId())).first();
		 String pass = document.getString("Password");
		
		 
		  if(mongoclient!=null)
			  mongoclient.close();
		  
		 return pass;
	 }
	 public String searchuser(String email){
		 MongoDatabase database = this.getdatabase();
		 MongoCollection<Document> collection = database.getCollection("miniflipkart");
		 Document document = collection
		            .find(new BasicDBObject("EmailId",email))
		             .projection(Projections.fields(Projections.include("user"), Projections.excludeId())).first();
		 String user = document.getString("user");
		
		 
		  if(mongoclient!=null)
			  mongoclient.close();
		  
		 return user;
	 }
	 public String match(String uuid){
		 MongoDatabase database = this.getdatabase();
		 MongoCollection<Document> collection = database.getCollection("miniflipkart");
		 Document document = collection
		            .find(new BasicDBObject("user",uuid))
		             .projection(Projections.fields(Projections.include("Type"), Projections.excludeId())).first();
		 String type = document.getString("Type");
		
		 
		  if(mongoclient!=null)
			  mongoclient.close();
		  
		 return type;
	 }
	 public String matchs(String email){
		 MongoDatabase database = this.getdatabase();
		 MongoCollection<Document> collection = database.getCollection("miniflipkart");
		 Document document = collection
		            .find(new BasicDBObject("EmailId",email))
		             .projection(Projections.fields(Projections.include("Type"), Projections.excludeId())).first();
		 String type = document.getString("Type");
		
		 
		  if(mongoclient!=null)
			  mongoclient.close();
		  
		 return type;
	 }
	 public void mystore(String item,String item_id, String price, String warranty, String detail, String quantity,String fileName,String user){
		 
		 Document doc = new Document("Item",item)
	                .append("Item_id",item_id)
	                .append("Price", price)
	                .append("Warranty", warranty)
	                .append("Detail",detail)
	                .append("Quantity", quantity)
         			.append("File", fileName)
					.append("user", user);
		 MongoDatabase database = this.getdatabase();
		  MongoCollection<Document> collections = database.getCollection("store");
		  collections.insertOne(doc);
		  
		  if(mongoclient!=null)
			  mongoclient.close(); 
	 }
	 public MongoCursor<Document> sellerStore(String user){
		 MongoDatabase database = this.getdatabase();
		 MongoCollection<Document> collection = database.getCollection("store");
		 MongoCursor<Document> cursor = collection.find(Filters.eq("user",user)).iterator();
			
			return cursor;
	 }
	 public String identify(String user){
		 MongoDatabase database = this.getdatabase();
		 MongoCollection<Document> collection = database.getCollection("miniflipkart");
		 MongoCursor<Document> cursor = collection.find(Filters.eq("user",user)).iterator();
			
		 	if(cursor!=null){return "yes";}
		 
			return "No";
	 }
	 public MongoCursor<Document> buyerStore( ){
		 MongoDatabase database = this.getdatabase();
		 MongoCollection<Document> collection = database.getCollection("store");
		 MongoCursor<Document> cursor = collection.find().iterator();
			
			return cursor;
	 }
	 public MongoCursor<Document> data(String user){
		 MongoDatabase database = this.getdatabase();
		 MongoCollection<Document> collection = database.getCollection("miniflipkart");
		 MongoCursor<Document> cursor = collection.find(Filters.eq("user",user)).iterator();
			
			return cursor;
	 }
	 public MongoCursor<Document> id(String user){
		 MongoDatabase database = this.getdatabase();
		 MongoCollection<Document> collection = database.getCollection("store");
		 MongoCursor<Document> cursor = collection.find(Filters.eq("Item",user)).iterator();
			
			return cursor;
	 }
	 public MongoCollection<Document> edit(){
		 MongoDatabase database = this.getdatabase();
		 MongoCollection<Document> collection = database.getCollection("miniflipkart");
		 
		 return collection;
	 }
	 public void close(){
		 if(mongoclient!=null)
			  mongoclient.close();
	 }
	
}

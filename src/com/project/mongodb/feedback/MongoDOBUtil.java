package com.project.mongodb.feedback;

import java.net.UnknownHostException;

import org.apache.log4j.Logger;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.util.JSON;


public class MongoDOBUtil {
	public static final Logger logger = Logger.getLogger(MongoDOBUtil.class);
	static final String URL_MONGODB = "mongodb://localhost:27017";
	static final String DATABASE = "akimeet";
	static final String COLLECTION = "feedback";
	static MongoClient mongoClient;
	public MongoDOBUtil(){
		logger.info("Create Object MongoDOBUtil");
	}
	
	/**
	 * Get connection to mongodb
	 * @return
	 */
	public static MongoClient getConnectionMongoDB(){
		logger.info("Connecting to MongoDB");
		try {
			mongoClient = new MongoClient(new MongoClientURI(URL_MONGODB));
			//DB database = mongoClient.getDB(DATABASE);
			logger.info("Connect to database successfully: " + URL_MONGODB + "/" +DATABASE);
			
			//DBCollection dbCollection = database.getCollection(COLLECTION);
			
			return mongoClient;
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * Insert json to collecion in database
	 * @param database
	 * @param collection
	 * @param jsonData
	 */
	public static void insertDocument(String database, String collection, String jsonData){
		logger.info("Insert document to "+ database + "and" + collection);
		DB db = mongoClient.getDB(database);
		DBCollection dbCollection = db.getCollection(collection);
		
		// convert JSON to DBObject directly
		DBObject dbObject = (DBObject) JSON
							.parse(jsonData);
		
		dbCollection.insert(dbObject);
		
		logger.info("Insert successfull");
	}
	
	/**
	 * Find all document
	 * @param database
	 * @param collection
	 * @return
	 */
	public static DBCursor findAllDocument(String database, String collection){
		logger.info("Find all document "+ database + "and" + collection);
		DB db = mongoClient.getDB(database);
		DBCollection dbCollection = db.getCollection(collection);
		
		DBCursor cursorDoc = dbCollection.find();
		
		return cursorDoc;
	}
}

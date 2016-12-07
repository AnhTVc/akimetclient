package com.project.mongodb.feedback;

import java.net.UnknownHostException;
import java.util.ArrayList;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;

public class Test {

	public static void main(String[] args) {
		try {
			MongoClient mongoClient = new MongoClient(new MongoClientURI("mongodb://localhost:27017"));
			
			DB database = mongoClient.getDB("akimeet");
			System.out.println("Connect to database successfully");
			
			DBCollection dbCollection = database.getCollection("users");
			System.out.println("Collection mycol selected successfully");
			System.out.println("-------------Find doc first-------------------");
			//Find document first
			DBObject doc = dbCollection.findOne();
			System.out.println(doc);
			System.out.println("--------------Find all------------------");
			
			//Find all document
			DBCursor cursor = dbCollection.find();
			while(cursor.hasNext()) {
			    System.out.println(cursor.next());
			}
			System.out.println("--------------find where age: 19------------------");
			
			//find with where
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("age", 19);
			DBCursor cursorWithWhere = dbCollection.find(whereQuery);
			while(cursorWithWhere.hasNext()) {
			    System.out.println(cursorWithWhere.next());
			}
			System.out.println("---------------Find in-----------------");
			// Find $in exemple
			BasicDBObject inQuery = new BasicDBObject();
			ArrayList<String> list = new ArrayList<String>();
			list.add("P");
			list.add("abc");
			
			inQuery.put("status", new BasicDBObject("$in", list));
			DBCursor cursorIn = dbCollection.find(inQuery);
			while(cursorIn.hasNext()) {
				System.out.println(cursorIn.next());
			}
			
			
			//More example https://www.mkyong.com/mongodb/java-mongodb-query-document/
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

}

package com.project.DAO;

import com.google.gson.Gson;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.project.POJO.Feedback;
import com.project.POJO.Rate;
import com.project.util.constant.Config;



import org.apache.log4j.Logger;

import java.util.ArrayList;

/**
 * Created by VietAnh on 11/21/2016.
 */
public class FeedbackMongoDBDAO {
    public static final Logger logger = Logger.getLogger(FeedbackMongoDBDAO.class);

    /**
     * Find Feedback for Restaurant
     * @param idRestaurant
     * @return
     */
    public static ArrayList<Feedback> findFeedbackByIdRestaurant(String idRestaurant){
        logger.info("Find all feedback of Restaurant");
        MongoDBUtil mongoDBUtil = new MongoDBUtil();
        mongoDBUtil.getConnectionMongoDB();
        BasicDBObject whereQuery = new BasicDBObject();
        whereQuery.put("idRestaurant", idRestaurant);
        DBCursor dbCursorFeedback = mongoDBUtil.findWithWhereQuery(Config.DATABASE_MONGODB, Config.COLLECTION_FEEBACK, whereQuery);

        ArrayList<Feedback> feedbacks = new ArrayList<>();
        Feedback feedback;

        Gson gson = new Gson();
        if(dbCursorFeedback!= null){
            while(dbCursorFeedback.hasNext()) {
                DBObject dbObject = dbCursorFeedback.next();
                feedback = gson.fromJson(dbObject.toString(), Feedback.class);
                feedbacks.add(feedback);
            }
        }

        mongoDBUtil.closeConnection();
        logger.info("Find complete");
        return feedbacks;
    }

    /**
     * Insert feedback to Restaurant
     * @param
     * @return
     */
    public static void insertFeedbacByIdRestaurant(Feedback feedback){
        logger.info("Insert feedback to restaurant");
        MongoDBUtil mongoDBUtil = new MongoDBUtil();
        mongoDBUtil.getConnectionMongoDB();

        Gson gson = new Gson();
        mongoDBUtil.insertDocument(Config.DATABASE_MONGODB, Config.COLLECTION_FEEBACK,
                gson.toJson(feedback));

        mongoDBUtil.closeConnection();

        logger.info("Insert feedback complete");
    }
    
    /**
     * Insert feedback to Restaurant
     * @param
     * @return
     */
    public static boolean insertRatingByIdRestaurant(Rate rate){
        try {
        	logger.info("Insert feedback to restaurant");
            MongoDBUtil mongoDBUtil = new MongoDBUtil();
            mongoDBUtil.getConnectionMongoDB();

            Gson gson = new Gson();
            mongoDBUtil.insertDocument(Config.DATABASE_MONGODB, Config.COLLECTION_RATING,
                    gson.toJson(rate));

            mongoDBUtil.closeConnection();

            logger.info("Insert feedback complete");
            
            return true;
		} catch (Exception e) {
			logger.error(e);
			
			return false;
		} 

    }

}

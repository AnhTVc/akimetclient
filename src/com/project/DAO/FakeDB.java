package com.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import com.project.POJO.Address;
import com.project.POJO.Restaurant;
import com.project.util.constant.Define;

public class FakeDB {
	Connection connection;
	public FakeDB(){
		BasicConfigurator.configure();
		connection= DBPool.getConnection();
	}
	public static final Logger logger = Logger.getLogger(FakeDB.class);
	/**
	 * Fake import Restaurant
	 * @param restaurant
	 * @return
	 */
	public boolean importFakeRestaurant(Restaurant restaurant){

		PreparedStatement preparedStatement;
		
		String query = "INSERT INTO restaurant (name, introduce, avatar, images, type) VALUES (?, ?, ?, ?, ?)";
		logger.info(query);
		try {
			preparedStatement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, restaurant.getName());
			preparedStatement.setString(2, restaurant.getIntroduce());
			preparedStatement.setString(3, restaurant.getAvatar());
			
			String images = "";
			for (String temp : restaurant.getImages()) {
				images += temp + ",";
			}
			preparedStatement.setString(4, images);
			preparedStatement.setInt(5, 2);
			
			preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();
			while(resultSet.next()){
				int id = resultSet.getInt(1);
				//Import address
				Address address = restaurant.getAddress();
				String insert = "INSERT INTO address (detail, city, district, id_restaurant) VALUES (?,?,?,?)";
				logger.info(insert);
				PreparedStatement prepared = connection.prepareStatement(insert);
				
				prepared.setString(1, address.getDetail());
				prepared.setString(2, address.getCity());
				prepared.setString(3, address.getDistrict());
				prepared.setInt(4, id);
				
				prepared.executeUpdate();
				
				String insertCollection = "INSERT INTO collection (id_restaurant, type) VALUES (?,?)";
				PreparedStatement statement = connection.prepareStatement(insertCollection);
				statement.setInt(1, id);
				statement.setInt(2, Define.TAG_DRINK_MOC);
				
				statement.executeUpdate();
				
				logger.info("Init fake data complete");
				return true;
				
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		
		return false;
	}

	/**
	 * Import infomation user when click view page
	 * @param values
	 * @return
	 */
	public boolean importAnalytic(String values){
		PreparedStatement preparedStatement;
		
		String query = "INSERT INTO analytics(`values`) VALUES (?)";
		logger.info(query);
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, values);
			
			preparedStatement.executeUpdate();
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public void close(){
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

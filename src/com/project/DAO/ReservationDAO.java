package com.project.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.project.POJO.Reservation;
import com.project.POJO.GSON.Reservations;

public class ReservationDAO {
	static Connection connection = null;
	public static final Logger LOGGER = Logger.getLogger(ReservationDAO.class);
	/**
	 * Người dùng đặt bàn 
	 * @return
	 */
	public boolean createReservation(Reservation reservation) {
		connection = DBPool.getConnection();
		String query = "INSERT INTO reservation "
				+ "(id_customer, id_restaurant, id_sale, date, time, count_people,"
				+ " name_customer,contact_customer,phone_customer,sale_off)"
				+ " VALUES(?, ?, ?, ?, ? ,? , ?, ?, ?, ?)";
		
		LOGGER.info(query);
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setInt(1, Integer.parseInt(reservation.getIdCustomer()));
			preparedStatement.setInt(2, Integer.parseInt(reservation.getIdRestaurant()));
			preparedStatement.setInt(3, Integer.parseInt(reservation.getIdSale()));
			preparedStatement.setDate(4, Date.valueOf(reservation.getDate()));
			preparedStatement.setTime(5, Time.valueOf(reservation.getTime() + ":00"));
			preparedStatement.setInt(6, reservation.getCountPeople());
			preparedStatement.setString(7, reservation.getNameCustomer());
			preparedStatement.setString(8, reservation.getContactCustomer());
			preparedStatement.setString(9, reservation.getPhoneCustomer());
			preparedStatement.setString(10, reservation.getSaleOff());
			
			preparedStatement.executeUpdate();
			LOGGER.info(preparedStatement);
			connection.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			LOGGER.error(e);
		}
		return false;
	}
	
	/**
	 * List Reservation
	 * @param idBoss
	 * @return
	 */
	public static Reservations listReservation(String idBoss) {
		String query = "Select * from boss, reservation WHERE boss.id_restaurant = reservation.id_restaurant"
				+ " and boss.id_boss = ?";
		connection = DBPool.getConnection();
		LOGGER.info(query);
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(idBoss));
			
			ResultSet rsD = preparedStatement.executeQuery();
			
			ArrayList<Reservation> list = new ArrayList<Reservation>();
			Reservation reservation = null;
			while(rsD.next()){
				reservation = new Reservation();
				
				 reservation.setIdDeservation(String.valueOf(rsD
	                        .getString("id_deservation")));
	                reservation.setDate(rsD.getString("date"));
	                reservation.setTime(rsD.getString("time"));
	                reservation.setCountPeople(rsD.getInt("count_people"));
	                reservation.setStatus(rsD.getInt("status"));
	                reservation.setTimeCreate(rsD.getString("time_create"));
	                reservation.setNameCustomer(rsD
	                        .getString("name_customer"));
	                reservation.setContactCustomer(rsD
	                        .getString("contact_customer"));
	                String idSale = rsD.getString("id_sale");

	                //Sale sale = findSaleById(idSale, connection);
	                reservation.setIdSale(idSale);

	                list.add(reservation);
			}
			
			connection.close();
			Reservations reservations = new Reservations();
			reservations.setReservations(list);
			return reservations;
		} catch (SQLException e) {
			// TODO: handle exception
			LOGGER.error(e);
		}
		return null;
	}
}

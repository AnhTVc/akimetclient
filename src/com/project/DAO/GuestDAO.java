package com.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.project.POJO.Customer;
import com.project.POJO.Reservation;

public class GuestDAO {
	public static final Logger LOGGER = Logger.getLogger(GuestDAO.class);
	Connection connection = null;

	/**
	 * Tìm kiếm danh sách đơn đặt chỗ cho người dùng
	 * 
	 * @param idCustomer
	 * @return
	 */
	public ArrayList<Reservation> listReservationByGuest(String idCustomer) {
		String query = "SELECT * FROM reservation where id_customer = ?";
		connection = DBPool.getConnection();
		LOGGER.info(query);
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(idCustomer));
			ResultSet rs = preparedStatement.executeQuery();

			ArrayList<Reservation> reservations = new ArrayList<Reservation>();
			Reservation reservation = null;
			while (rs.next()) {
				reservation = new Reservation();
				reservation.setIdDeservation(String.valueOf(rs
						.getInt("id_deservation")));
				reservation.setIdCustomer(idCustomer);
				reservation.setIdRestaurant(String.valueOf(rs
						.getInt("id_restaurant")));
				reservation.setDate(String.valueOf(rs.getDate("date")));
				reservation.setTime(String.valueOf(rs.getTime("time")));
				reservation.setTimeCreate(String.valueOf(rs
						.getTimestamp("time_create")));
				reservation.setStatus(rs.getInt("status"));
				reservation.setCountPeople(rs.getInt("count_people"));
				reservation.setSaleOff(rs.getString("sale_off"));
				reservation.setNameRestaurant(rs.getString("name_restaurant"));
				reservation.setAddressDetail(rs.getString("address_detail"));

				reservations.add(reservation);
			}

			connection.close();

			return reservations;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			LOGGER.error(e);
		}

		return null;
	}

	/**
	 * Change status = -2: khách hàng tự hủy
	 * 
	 * @param idReservation
	 * @return
	 */
	public boolean cancelStatusReservation(String idReservation) {
		String query = "UPDATE reservation SET status = -2 where id_deservation = ?";

		connection = DBPool.getConnection();
		LOGGER.info(query);
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(idReservation));

			preparedStatement.executeUpdate();

			connection.close();
			return true;
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * Change password guest
	 * 
	 * @param oldPWD
	 * @param newPWS
	 * @return
	 */
	public boolean changePWD(String oldPWD, String newPWS, String idCustomer) {
		String query = "SELECT id_customer,username  from customer where password = ?";
		connection = DBPool.getConnection();
		LOGGER.info(query);
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement(query);

			preparedStatement.setString(1, oldPWD);

			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				if(rs.getString("id_customer").equals(idCustomer)){
					query = "";
					query = "UPDATE customer SET password = ? where id_customer = ?";
					LOGGER.info(query);
					preparedStatement = null;
					preparedStatement = connection.prepareStatement(query);

					preparedStatement.setString(1, newPWS);
					preparedStatement.setInt(2, rs.getInt("id_customer"));

					preparedStatement.executeUpdate();
					return true;
				}
			}
			connection.close();
			return false;

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * Thay đổi email liên hệ
	 * 
	 * @return
	 */
	public boolean changeEmail(String idCustomer, String mail) {
		String query = "UPDATE customer SET mail = ? where id_customer = ?";
		LOGGER.info(query);

		connection = DBPool.getConnection();

		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement(query);
			preparedStatement.setString(1, mail);
			preparedStatement.setInt(2, Integer.parseInt(idCustomer));

			preparedStatement.executeUpdate();
			connection.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * Thay phone
	 * 
	 * @param idCustomer
	 * @param phoneNumber
	 * @return
	 */
	public boolean changePhone(String idCustomer, String phoneNumber) {
		String query = "UPDATE customer SET phoneNumber = ? where id_customer = ?";
		LOGGER.info(query);

		connection = DBPool.getConnection();

		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement(query);
			preparedStatement.setString(1, phoneNumber);
			preparedStatement.setInt(2, Integer.parseInt(idCustomer));

			preparedStatement.executeUpdate();
			connection.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * Tìm theo trạng thái giao dich
	 * 
	 * @param idCutomer
	 * @param status
	 * @return
	 */
	public ArrayList<Reservation> findResevationsByStatus(String idCustomer,
			int status) {
		String query = "SELECT * FROM reservation where id_customer = ? and status = ?";
		connection = DBPool.getConnection();
		LOGGER.info(query);
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(idCustomer));
			preparedStatement.setInt(2, status);
			ResultSet rs = preparedStatement.executeQuery();

			ArrayList<Reservation> reservations = new ArrayList<Reservation>();
			Reservation reservation = null;
			while (rs.next()) {
				reservation = new Reservation();
				reservation.setIdDeservation(String.valueOf(rs
						.getInt("id_deservation")));
				reservation.setIdCustomer(idCustomer);
				reservation.setIdRestaurant(String.valueOf(rs
						.getInt("id_restaurant")));
				reservation.setDate(String.valueOf(rs.getDate("date")));
				reservation.setTime(String.valueOf(rs.getTime("time")));
				reservation.setTimeCreate(String.valueOf(rs
						.getTimestamp("time_create")));
				reservation.setStatus(rs.getInt("status"));
				reservation.setCountPeople(rs.getInt("count_people"));
				reservation.setSaleOff(rs.getString("sale_off"));
				reservation.setNameRestaurant(rs.getString("name_restaurant"));
				reservation.setAddressDetail(rs.getString("address_detail"));

				reservations.add(reservation);
			}

			connection.close();

			return reservations;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			LOGGER.error(e);
		}

		return null;
	}

	/**
	 * Tim kiem theo khoang thoi gian
	 * 
	 * @param timeStart
	 * @param timeEnd
	 * @return
	 */
	public ArrayList<Reservation> findReservationBetweenTime(String timeStart,
			String timeEnd, String idCustomer) {
		String query = null;
		connection = DBPool.getConnection();
		PreparedStatement preparedStatement = null;
		if (timeStart == null) {
			// Không có thời điểm bắt đầu
			query = "SELECT * from reservation where id_customer = ? and time_create < ?";
			LOGGER.info(query);
			try {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, Integer.parseInt(idCustomer));
				preparedStatement.setTimestamp(2, Timestamp.valueOf(timeEnd));

			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}

		} else if (timeEnd == null) {
			// Khong co thoi diem ket thuc
			// Không có thời điểm bắt đầu
			query = "SELECT * from reservation where id_customer = ? and time_create > ?";
			LOGGER.info(query);
			try {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, Integer.parseInt(idCustomer));
				preparedStatement.setTimestamp(2, Timestamp.valueOf(timeStart));

			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else {
			// Có du cả 2
			query = "SELECT * from reservation where id_customer = ? and time_create between ? and ?";
			LOGGER.info(query);
			try {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, Integer.parseInt(idCustomer));
				preparedStatement.setTimestamp(2, Timestamp.valueOf(timeStart));
				preparedStatement.setTimestamp(3, Timestamp.valueOf(timeEnd));

			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		try {
			ResultSet rs = preparedStatement.executeQuery();
			ArrayList<Reservation> reservations = new ArrayList<Reservation>();
			Reservation reservation = null;
			while (rs.next()) {
				reservation = new Reservation();
				reservation.setIdDeservation(String.valueOf(rs
						.getInt("id_deservation")));
				reservation.setIdCustomer(idCustomer);
				reservation.setIdRestaurant(String.valueOf(rs
						.getInt("id_restaurant")));
				reservation.setDate(String.valueOf(rs.getDate("date")));
				reservation.setTime(String.valueOf(rs.getTime("time")));
				reservation.setTimeCreate(String.valueOf(rs
						.getTimestamp("time_create")));
				reservation.setStatus(rs.getInt("status"));
				reservation.setCountPeople(rs.getInt("count_people"));
				reservation.setSaleOff(rs.getString("sale_off"));
				reservation.setNameRestaurant(rs.getString("name_restaurant"));
				reservation.setAddressDetail(rs.getString("address_detail"));

				reservations.add(reservation);
			}

			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		return null;
	}
	
	/**
	 * 
	 * @param idCustomer
	 * @return
	 */
	public Customer findCustomer(String idCustomer){
		connection = DBPool.getConnection();
		
		try {
			String query = "SELECT username, email, phone_number,name FROM customer where id_customer = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(idCustomer));
			
			ResultSet rs = preparedStatement.executeQuery();
			
			if(rs.next()){
				Customer customer = new Customer();
				customer.setEmail(rs.getString("email"));
				customer.setName(rs.getString("name"));
				customer.setIdCustomer(idCustomer);
				customer.setPhoneNumber(rs.getString("phone_number"));
				
				return customer;
			}
			connection.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}
	
	public boolean updateInfoCustomer(Customer customer){
		connection = DBPool.getConnection();
		
		try {
			String query = "Update customer SET name = ?, email = ?, phone_number = ? where id_customer = ?";
			LOGGER.info(query);
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, customer.getName());
			preparedStatement.setString(2, customer.getEmail());
			preparedStatement.setInt(3, Integer.parseInt(customer.getPhoneNumber()));
			preparedStatement.setInt(4, Integer.parseInt(customer.getIdCustomer()));
			
			
			preparedStatement.executeUpdate();
			
			connection.close();
			return true;
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return false;
	}
}

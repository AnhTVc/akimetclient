package com.project.DAO;

import java.sql.*;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.project.POJO.Boss;
import com.project.POJO.Customer;
import com.project.POJO.People;
import com.project.POJO.Reservation;
import com.project.POJO.Restaurant;
import com.project.util.SecurityUtil;
import com.project.util.constant.Constant;

public class PeopleDAO {
	private static final int MAX_CONNECTION = 10;
	public static final Logger LOGGER = Logger.getLogger(PeopleDAO.class);
	
	static Connection connection = null;
	static PreparedStatement preStatement = null;
	static ResultSet resultSet = null;

	public PeopleDAO() {
		DBPool.build(MAX_CONNECTION);
	}

	/**
	 * Check login return people
	 * 
	 * @param email
	 * @param password
	 * @param isBoss
	 * @return
	 */
	public static People loginBoss(String email, String password, boolean isBoss) {
		LOGGER.info("Boss login with email: " + email);
		
		String query = null;
		if (isBoss) {
			query = "SELECT id_boss,email,id_restaurant, full_name FROM boss where password = ?";
		} else {
			query = "SELECT email, id_customer FROM customer where password = ?";
		}
		connection = DBPool.getConnection();
		LOGGER.info(query);
		try {
			preStatement = connection.prepareStatement(query);
			preStatement.setString(1, password);
			resultSet = preStatement.executeQuery();
			while (resultSet.next()) {
				if (email.equals(resultSet.getString("email"))) {
					if (isBoss) {
						Boss boss = new Boss();
						boss.setIdBoss(String.valueOf(resultSet.getInt("id_boss")));
						boss.setEmail(email);
						boss.setFullName(resultSet.getString("full_name"));
						
						Restaurant restaurant = new Restaurant();
						restaurant.setIdRestaurant(resultSet
								.getString("id_restaurant"));

						boss.setRestaurant(restaurant);
						return boss;
					} else {
						Customer customer = new Customer();
						customer.setIdCustomer(resultSet
								.getString("id_customer"));
						customer.setEmail(resultSet.getString("email"));

						return customer;
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Customer loginCustomer(Customer customer, String status) {
		String query = null;
		Customer tempCustommer = new Customer();
		connection = DBPool.getConnection();
		if (status.equals(Constant.LOGIN_NORMAL)) {
			// Login bình thường
			query = "SELECT email, id_customer, name FROM customer WHERE password = ?";
			LOGGER.info(query);
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, customer.getPassword());
				
				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					if (resultSet.getString("email").equals(customer.getEmail())) {
						
						tempCustommer.setName(customer.getEmail());
						tempCustommer.setEmail(customer.getEmail());
						tempCustommer.setIdCustomer(resultSet.getString("id_customer"));
						
						return tempCustommer;
					}
				}
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return null;
		} else if (status.equals(Constant.LOGIN_FACEBOOK)) {
			// Login with facebook
			query = "select name, id_customer from customer where user_uid = ?;";
			LOGGER.info(query);
			try {
				preStatement = connection.prepareStatement(query);
				
				preStatement.setString(1, customer.getUserId());
				
				resultSet = preStatement.executeQuery();
				if (resultSet.next()) {
					if (customer.getName().equals(resultSet.getString("name"))) {
						tempCustommer.setName(resultSet.getString("name"));
						tempCustommer.setIdCustomer(resultSet.getString("id_customer"));
						
						return tempCustommer;
					}
				} else {
					// Chưa tồn tại
					String queryInsert = "INSERT INTO customer (username, name, user_uid, contact) VALUES(?, ?, ?, ?);";

					LOGGER.info(queryInsert);
					PreparedStatement statement =  connection.prepareStatement(queryInsert, PreparedStatement.RETURN_GENERATED_KEYS);
					
					statement.setString(1, customer.getName());
					statement.setString(2, customer.getName());
					statement.setString(3, customer.getUserId());
					statement.setString(4, "https://www.facebook.com/" + customer.getUserId());
					
					statement.executeUpdate();
					
					resultSet = statement.getGeneratedKeys();
					if (resultSet.next()) {
						tempCustommer.setIdCustomer(String.valueOf(resultSet.getInt(1)));
						tempCustommer.setName(customer.getName());
					}
					return tempCustommer;
				}
			} catch (SQLException e) {
				LOGGER.error(e);
			}
			return null;

		} else if (status.equals(Constant.LOGIN_GOOGLE)) {
			// Login with google
			query = "select name, id_customer from customer WHERE email = ?";
			LOGGER.info(query);
			try {
				preStatement = connection.prepareStatement(query);
				preStatement.setString(1, customer.getEmail());
				resultSet = preStatement.executeQuery();
				if (resultSet.next()) {
					System.out.print("Name:" + resultSet.getString("name"));
					if (customer.getName().equals(resultSet.getString("name"))) {
						tempCustommer.setIdCustomer(resultSet.getString("id_customer"));
						tempCustommer.setName(resultSet.getString("name"));
						
						return tempCustommer;
					}
				} else {
					// Chưa tồn tại
					String queryInsert = "INSERT INTO customer (username, name, email, contact) VALUES(?, ?, ?, ?);";
					LOGGER.info(queryInsert);
					
					PreparedStatement statement = connection.prepareStatement(queryInsert, PreparedStatement.RETURN_GENERATED_KEYS);
					statement.setString(1, customer.getEmail());
					statement.setString(2, customer.getName());
					statement.setString(3, customer.getEmail());
					statement.setString(4, customer.getEmail());
					
					statement.executeUpdate();
					
					resultSet = statement.getGeneratedKeys();
					if (resultSet.next()) {
						tempCustommer.setIdCustomer(String.valueOf(resultSet.getInt(1)));
						tempCustommer.setName(customer.getName());
					}

					return tempCustommer;
				}
			} catch (SQLException e) {
				LOGGER.error(e);
			}
			return null;
		}
		return null;
	}

	/**
	 * Customer register
	 * 
	 * @param customer
	 * @return
	 */
	public Customer registerCustomer(Customer customer) {
		connection = DBPool.getConnection();
		String queryInsert = "INSERT INTO customer(email, password, phone_number, name, username) VALUES(?, ?, ?, ?, ?)";
		
		LOGGER.info(queryInsert);
		try {
			PreparedStatement st = connection.prepareStatement(queryInsert);
			st.setString(1, customer.getEmail());
			st.setString(2, SecurityUtil.getMD5(SecurityUtil.getMD5(customer.getPassword())));
			st.setString(3, customer.getPhoneNumber());
			st.setString(4, customer.getEmail());
			st.setString(5, customer.getEmail());
			
			st.executeUpdate();

			Customer temp = new Customer();
			temp.setEmail(customer.getEmail());
			temp.setName(customer.getEmail());
			temp.setUsername(customer.getEmail());
			temp.setPhoneNumber(customer.getPhoneNumber());

			return temp;
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * Register to table boss Create data in restaurant
	 * 
	 * @param boss
	 * @return
	 */
	public Boss registerBoss(Boss boss) {

		connection = DBPool.getConnection();

		String queryInsertRt = "INSERT INTO restaurant(status_update) values(0);";
		LOGGER.info(queryInsertRt);
		try {
			Statement statement = (Statement) connection.createStatement();
			statement.executeUpdate(queryInsertRt, Statement.RETURN_GENERATED_KEYS);
			
			resultSet = statement.getGeneratedKeys();
			if (resultSet.next()) {
				String idRestaurant = String.valueOf(resultSet.getInt(1));
				String queryInsert = "INSERT INTO boss(email, password, phone_number, full_name, username, id_restaurant) VALUES(?, ?, ?, ?, ?, ?)";
				
				LOGGER.info(queryInsert);
				PreparedStatement st = connection.prepareStatement(queryInsert, PreparedStatement.RETURN_GENERATED_KEYS);
				
				st.setString(1, boss.getEmail());
				st.setString(2, (boss.getPassword()));
				st.setString(3, boss.getPhoneNumber());
				st.setString(4, boss.getFullName());
				st.setString(5, boss.getEmail());
				st.setInt(6, Integer.parseInt(idRestaurant));
				st.executeUpdate();
				
				ResultSet rs = st.getGeneratedKeys();
				if(rs.next()){
					String idBoss = String.valueOf(rs.getInt(1));
					Boss temp = new Boss();
					temp.setEmail(boss.getEmail());
					temp.setFullName(boss.getEmail());
					temp.setUsername(boss.getEmail());
					temp.setPhoneNumber(boss.getPhoneNumber());
					temp.setIdBoss(idBoss);
					
					Restaurant restaurant = new Restaurant();
					restaurant.setIdRestaurant(idRestaurant);
					temp.setRestaurant(restaurant);
					System.out.print("Id Restaurant new Resgiater: " + restaurant.getIdRestaurant() + temp.getFullName());
					
					return temp;
				}
				
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return null;
	}

	public Customer findCustomerById(String idCustomer){
		String query = "Select username, email, name, phone_number, contact "
				+ "FROM customer where id_customer = ?";
		Customer customer = new Customer();
		LOGGER.info(query);
		connection = DBPool.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setInt(1, Integer.valueOf(idCustomer));
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()){
				customer.setUsername(resultSet.getString("username"));
				customer.setEmail(resultSet.getString("email"));
				customer.setName(resultSet.getString("name"));
				customer.setPhoneNumber(resultSet.getString("phone_number"));
				customer.setContact(resultSet.getString("contact"));
			}
			
			connection.close();
			
			return customer;
		} catch (SQLException e) {
			// TODO: handle exception
			
		}
		return null;
	}
	/**
     * Nhà hàng đăng nhập: return
     * @param email
     * @param password
     * @return: trả lại id nhà hàng
     */
    public Boss adminRestaurantLogin(String email, String password){
        String query = "SELECT id_boss, email, id_restaurant, full_name FROM boss where email = ?";
        connection = DBPool.getConnection();

        try {
            PreparedStatement preStatement = connection.prepareStatement(query);
            preStatement.setString(1, email);

            ResultSet resultSet = preStatement.executeQuery();
            if (resultSet.next()) {
                if (password.equals(resultSet.getString("password"))) {
                    Boss boss = new Boss();
                    boss.setIdBoss(String.valueOf(resultSet.getInt("id_boss")));
                    boss.setEmail(email);
                    boss.setFullName(resultSet.getString("full_name"));

                    Restaurant restaurant = new Restaurant();
                    restaurant.setIdRestaurant(resultSet
                            .getString("id_restaurant"));

                    restaurant = getReservationByRestaurant(restaurant);
                    boss.setRestaurant(restaurant);
                    //return boss;
                    return boss;
                }
            }
            connection.close();
        }catch (SQLException e){
            LOGGER.error(e);
        }
        LOGGER.info(query);
        return null;
    }

    /**
     * Tìm kiếm tất cả các đơn đặt hàng của nhà hàng
     * @param restaurant
     * @return
     */
    public Restaurant getReservationByRestaurant(Restaurant restaurant){
        String upComing = "select * from reservation where date > now() and id_restaurant = ?";
        connection = DBPool.getConnection();
        PreparedStatement preparedStD = null;
        ResultSet rsD = null;
        ArrayList<Reservation> reservations = new ArrayList<Reservation>();
        Reservation reservation = null;
        try {
            preparedStD = connection.prepareStatement(upComing);

            preparedStD.setInt(1, Integer.parseInt(restaurant.getIdRestaurant()));
            rsD = preparedStD.executeQuery();
            while (rsD.next()) {
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

                reservations.add(reservation);
            }

            restaurant.setDeservationsUpComing(reservations);

            connection.close();
            return  restaurant;
        } catch (SQLException e) {
            LOGGER.error(e);
        }
       return null;
    }
    
    /**
     * 
     * @param idBoss
     * @return
     */
    public static Boss findBossbyIdBoss(String idBoss){
    	String query = "select full_name, email, phone_number, username from boss where id_boss = ?;";
    	LOGGER.info(query);
    	Boss boss = new Boss();
    	connection = DBPool.getConnection();
    	try {
    		PreparedStatement preparedStatement = connection.prepareStatement(query);
    		preparedStatement.setInt(1, Integer.parseInt(idBoss));
    		
    		ResultSet resultSet = preparedStatement.executeQuery();
    		while(resultSet.next()){
    			boss.setFullName(resultSet.getString("full_name"));
    			boss.setEmail(resultSet.getString("email"));
    			boss.setPhoneNumber(resultSet.getString("phone_number"));
    			boss.setUsername(resultSet.getString("username"));
    		}
    		
			connection.close();
			
			return boss;
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return null;
    }
    
}

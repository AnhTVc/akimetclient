package com.project.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.project.POJO.Address;
import com.project.POJO.Boss;
import com.project.POJO.Reservation;
import com.project.POJO.GroupMenu;
import com.project.POJO.Menu;
import com.project.POJO.Restaurant;
import com.project.POJO.Sale;
import com.project.POJO.GSON.OverviewRestaurant;
import com.project.util.ProcessUtil;

public class RestaurantDAO {
	public static final Logger logger = Logger.getLogger(RestaurantDAO.class);
	private static String temp;
	private static ArrayList<GroupMenu> groupMenus;
	private static Reservation deservation;

	/**
	 * Return: restaurant: sale + time_sale + address
	 * 
	 * @param idRestaurant
	 * @return
	 */
	public static Restaurant findRestaurantById(String idRestaurant) {
		System.out.println("Find restaurant by id: " + idRestaurant);
		Restaurant restaurant = null;

		String query = "SELECT * from restaurant where restaurant.id_restaurant = "
				+ idRestaurant + ";";
		Connection connection = DBPool.getConnection();
		PreparedStatement preStatement = null;
		ResultSet resultSet = null;

		try {
			preStatement = connection.prepareStatement(query);
			resultSet = preStatement.executeQuery(query);
			if (resultSet.next()) {
				restaurant = new Restaurant();
				restaurant.setName(resultSet.getString("name"));
				// restaurant.setPhoneNumber(resultSet.getString("phone_number"));
				restaurant
						.setIdRestaurant(resultSet.getString("id_restaurant"));
				restaurant.setAvatar(resultSet.getString("avatar"));
				restaurant.setIntroduce(resultSet.getString("introduce"));
				restaurant
						.setStatusUpdate(resultSet.getString("status_update"));
				restaurant.setContact(resultSet.getString("contact"));
				restaurant.setActive(resultSet.getInt("active"));
				// Lấy danh sách các ảnh của restaurant
				temp = resultSet.getString("images");
				if (temp != null && !temp.isEmpty()) {
					/*
					 * Cách dấu ; để tách thành các phần tử
					 */
					restaurant.setImages(ProcessUtil
							.splitStringBySub(temp, ";"));
				}

				// Lấy danh mục món ăn
				String queryGM = "Select * from group_menu where id_restaurant = "
						+ restaurant.getIdRestaurant() + ";";
				PreparedStatement preparedStGM = null;
				groupMenus = new ArrayList<GroupMenu>();
				ArrayList<Menu> menus = null;
				GroupMenu groupMenu = null;

				ResultSet rsGM = null;
				try {

					preparedStGM = connection.prepareStatement(queryGM);
					rsGM = preparedStGM.executeQuery();

					while (rsGM.next()) {
						// Có giá trị từng group menu
						groupMenu = new GroupMenu();
						groupMenu.setIdGroupMenu(String.valueOf(rsGM
								.getInt("id_group_menu")));
						groupMenu.setName(rsGM.getString("name"));

						menus = new ArrayList<Menu>();

						Menu menu = null;
						// Tìm từng món ăn
						String queryMenu = "select * from menu where id_group_menu = "
								+ rsGM.getInt("id_group_menu") + ";";

						PreparedStatement preparedStMenu = connection
								.prepareStatement(queryMenu);
						ResultSet rsMenu = preparedStMenu.executeQuery();

						while (rsMenu.next()) {
							menu = new Menu();

							menu.setIdMenu(String.valueOf(rsMenu
									.getInt("id_menu")));
							menu.setDescribe(rsMenu.getString("describes"));
							menu.setImage(rsMenu.getString("image"));
							menu.setName(rsMenu.getString("name"));
							menu.setPrice(String.valueOf(rsMenu.getInt("price")));
							menu.setSale(String.valueOf(rsMenu.getInt("price")));

							menus.add(menu);
						}

						groupMenu.setMenus(menus);
						groupMenus.add(groupMenu);
					}

					restaurant.setGroupMenus(groupMenus);

				} catch (SQLException e) {
					e.printStackTrace();
				}

				// Lấy thông tin đặt bàn sắp diễn ra tình từ thời điểm hiện tại
				String upComing = "select * from reservation where date > now() and id_restaurant = ?;";
				PreparedStatement preparedStD = null;
				ResultSet rsD = null;
				ArrayList<Reservation> deservations = new ArrayList<Reservation>();
				deservation = null;
				try {
					preparedStD = connection.prepareStatement(upComing);
					preparedStD.setInt(1, Integer.parseInt(idRestaurant));
					
					rsD = preparedStD.executeQuery();
					while (rsD.next()) {
						deservation = new Reservation();

						deservation.setIdDeservation(String.valueOf(rsD
								.getString("id_deservation")));
						deservation.setDate(rsD.getString("date"));
						deservation.setTime(rsD.getString("time"));
						deservation.setCountPeople(rsD.getInt("count_people"));
						deservation.setStatus(rsD.getInt("status"));
						deservation.setTimeCreate(rsD.getString("time_create"));
						deservation.setNameCustomer(rsD
								.getString("name_customer"));
						deservation.setContactCustomer(rsD
								.getString("contact_customer"));
						String idSale = rsD.getString("id_sale");

						//Sale sale = findSaleById(idSale, connection);
						deservation.setIdSale(idSale);

						deservations.add(deservation);
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}

				restaurant.setDeservationsUpComing(deservations);
				// Get info sale
				query = "Select * from sale where id_restaurant = "
						+ restaurant.getIdRestaurant() + ";";

				PreparedStatement preparedStatement = null;
				ResultSet rs = null;
				try {
					preparedStatement = connection.prepareStatement(query);
					rs = preparedStatement.executeQuery();

					Sale sale = null;
					while (rs.next()) {
						sale = new Sale();

						sale.setIdSale(rs.getString("id_sale"));
						sale.setSaleOff(rs.getString("sale_off"));
						sale.setStatus(rs.getInt("status"));
						sale.setTimeCreate(rs.getString("time_create"));
						sale.setTime(rs.getString("time"));

						restaurant.setSale(sale);

					}
					// Find address
					String checkadd = "Select * from address where id_restaurant = "
							+ idRestaurant + ";";

					try {
						PreparedStatement preparedStAdd = connection
								.prepareStatement(checkadd);
						ResultSet resultSetAdd = preparedStAdd.executeQuery();

						Address address = null;
						if (resultSetAdd.next()) {
							address = new Address();

							address.setCity(resultSetAdd.getString("city"));
							address.setDetail(resultSetAdd
									.getString("district"));
							address.setDetail(resultSetAdd.getString("detail"));
							address.setIdAdress(String.valueOf(resultSetAdd
									.getInt("id_address")));

							restaurant.setAddress(address);
						}
					} catch (SQLException e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					return restaurant;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return restaurant;
	}

	/**
	 * Tìm kiếm thông tin nhà hàng bởi thông tin: idBoss.
	 * Đang áp dụng cho mobile
	 * @param idBoss
	 * @return
	 */
	public static OverviewRestaurant finOverviewRestaurantByIdboss(String idBoss){
		System.out.println("Find restaurant by idBoss: " + String.valueOf(idBoss));
		Restaurant restaurant = null;
		int countUsage = 0;
		String query = "SELECT restaurant.name, restaurant.id_restaurant, restaurant.contact "
				+ "FROM restaurant,boss "
				+ "where  restaurant.id_restaurant = boss.id_restaurant "
				+ "and boss.id_boss = ?;";
		
		logger.info(query);
		Connection connection = DBPool.getConnection();
		PreparedStatement preStatement = null;
		ResultSet resultSet = null;

		try {
			preStatement = connection.prepareStatement(query);
			preStatement.setInt(1, Integer.parseInt(idBoss));
			
			resultSet = preStatement.executeQuery();
			if (resultSet.next()) {
				restaurant = new Restaurant();
				restaurant.setName(resultSet.getString("name"));
				// restaurant.setPhoneNumber(resultSet.getString("phone_number"));
				restaurant
						.setIdRestaurant(resultSet.getString("id_restaurant"));

				restaurant.setContact(resultSet.getString("contact"));
				
				//Đếm số lượng đã sử dụng
				String countquery = "select count(*) from reservation where id_restaurant = ?;";
				//Lấy thông tin đặt bàn sắp diễn ra tình từ thời điểm hiện tại
				logger.info(countquery);
				PreparedStatement preparedStD = null;
				preparedStD = connection.prepareStatement(countquery);
				
				preparedStD.setInt(1,Integer.parseInt(restaurant.getIdRestaurant()));
				ResultSet rsD = preparedStD.executeQuery();
				
				while (rsD.next()) {
					 countUsage = rsD.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		//Find boss
		Boss boss = PeopleDAO.findBossbyIdBoss(idBoss);
		boss.setRestaurant(restaurant);
		
		OverviewRestaurant overviewRestaurant = new OverviewRestaurant();
		overviewRestaurant.setBoss(boss);
		overviewRestaurant.setUsageStatistics(countUsage);
		
		return overviewRestaurant;
	}
	
	/**
	 * Thêm ảnh cho nhà hàng
	 * 
	 * @param urlImage
	 * @return
	 */
	public static boolean addImageRestaurant(String urlImage,
			String idRestaurant) {
		if (urlImage != null) {
			String query = "select * from restaurant where id_restaurant = "
					+ idRestaurant + ";";
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			Connection connection = DBPool.getConnection();
			try {
				preparedStatement = connection.prepareStatement(query);
				rs = preparedStatement.executeQuery();
				if (rs.next()) {
					String images = rs.getString("images");
					images = images + ";" + urlImage;

					String queryupdate = "UPDATE restaurant SET images = '"
							+ images + "' where id_restaurant = "
							+ idRestaurant + ";";
					Statement statement = connection.createStatement();
					statement.executeUpdate(queryupdate);
					return true;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	/**
	 * Thêm ảnh cho nhà hàng
	 * 
	 * @param urlImage
	 * @return
	 */
	public static boolean addAvatarRestaurant(String urlImage,
			String idRestaurant) {
		logger.info("Process add avatar restaurant");

		if (urlImage != null) {
			String query = "select * from restaurant where id_restaurant = "
					+ idRestaurant + ";";
			logger.info(query);
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			Connection connection = DBPool.getConnection();
			try {
				preparedStatement = connection.prepareStatement(query);
				rs = preparedStatement.executeQuery();
				if (rs.next()) {
					String images = rs.getString("avatar");
					images = images + ";" + urlImage;

					String queryupdate = "UPDATE restaurant SET avatar = ? where id_restaurant = ?;";
					logger.info(query);
					PreparedStatement pStatement = connection
							.prepareStatement(queryupdate);

					pStatement.setString(1, urlImage);
					pStatement.setInt(2, Integer.parseInt(idRestaurant));
					pStatement.executeUpdate();

					return true;
				}

			} catch (SQLException e) {
				logger.error(e);
			}
		}
		return false;
	}

	public static Sale findSaleById(String idSale, Connection connection) {
		String query = "select * from sale where id_sale = " + idSale + ";";
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		Sale sale = null;
		try {
			preparedStatement = connection.prepareStatement(query);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				sale = new Sale();

				sale.setIdSale(rs.getString("id_sale"));
				sale.setSaleOff(rs.getString("sale_off"));
				sale.setStatus(rs.getInt("status"));
				sale.setTimeCreate(rs.getString("time_create"));
				sale.setTime(rs.getString("time"));
			}

			return sale;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 
	 * @param address
	 * @param idRestaurant
	 * @param connection
	 * @return
	 */
	public static boolean updateAddress(Address address, String idRestaurant,
			Connection connection) {
		if (address != null) {
			// Cập nhật địa chỉ
			/*
			 * Kiểm tra xem nhà hàng đã có thông tin address chưa. Nếu có thì
			 * update, chưa thì tạo mới
			 */
			String check = "Select * from address where id_restaurant = "
					+ idRestaurant + ";";
			PreparedStatement preStatement = null;
			ResultSet resultSet = null;

			try {
				preStatement = connection.prepareStatement(check);
				resultSet = preStatement.executeQuery();

				String excute = null;
				if (resultSet.next()) {
					// Đã có thông tin

					excute = "UPDATE address SET detail = '"
							+ address.getDetail() + "', city='"
							+ address.getCity() + "', district= '"
							+ address.getDistrict() + "' WHERE id_restaurant="
							+ idRestaurant + ";";
				} else {
					// Chưa có thông tin ==> tạo mới thông tin
					excute = "INSERT INTO address(detail, city, district, id_restaurant) VALUES ('"
							+ address.getDetail()
							+ "', '"
							+ address.getCity()
							+ "', '"
							+ address.getDistrict()
							+ "', "
							+ idRestaurant + ")";
				}

				Statement statement = (Statement) connection.createStatement();
				statement.executeUpdate(excute);

				// Cập nhật xong thông tin địa chỉ nhà hàng

			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}

	/**
	 * Update Info restaurant: (create if need) Update address, update sale
	 * 
	 * @param restaurant
	 * @return
	 */
	public static boolean updateInfoRestaurant(Restaurant restaurant,
			String idClassify) {
		Address address = restaurant.getAddress();
		Sale sale = restaurant.getSale();
		Connection connection = DBPool.getConnection();

		// Cập nhập address
		if (address != null) {
			updateAddress(address, restaurant.getIdRestaurant(), connection);
		}

		// Cập nhập sale
		if (sale != null) {
			// Cập nhật thông tin giảm giá
			updateSales(sale, restaurant.getIdRestaurant(), connection);
		}

		// Cập nhật Groups menu
		ArrayList<GroupMenu> groupMenus = restaurant.getGroupMenus();
		GroupMenu groupMenu = null;
		if (groupMenus != null) {
			if (groupMenus.size() > 0) {
				// Có cập nhật
				for (int i = 0; i < groupMenus.size(); i++) {
					/**
					 * Nếu groups menu không có Id, chỉ có name, không có menu
					 * ==> đây là tạo mới
					 * 
					 * 
					 */
					groupMenu = new GroupMenu();
					groupMenu = groupMenus.get(i);
					if (groupMenu.getMenus() == null) {
						// Cập nhật dữ liệu group menu
						// Có thể là thêm mới hoặc chỉnh sửa
						updateGroupMenu(groupMenu,
								restaurant.getIdRestaurant(), connection);
					} else {
						// Cập nhật menu
						ArrayList<Menu> menus = groupMenus.get(i).getMenus();
						if (menus != null) {
							if (menus.size() > 0) {
								for (int j = 0; j < menus.size(); j++) {
									updateMenu(menus.get(j), groupMenus.get(i)
											.getIdGroupMenu(), idClassify,
											restaurant.getIdRestaurant(),
											connection);
								}
							}

						}
					}

				}
			}
		}

		// Cập nhật thông tin cơ bản cho nhà hàng
		updateBassicRestaurant(restaurant, connection);
		return true;
	}

	/**
	 * Cập nhật thông tin giảm giá Sale luôn luôn cập nhật thông tin dựa theo
	 * status Đã check injection
	 * 
	 * @param sales
	 * @param idRestaurant
	 * @return
	 */
	public static boolean updateSales(Sale sale, String idRestaurant,
			Connection connection) {
		System.out.println("Restaurant update sale with id: " + idRestaurant
				+ " ...");
		if (sale != null) {
			// Cập nhật địa chỉ
			/*
			 * Kiểm tra xem nhà hàng đã có thông tin address chưa. Nếu có thì
			 * update, chưa thì tạo mới
			 */
			String check = "Select * from sale where id_restaurant = ?";
			PreparedStatement preStatement = null;
			ResultSet resultSet = null;

			try {
				preStatement = connection.prepareStatement(check);
				preStatement.setInt(1, Integer.parseInt(idRestaurant));
				resultSet = preStatement.executeQuery();

				if (resultSet.next()) {
					// Đã có thông tin
					/*
					 * Change status của sale cũ tới -1 Tạo sale mới status = 0;
					 */
					check = "UPDATE sale SET status = -1 WHERE id_restaurant = ?";
					preStatement = connection.prepareStatement(check);
					preStatement.setInt(1, Integer.parseInt(idRestaurant));

					preStatement.executeUpdate();
					/*
					 * statement
					 * .addBatch("UPDATE sale SET status = -1 WHERE id_restaurant="
					 * + idRestaurant + "");
					 */

					check = "INSERT INTO sale(id_restaurant, sale_off, time, from_date, to_date) VALUES (?, ?, ?, ?, ?)";

					preStatement = connection.prepareStatement(check);
					preStatement.setInt(1, Integer.parseInt(idRestaurant));
					preStatement.setInt(2, Integer.parseInt(sale.getSaleOff()));
					preStatement.setString(3, sale.getTime());
					preStatement.setDate(4, Date.valueOf(sale.getFromDate()));
					preStatement.setDate(5, Date.valueOf(sale.getToDate()));

					preStatement.executeUpdate();

					/*
					 * excute =
					 * "INSERT INTO sale(id_restaurant, sale_off, time, from_date, to_date) VALUES ("
					 * + idRestaurant + ", " + sale.getSaleOff() + ", '" +
					 * sale.getTime() + "', '" + sale.getFromDate() + "', '" +
					 * sale.getToDate() + "');"; statement.addBatch(excute);
					 */
				} else {
					// Chưa có thông tin ==> tạo mới thông tin
					/*
					 * excute =
					 * "INSERT INTO sale(id_restaurant, sale_off, time, from_date, to_date) VALUES ("
					 * + idRestaurant + ", '" + sale.getSaleOff() + "', '" +
					 * sale.getTime() + "', " + sale.getFromDate() + ", " +
					 * sale.getToDate() + ");"; statement.addBatch(excute);
					 */

					String execute = "INSERT INTO sale(id_restaurant, sale_off, time, from_date, to_date) VALUES (?, ?, ?, ?, ?)";

					PreparedStatement preparedStatement = connection
							.prepareStatement(execute);
					preparedStatement.setInt(1, Integer.parseInt(idRestaurant));
					preparedStatement.setInt(2,
							Integer.parseInt(sale.getSaleOff()));
					preparedStatement.setString(3, sale.getTime());
					preparedStatement.setDate(4,
							Date.valueOf(sale.getFromDate()));
					preparedStatement
							.setDate(5, Date.valueOf(sale.getToDate()));

					preparedStatement.executeUpdate();
				}

				/* statement.executeBatch(); */

				logger.info("Update sale restaurant: " + idRestaurant
						+ " susscess!");
				// Cập nhật xong sale cho nhà hàng
				return true;
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
				logger.info("Update sale restaurant: " + idRestaurant
						+ " error!");
			}
		}
		return false;
	}

	/**
	 * Tìm menu theo id
	 * 
	 * @param idMenu
	 * @return
	 */
	public static Menu findMenuById(String idMenu) {
		Connection connection = DBPool.getConnection();
		PreparedStatement preStatement = null;
		ResultSet resultSet = null;
		Menu menu = null;
		if (idMenu != null) {
			String query = "select * from menu where id_menu = " + idMenu + ";";
			try {
				preStatement = connection.prepareStatement(query);

				resultSet = preStatement.executeQuery();
				while (resultSet.next()) {
					menu = new Menu();
					menu.setIdMenu(String.valueOf(resultSet.getInt("id_menu")));
					menu.setDescribe(resultSet.getString("describes"));
					menu.setImage(resultSet.getString("image"));
					menu.setName(resultSet.getString("name"));
					menu.setNameRestaurant(resultSet
							.getString("name_restaurant"));
					menu.setPrice(resultSet.getString("price"));
					menu.setSale(resultSet.getString("sale"));

					return menu;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}

		return null;
	}

	/**
	 * Cập nhật từng món ăn
	 * 
	 * @param menu
	 * @param connection
	 * @return
	 */
	public static boolean updateMenu(Menu menu, String idGroupMenu,
			String idClassify, String idRestaurant, Connection connection) {
		System.out.println("Restaurant update Menu with id: " + idRestaurant
				+ " ...");
		if (menu != null) {
			// Cập nhật địa chỉ
			/*
			 * Kiểm tra xem nhà hàng đã có thông tin address chưa. Nếu có thì
			 * update, chưa thì tạo mới
			 */
			String excute = null;
			if (menu.getIdMenu() != null) {
				// Check null từng trường trong menu. nếu null là không cập nhật
				// trường đó

				// Cập nhật menu
				// Có giảm giá sâu với sản phẩm này
				excute = "UPDATE address SET id_group_menu = " + idGroupMenu
						+ ", id_classify=" + idClassify + ", id_restaurant= '"
						+ idRestaurant + ", name = '" + menu.getName()
						+ "',price= '" + menu.getPrice() + "', image = '"
						+ menu.getImage() + "', describes='"
						+ menu.getDescribe() + "' WHERE id_menu="
						+ menu.getIdMenu() + ";";
			} else {
				// Chưa có thông tin ==> tạo mới thông tin
				// TODO Check xem có giảm giá sâu đối với mặt hàng này không
				excute = "INSERT INTO menu(id_group_menu, id_classify, id_restaurant, name, price, image, describes) VALUES ("
						+ idGroupMenu
						+ ", "
						+ idClassify
						+ ", "
						+ idRestaurant
						+ ", '"
						+ menu.getName()
						+ "', '"
						+ menu.getPrice()
						+ "', '"
						+ menu.getImage()
						+ "', '"
						+ menu.getDescribe() + "');";
			}
			try {
				System.out.print("====>" + excute);

				Statement statement = (Statement) connection.createStatement();
				statement.executeUpdate(excute);
				System.out.println("Update success!");
				// Cập nhật xong thông tin menu
				return true;

			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
				return false;
			}
		}

		return false;
	}

	/**
	 * Cập nhật loại món ăn cho nhà hàng
	 * 
	 * @param groupMenu
	 * @param idRestaurant
	 * @param connection
	 * @return
	 */
	public static GroupMenu updateGroupMenu(GroupMenu groupMenu,
			String idRestaurant, Connection connection) {
		System.out.println("Restaurant GroupMenu sale with id: " + idRestaurant
				+ " ...");
		String query = null;
		if (groupMenu.getIdGroupMenu() != null) {
			// Thực hiện update thông tin đã có sẵn
			query = "UPDATE group_menu SET name = '" + groupMenu.getName()
					+ "' WHERE id_group_menu = " + groupMenu.getIdGroupMenu()
					+ ";";

		} else {
			// Thực hiện tạo mới dữ liệu
			query = "INSERT INTO group_menu(name, id_restaurant) VALUES ('"
					+ groupMenu.getName() + "', " + idRestaurant + ")";
		}

		try {
			Statement statement = (Statement) connection.createStatement();
			statement.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);

			ResultSet resultSet = statement.getGeneratedKeys();
			if (resultSet.next()) {
				groupMenu.setIdGroupMenu(String.valueOf(resultSet.getInt(1)));
				System.out.println("Update success!");
				return groupMenu;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	/**
	 * cập nhật mô tả cho nhà hàng
	 * 
	 * @param restaurant
	 * @return
	 */
	public static boolean updateIntroduceRestaurant(Restaurant restaurant) {
		logger.info("Update introduce for restauarnt");
		Connection connection = DBPool.getConnection();
		String execute = "UPDATE restaurant SET introduce = ? where id_restaurant = ?";
		logger.info(execute);

		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement(execute);
			preparedStatement.setString(1, restaurant.getIntroduce());
			preparedStatement.setInt(2,
					Integer.parseInt(restaurant.getIdRestaurant()));

			preparedStatement.executeUpdate();

			return true;
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e);
		}
		return false;
	}

	/**
	 * Cập nhật thông tin cơ bản cho nhà hàng
	 * 
	 * @param restaurant
	 * @param connection
	 * @return
	 */
	public static boolean updateBassicRestaurant(Restaurant restaurant,
			Connection connection) {
		logger.info("Update bassic for restaurant!");

		/**
		 * Update thông tin, Nếu trường hợp thông tin đẩy vào là NULL thì không
		 * update
		 */
		// Check null các trường thông tin
		String query = "UPDATE restaurant SET status_update = 1, ";
		if (restaurant.getName() != null) {
			query = query + "name = '" + restaurant.getName() + "', ";
		}

		if (restaurant.getIntroduce() != null) {
			query = query + "introduce = '" + restaurant.getIntroduce() + "', ";
		}

		if (restaurant.getAvatar() != null) {
			query = query + "avatar = '" + restaurant.getAvatar() + "', ";
		}

		if (restaurant.getContact() != null) {
			query = query + "contact = '" + restaurant.getContact()
					+ "' where id_restaurant = " + restaurant.getIdRestaurant()
					+ ";";
		}

		// Thực hiện update
		try {
			Statement statement = (Statement) connection.createStatement();
			statement.executeUpdate(query);
			logger.info(statement);
			return true;
		} catch (SQLException e) {
			logger.error(e);
		}
		return false;
	}

	/**
	 * Trường hợp update thông tin nhà hàng trả về dữ liệu là nhà hàng Đang áp
	 * dụng cho tạo mới menu ==> trả là idMenu ==> để cập nhập ảnh cho nhà hàng
	 * 
	 * @param restaurant
	 * @param idClassify
	 * @return
	 */
	public static Restaurant updateInfoRestaurantReturnRestaurant(
			Restaurant restaurant, String idClassify) {
		logger.info("RestaurantDAO update info return restaurant");

		Connection connection = DBPool.getConnection();
		Restaurant restaurantResult = new Restaurant();
		ArrayList<GroupMenu> groupMenusResult = new ArrayList<GroupMenu>();
		ArrayList<Menu> menusResult = new ArrayList<Menu>();
		Menu menuResult = null;
		GroupMenu groupMenuResult = new GroupMenu();
		;

		// Cập nhật Groups menu
		ArrayList<GroupMenu> groupMenus = restaurant.getGroupMenus();
		if (groupMenus != null) {
			if (groupMenus.size() > 0) {
				// Có cập nhật
				for (int i = 0; i < groupMenus.size(); i++) {
					ArrayList<Menu> menus = groupMenus.get(i).getMenus();
					if (menus != null) {
						if (menus.size() > 0) {
							for (int j = 0; j < menus.size(); j++) {
								Menu menu = menus.get(j);
								if (menu.getIdMenu() == null
										|| menu.getIdMenu().isEmpty()) {
									// Đang chỉ áp dụng cho tạo mới menu
									String excute = "INSERT INTO menu(id_group_menu, id_classify, id_restaurant, name, price, image, describes) "
											+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

									try {
										logger.info(excute);
										PreparedStatement preparedStatement = connection
												.prepareStatement(
														excute,
														PreparedStatement.RETURN_GENERATED_KEYS);
										preparedStatement.setInt(1, Integer
												.parseInt(groupMenus.get(i)
														.getIdGroupMenu()));
										preparedStatement.setInt(2,
												Integer.parseInt(idClassify));
										preparedStatement.setInt(3, Integer
												.parseInt(restaurant
														.getIdRestaurant()));
										preparedStatement.setString(4,
												menu.getName());
										preparedStatement.setString(5,
												menu.getPrice());
										preparedStatement.setString(6,
												menu.getImage());
										preparedStatement.setString(7,
												menu.getDescribe());

										logger.info(preparedStatement);
										preparedStatement.executeUpdate();

										ResultSet resultSet = preparedStatement
												.getGeneratedKeys();
										if (resultSet.next()) {
											logger.info("Create menu success!");
											menuResult = new Menu();
											menuResult.setIdMenu(String
													.valueOf(resultSet
															.getInt(1)));

											menusResult.add(menuResult);
										}
									} catch (SQLException e) {
										logger.error(e);
									}
								} else {
									// Chỉnh sửa thông tin món ăn
									String excute = "Update menu SET id_group_menu = ?, id_classify = ?"
											+ ", id_restaurant = ?, name = ?, price = ?, image = ?, describes = ?"
											+ " WHERE id_menu = ?";

									try {
										logger.info(excute);
										PreparedStatement preparedStatement = connection
												.prepareStatement(excute);
										preparedStatement.setInt(1, Integer
												.parseInt(groupMenus.get(i)
														.getIdGroupMenu()));
										preparedStatement.setInt(2,
												Integer.parseInt(idClassify));
										preparedStatement.setInt(3, Integer
												.parseInt(restaurant
														.getIdRestaurant()));
										preparedStatement.setString(4,
												menu.getName());
										preparedStatement.setString(5,
												menu.getPrice());
										preparedStatement.setString(6,
												menu.getImage());
										preparedStatement.setString(7,
												menu.getDescribe());
										preparedStatement.setInt(8, Integer
												.parseInt(menu.getIdMenu()));

										logger.info(preparedStatement);
										preparedStatement.executeUpdate();

										menuResult = menu;
									} catch (SQLException e) {
										logger.error(e);
									}
								}

								groupMenuResult.setMenus(menusResult);
								groupMenusResult.add(groupMenuResult);
								restaurantResult
										.setGroupMenus(groupMenusResult);

							}
						}

					}

				}
				return restaurantResult;
			}
		}
		return null;
	}

	/**
	 * Nha hang tim kiem thong tin dat ban
	 * 
	 * @param idReservation
	 * @return
	 */
	public static Reservation findReservationById(String idReservation) {
		String execute = "SELECT * FROM reservation where id_deservation = ?";
		Connection connection = DBPool.getConnection();
		logger.info(execute);
		try {
			Reservation deservation = null;
			PreparedStatement preparedStatement = connection
					.prepareStatement(execute);
			preparedStatement.setInt(1, Integer.parseInt(idReservation));

			ResultSet resultSet = preparedStatement.executeQuery();
			deservation = new Reservation();
			while (resultSet.next()) {
				logger.info(preparedStatement);
				logger.info(resultSet);
				logger.info(resultSet.getTime("time"));
				deservation.setTimeCreate(String.valueOf(resultSet
						.getTime("time_create")));
				deservation.setTime(String.valueOf(resultSet.getTime("time")));
				deservation.setStatus(resultSet.getInt("status"));

				deservation.setIdSale(String.valueOf(resultSet.getInt("id_sale")));

				deservation.setNameCustomer(resultSet
						.getString("name_customer"));
				deservation.setIdDeservation(idReservation);
				deservation.setDate(String.valueOf(resultSet.getDate("date")));
				deservation.setCountPeople(resultSet.getInt("count_people"));
				deservation.setContactCustomer(resultSet
						.getString("contact_customer"));
				deservation.setPhoneCustomer(resultSet
						.getString("phone_customer"));
				deservation.setIdCustomer(String.valueOf(resultSet
						.getInt("id_customer")));
				
				
				
			}

			return deservation;
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e);
		}

		return null;
	}
	
	/**
	 * Xác nhận hoặc hủy xác nhận 
	 * @param idReservation
	 * @return
	 */
	public static boolean changeConfirmDeservation(String idReservation) {
		String execute = "SELECT status,id_deservation from reservation WHERE id_deservation = ?";
		Connection connection = DBPool.getConnection();
		logger.info(execute);

		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement(execute);
			preparedStatement.setInt(1, Integer.parseInt(idReservation));
			logger.info(preparedStatement);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next()){
				String change = "";
				if(resultSet.getInt("status") == 1){
					logger.info("Status 1 change to 0!");
					change = "UPDATE reservation SET status = 0 WHERE id_deservation = ?";
				}else{
					logger.info("Status 0 change to 1");
					change = "UPDATE reservation SET status = 1 WHERE id_deservation = ?";
				}
				logger.info(change);
				PreparedStatement statement = connection.prepareStatement(change);
				statement.setInt(1, Integer.parseInt(idReservation));
				
				statement.executeUpdate();
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e);
		}
		return false;
	}
	
	/**
	 * Update status reservation
	 * Cập nhật thông tin đơn hàng
	 * Hiện tại đang áp dụng trên mobile
	 * @param idReservation
	 * @param status
	 * @return
	 */
	public static boolean updateStatusReservation (String idReservation, int status){
		String execute = "UPDATE reservation SET status = ? WHERE id_deservation = ?";
		Connection connection = DBPool.getConnection();
		logger.info(execute);

		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement(execute);
			
			preparedStatement.setInt(1, status);
			preparedStatement.setInt(2, Integer.parseInt(idReservation));
			
			preparedStatement.executeUpdate();
			connection.close();
			
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e);
		}
		return false;
	}
	
	/**
	 * Hủy đơn hàng
	 * @param idReservation
	 * @return
	 */
	public static boolean cancelDeservation(String idReservation) {
		String execute = "UPDATE reservation SET status = -1 WHERE id_deservation = ?";
		Connection connection = DBPool.getConnection();
		logger.info(execute);

		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement(execute);
			preparedStatement.setInt(1, Integer.parseInt(idReservation));

			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	/*******************************************************/
	
	
	
}

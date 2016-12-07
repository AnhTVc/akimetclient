package com.project.controller.upload;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

import com.project.DAO.RestaurantDAO;
import com.project.POJO.GroupMenu;
import com.project.POJO.Menu;
import com.project.POJO.Restaurant;
import com.project.util.ProcessUtil;
import com.project.util.constant.Config;

@WebServlet("/UploadIMGMenu")
public class UploadIMGMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(UploadIMGMenu.class);
	public UploadIMGMenu() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession(true);

		String idBoss = (String) ses.getAttribute("idBoss");
		String idRestaurant = (String) ses.getAttribute("idRestaurant");
		String idMenu = (String) ses.getAttribute("id_menu_current");

		if (idBoss != null && idRestaurant != null && idMenu != null) {
			logger.info("Restaurant: " + idRestaurant + " update image menu: " + idMenu);
			if (ServletFileUpload.isMultipartContent(request)) {
				try {
					List<org.apache.commons.fileupload.FileItem> multiparts = new org.apache.commons.fileupload.servlet.ServletFileUpload(
							new DiskFileItemFactory()).parseRequest(request);
					for (org.apache.commons.fileupload.FileItem item : multiparts) {
						if (!item.isFormField()) {
							//Luu file o days
							String folderRestaurant = Config.UPLOAD_DIRECTORY
									+ Config.LINK_IN_SERVER + idRestaurant;
							ProcessUtil.folderexist(folderRestaurant);

							String folderbackup = folderRestaurant
									+ Config.LINK_IN_SERVER + "backup"
									+ Config.LINK_IN_SERVER;
							if (ProcessUtil.folderexist(folderbackup)) {
								String urlbackup = folderbackup
										+ File.separator
										+ ProcessUtil.randomString(16) + ".jpg";
								item.write(new File(urlbackup));

								// resize image
								String folderstorage = Config.UPLOAD_DIRECTORY
										+ Config.LINK_IN_SERVER
										+ idRestaurant
										+ Config.LINK_IN_SERVER + "menu";
								ProcessUtil.folderexist(folderstorage);
								
								String link = idRestaurant
										+ Config.LINK_IN_SERVER
										+ "menu" + File.separator
										+ idMenu
										+ ".jpg";
								String url = Config.UPLOAD_DIRECTORY
										+ Config.LINK_IN_SERVER
										+ link;
								
								// resize
								ImageUtil.getScaledInstance(urlbackup, 250, 250, true, url);
								
								logger.info("URL image: /images/" + link );
								
								Menu menuResult = RestaurantDAO.findMenuById(idMenu);
								menuResult.setImage("/images/" + link);
								
								Restaurant restaurant = new Restaurant();
								restaurant.setIdRestaurant(idRestaurant);
								ArrayList<Menu> menus = new ArrayList<Menu>();
								menus.add(menuResult);
								
								ArrayList<GroupMenu> groupMenus = new ArrayList<GroupMenu>();
								GroupMenu groupMenu = new GroupMenu();
								
								groupMenu.setMenus(menus);
								groupMenus.add(groupMenu);
								
								restaurant.setGroupMenus(groupMenus);
								if(RestaurantDAO.updateInfoRestaurant(restaurant, null)){
									//Cập nhật dữ liệu vào db thành công
									System.out
									.print("Upload menu success!");
									ses.setAttribute("message",
									"Update menu success!");
								}else{
									//Không cập nhật dữ liệu thành công
									ses.setAttribute("message",
											"Sorry this Servlet only handles file upload avatar!");
								}
							}
						}
					}
				} catch (Exception ex) {
					ses.setAttribute("message",
							"Sorry this Servlet only handles file upload avatar!");
				}
			} else {
				ses.setAttribute("message",
						"Sorry this Servlet only handles file upload avatar!");
			}
			response.sendRedirect("/AdminRestaurant");
			response.setHeader("REFRESH", "0");
		} else {
			// Mất session
			logger.error("Lost session");
			
			request.removeAttribute("message");
			request.setAttribute("message",
					"Bạn vui lòng đăng nhập lại để thực hiện chức năng này");
			response.sendRedirect("/business");
			response.setHeader("REFRESH", "0");
		}
	}

}

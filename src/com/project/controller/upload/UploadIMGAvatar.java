package com.project.controller.upload;

import java.io.File;
import java.io.IOException;
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
import com.project.util.ProcessUtil;
import com.project.util.constant.Config;

/**
 * Servlet implementation class UploadAvatar
 */

@WebServlet("/UploadIMGAvatar")
public class UploadIMGAvatar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(UploadIMGAvatar.class);

	public UploadIMGAvatar() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * Up load avatar cho nhà hàng
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession(true);

		String idBoss = (String) ses.getAttribute("idBoss");
		String idRestaurant = (String) ses.getAttribute("idRestaurant");

		if (idBoss != null && idRestaurant != null) {
			System.out.print("Restaurant " + idRestaurant + "update avatar ...");
			if (ServletFileUpload.isMultipartContent(request)) {
				try {
					List<org.apache.commons.fileupload.FileItem> multiparts = new org.apache.commons.fileupload.servlet.ServletFileUpload(
							new DiskFileItemFactory()).parseRequest(request);
					for (org.apache.commons.fileupload.FileItem item : multiparts) {
						if (!item.isFormField()) {
							// Check exit forder
							String folderRestaurant = Config.UPLOAD_DIRECTORY
									+ Config.LINK_IN_SERVER + idRestaurant;
							ProcessUtil.folderexist(folderRestaurant);
							
							String folder = folderRestaurant
									+ Config.LINK_IN_SERVER + "backup"
									+ Config.LINK_IN_SERVER;
							if (ProcessUtil.folderexist(folder)) {
								String urlbackup = Config.UPLOAD_DIRECTORY
										+ Config.LINK_IN_SERVER
										+ idRestaurant
										+ Config.LINK_IN_SERVER + "backup"
										+ File.separator
										+ ProcessUtil.randomString(16) + ".jpg";
								item.write(new File(urlbackup));

								// resize image
								String folderstorage = Config.UPLOAD_DIRECTORY
										+ Config.LINK_IN_SERVER
										+ idRestaurant
										+ Config.LINK_IN_SERVER + "avatar";
								if (ProcessUtil.folderexist(folderstorage)) {
									
									String link = idRestaurant
											+ Config.LINK_IN_SERVER + "avatar" + File.separator
											+ ProcessUtil.randomString(16)
											+ ".jpg";;
									String url = Config.UPLOAD_DIRECTORY
											+ Config.LINK_IN_SERVER
											+ link;
									
									logger.info("URL avatar: /images/" + link);
									// resize
									
									
									ImageUtil.getScaledInstance(urlbackup, 960, 480, true, url);
									if (RestaurantDAO.addAvatarRestaurant("/images/" + link,
											idRestaurant)) {
										// Update thành công
										// File uploaded successfully
										System.out
												.print("Upload image success!");
										ses.setAttribute("message",
												"Update avatar success!");

									} else {
										// Update thông tin không thành công
										ses.setAttribute("message",
												"Sorry this Servlet only handles file upload avatar!");

									}
								} else {
									// TODO
									ses.setAttribute("message",
											"Sorry this Servlet only handles file upload avatar!");
								}
							}
						}
					}

				} catch (Exception ex) {
					ex.printStackTrace();
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
			logger.error("Lost session");
			
			request.removeAttribute("message");
			request.setAttribute("message",
					"Bạn vui lòng đăng nhập lại để thực hiện chức năng này");
			response.sendRedirect("/business");
			response.setHeader("REFRESH", "0");
		}
	}

}

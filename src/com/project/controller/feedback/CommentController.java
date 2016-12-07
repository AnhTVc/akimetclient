package com.project.controller.feedback;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.coobird.thumbnailator.Thumbnails;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.project.DAO.FeedbackMongoDBDAO;
import com.project.POJO.Customer;
import com.project.POJO.Feedback;
import com.project.controller.upload.ImageUtil;
import com.project.util.ProcessUtil;
import com.project.util.constant.Config;

@WebServlet("/binh-luan")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(CommentController.class);
    public CommentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * Client comment
	 * if have image
	 * upload image save to folder
	 * create object Comment save to httpsession
	 * Recent data from comment info content
	 * Save to mongdb
	 * return to ajax
	 */
	
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		// Get info customer
		
		String idCustommer = (String) httpSession.getAttribute("id_custommer");
		String nameCustomer = (String) httpSession.getAttribute("name_customer");
		Feedback feedback = new Feedback();
		String images = "";
		
		if(idCustommer != null && !idCustommer.isEmpty()){
			if (ServletFileUpload.isMultipartContent(request)) {
				logger.info("Client commeent: upload image");
				try {
					List<org.apache.commons.fileupload.FileItem> multiparts = new org.apache.commons.fileupload.servlet.ServletFileUpload(
							new DiskFileItemFactory()).parseRequest(request);
					for (org.apache.commons.fileupload.FileItem item : multiparts) {
						if (!item.isFormField()) {
							DateFormat dateFormat = new SimpleDateFormat("yyyy_MM_dd");
							
							String folderCustomer = Config.UPLOAD_DIRECTORY
									+ Config.LINK_IN_SERVER  + "comment" + Config.LINK_IN_SERVER 
									+ idCustommer + Config.LINK_IN_SERVER + dateFormat.format(new Date()).toString();
							
							ProcessUtil.folderexist(Config.UPLOAD_DIRECTORY
									+ Config.LINK_IN_SERVER  + "comment");
							
							ProcessUtil.folderexist(Config.UPLOAD_DIRECTORY
									+ Config.LINK_IN_SERVER  + "comment" + Config.LINK_IN_SERVER 
									+ idCustommer );
							
							ProcessUtil.folderexist(folderCustomer);

							String folderbackup = folderCustomer
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
										+ idCustommer
										+ Config.LINK_IN_SERVER + "images";
								ProcessUtil.folderexist(folderstorage);
								
								String link = ProcessUtil.randomString(16)
										+ ".jpg";
								String url = folderCustomer
										+ Config.LINK_IN_SERVER
										+ link;
								
								// resize
								Thumbnails.of(urlbackup).size(350, 350)
										.toFile(url);
								
								
								logger.info("URL image: /images/" + link);
								if(ImageUtil.getScaledInstance(urlbackup, 175, 175, true, url) != null){
									// Upload success
									images += link + ",";
								} else {
									// Upload err
								}
							}
						}
					}
					
					// Save to session
					feedback.setImages(images.substring(0, images.length() - 1));
					feedback.setTimeCreate(new Date());
					Customer customer = new Customer();
					customer.setIdCustomer(idCustommer);
					customer.setName(nameCustomer);
					
					
					feedback.setCustomer(customer);
					
					httpSession.removeAttribute("feedback");
					httpSession.setAttribute("feedback", feedback);
					
					// return to ajax
					Map<String, String> options = new LinkedHashMap<>();
				    options.put("result", "success");
				    
				    String json = new Gson().toJson(options);
					response.setContentType("application/json");
				    response.setCharacterEncoding("UTF-8");
				    response.getWriter().write(json);
				    
				}catch(Exception e){
					e.printStackTrace();
				}
			}else{
				String idRestaurant = request.getParameter("idRestaurant");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				logger.info("Client " + idCustommer + " comment: update info to " + idRestaurant);
				feedback = (Feedback) httpSession.getAttribute("feedback");
				Map<String, String> options = new LinkedHashMap<>();
				if(feedback != null){
					Feedback feedbackTemp = feedback;
					feedbackTemp.setContent(content);
					feedbackTemp.setTitle(title);
					feedbackTemp.setIdRestaurant(idRestaurant);
					
					// Save to mongdb
					FeedbackMongoDBDAO.insertFeedbacByIdRestaurant(feedbackTemp);
					
				    options.put("result", "success");
				}else {
				    options.put("result", "error");
				    
				}
				String json = new Gson().toJson(options);
				response.setContentType("application/json");
			    response.setCharacterEncoding("UTF-8");
			    response.getWriter().write(json);
			}
		}else{
			// Customer not login
			response.sendRedirect("/login");
		}
		
		
	}

}

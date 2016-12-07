package com.project.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.security.SecureRandom;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.concurrent.ThreadLocalRandom;

import org.apache.log4j.Logger;

public class ProcessUtil {
	public static final Logger logger = Logger.getLogger(ProcessUtil.class);

	/**
	 * String string = "004-034556"; String[] parts = string.split("-"); String
	 * part1 = parts[0]; // 004 String part2 = parts[1]; // 034556
	 * 
	 * @param str
	 * @param sub
	 * @return
	 */
	public static ArrayList<String> splitStringBySub(String str, String sub) {
		if(str.indexOf(sub) > 0){
			String[] parts = str.split(sub);
			return new ArrayList<String>(Arrays.asList(parts));
		}else{
			ArrayList<String> arrayList = new ArrayList<String>();
			arrayList.add(str);
			return arrayList;
		}
		
	}

	public static String strDateNow(String strFormat) {
		java.util.Date date = new java.util.Date();
		DateFormat dateFormat = new SimpleDateFormat(strFormat);
		String dateStr = dateFormat.format(date);

		return dateStr;
	}

	public static String convertToTime(String fromTime, String toTime) {
		return fromTime + "-" + toTime + ";";
	}

	/**
	 * Convert string to sql.date
	 * 
	 * @param str
	 * @return
	 */
	public static Date stringToDate(String str) {
		return null;
	}

	/**
	 * 
	 * @param folder
	 * @return
	 */
	public static boolean folderexist(String folder) {
		logger.info("Check folder exist : " + folder);

		File f = new File(folder);
		if (f.exists() && f.isDirectory()) {
			logger.info("folder" + folder + " is existed ");
			return true;
		} else {

			logger.info("folder" + folder + " is not exist, creating ... them ");
			if (f.mkdir()) {
				f.setExecutable(true);
				f.setReadable(true);
				f.setWritable(true);
				return true;
			}
			return false;
		}
	}

	/**
	 * Ran dom string
	 * 
	 * @param length
	 * @return
	 */
	public static String randomString(int length) {
		String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		SecureRandom rnd = new SecureRandom();
		StringBuilder sb = new StringBuilder(length);
		for (int i = 0; i < length; i++)
			sb.append(AB.charAt(rnd.nextInt(AB.length())));
		return sb.toString();
	}

	/**
	 * 
	 * @param str
	 * @return
	 */
	public static String saveExtractedText(String str) {
		str = str.replaceAll("\\", "\\\\").replaceAll("\n", "\\n")
				.replaceAll("\r", "\\r").replaceAll("\t", "\\t")
				.replaceAll("\00", "\\0").replaceAll("'", "\\'");

		return str;
	}

	public static String hideString(String str) {
		if (str.length() > 245) {
			str = str.substring(0, 245) + " ...";
		}

		return str;
	}

	public static boolean saveFile(String pathFile, String data) {
		FileOutputStream fop = null;
		File file = new File(pathFile);
		try {
			fop = new FileOutputStream(file);
			if (!file.exists()) {
				file.createNewFile();
			}

			// get the content in bytes
			byte[] contentInBytes = data.getBytes();

			fop.write(contentInBytes);
			fop.flush();
			fop.close();

			System.out.println("Done");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public static int random(int min, int max) {
		return ThreadLocalRandom.current().nextInt(min, max + 1);
	}
	
	public static boolean writeToFile(String file, String data){
		try {
			File f = new File(file);

			// if file doesnt exists, then create it
			if (!f.exists()) {
				f.createNewFile();
			}
			FileWriter fw = new FileWriter(f.getAbsoluteFile(), true);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(data);
			bw.close();

			System.out.println("Done");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
}

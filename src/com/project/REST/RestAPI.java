package com.project.REST;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.*;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

public class RestAPI {
	
	/**
	 * 
	 * @param url
	 * @return
	 */
	
	public static String asyncResponseGET(String url) {
		try {
			HttpClient httpClient = new DefaultHttpClient();
			HttpGet httpGet = new HttpGet(url);

			HttpResponse response = httpClient.execute(httpGet);
			return getStringFromHttpResponseGET(response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 
	 * @param response
	 * @return
	 */
	private static String getStringFromHttpResponseGET(HttpResponse response) {
		try {
			StringBuilder stringBuilder = new StringBuilder();
			StatusLine statusLine = response.getStatusLine();
			int statusCode = statusLine.getStatusCode();
			if (statusCode == 200) {
				HttpEntity entity = response.getEntity();
				InputStream inputStream = entity.getContent();
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(inputStream));
				String line;
				while ((line = reader.readLine()) != null) {
					stringBuilder.append(line);
				}
				inputStream.close();

				return stringBuilder.toString();
			} else {
				System.out.print("JSON: Failed to read file with stutus code "
						+ statusCode);
			}
		} catch (Exception e) {
			e.getMessage();
		}
		return null;
	}
}

package com.project;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

@SuppressWarnings("deprecation")
public class ClientRestAPI {
	private final static String USER_AGENT = "Mozilla/5.0";
	private static DefaultHttpClient httpclient;
	private static void sendPost() throws Exception {

		String url = "http://localhost:8080/akimeet/Authentication/mobile";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		//add reuqest header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		con.setDoInput(true);
        con.setDoOutput(true);
        String urlParameters = "username=C02G8416DRJM&password=a";

		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(urlParameters);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'POST' request to URL : " + url);
		System.out.println("Post parameters : " + urlParameters);
		System.out.println("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader(
		        new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		//print result
		System.out.println(response.toString());

	}
	
	public static void main(String[] agm) throws ClientProtocolException, IOException{
		 	httpclient = new DefaultHttpClient();

	        HttpGet httpget = new HttpGet("http://localhost:8080/akimeet/Authentication/mobile");

	        org.apache.http.HttpResponse response = httpclient.execute(httpget);
	        HttpEntity entity = response.getEntity();

	        System.out.println("Login form get: " + response.getStatusLine());
	        if (entity != null) {
	            entity.consumeContent();
	        }
	        System.out.println("Initial set of cookies:");
	        List<Cookie> cookies = httpclient.getCookieStore().getCookies();
	        if (cookies.isEmpty()) {
	            System.out.println("None");
	        } else {
	            for (int i = 0; i < cookies.size(); i++) {
	                System.out.println("- " + cookies.get(i).toString());
	            }
	        }

	        org.apache.http.HttpResponse respon = httpclient.execute(httpget);
	        HttpEntity entity1 = respon.getEntity();

	        System.out.println("Login form get: " + response.getStatusLine());
	        if (entity1 != null) {
	        	entity1.consumeContent();
	        }
	        System.out.println("Initial set of cookies:");
	        List<Cookie> cookies1 = httpclient.getCookieStore().getCookies();
	        if (cookies1.isEmpty()) {
	            System.out.println("None");
	        } else {
	            for (int i = 0; i < cookies1.size(); i++) {
	                System.out.println("- " + cookies.get(i).toString());
	            }
	        }
	        
	        System.out.println("\nTesting 2 - Send Http POST request");
			try {
				sendPost();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	    }
	
	public static void sendPostRequest() throws ClientProtocolException, IOException {
		String url = "http://localhost:8080/akimeet/Authentication/mobile";

		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(url);

		// add header
		post.setHeader("User-Agent", USER_AGENT);

		List<NameValuePair> urlParameters = new ArrayList<NameValuePair>();
		urlParameters.add(new BasicNameValuePair("sn", "C02G8416DRJM"));
		urlParameters.add(new BasicNameValuePair("cn", ""));
		urlParameters.add(new BasicNameValuePair("locale", ""));
		urlParameters.add(new BasicNameValuePair("caller", ""));
		urlParameters.add(new BasicNameValuePair("num", "12345"));

		post.setEntity(new UrlEncodedFormEntity(urlParameters));

		HttpResponse response = client.execute(post);
		System.out.println("Response Code : "
		                + response.getStatusLine().getStatusCode());

		BufferedReader rd = new BufferedReader(
		        new InputStreamReader(response.getEntity().getContent()));

		StringBuffer result = new StringBuffer();
		String line = "";
		while ((line = rd.readLine()) != null) {
			result.append(line);
		}
		
		
	}
}

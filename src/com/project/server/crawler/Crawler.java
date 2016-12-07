package com.project.server.crawler;

import java.util.ArrayList;
import java.util.Set;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.project.DAO.FakeDB;
import com.project.POJO.Address;
import com.project.POJO.Restaurant;
import com.project.util.ProcessUtil;

import edu.uci.ics.crawler4j.crawler.Page;
import edu.uci.ics.crawler4j.crawler.WebCrawler;
import edu.uci.ics.crawler4j.parser.HtmlParseData;
import edu.uci.ics.crawler4j.url.WebURL;

public class Crawler extends WebCrawler {
	private final static Pattern FILTERS = Pattern
			.compile(".*(\\.(css|js|gif|jpg" + "|png|mp3|mp3|zip|gz))$");

	/**
	 * This method receives two parameters. The first parameter is the page in
	 * which we have discovered this new url and the second parameter is the new
	 * url. You should implement this function to specify whether the given url
	 * should be crawled or not (based on your crawling logic). In this example,
	 * we are instructing the crawler to ignore urls that have css, js, git, ...
	 * extensions and to only accept urls that start with
	 * "http://www.ics.uci.edu/". In this case, we didn't need the referringPage
	 * parameter to make the decision.
	 */
	@Override
	public boolean shouldVisit(Page referringPage, WebURL url) {
		String href = url.getURL().toLowerCase();
		return !FILTERS.matcher(href).matches()
				&& href.startsWith("http://www.ics.uci.edu/");
	}

	/**
	 * This function is called when a page is fetched and ready to be processed
	 * by your program.
	 */
	@Override
	public void visit(Page page) {
		String url = page.getWebURL().getURL();
		System.out.println("URL: " + url);

		if (page.getParseData() instanceof HtmlParseData) {
			HtmlParseData htmlParseData = (HtmlParseData) page.getParseData();
			String text = htmlParseData.getText();
			String html = htmlParseData.getHtml();
			Set<WebURL> links = htmlParseData.getOutgoingUrls();

			System.out.println("Text length: " + text.length());
			System.out.println("Html length: " + html.length());
			System.out.println("Number of outgoing links: " + links.size());
			
			Document doc = Jsoup.parseBodyFragment(html);
			Elements nameRestaurant = doc.select("h1[itemprop=name]");
			Elements address = doc.select("span[itemprop=streetAddress]");
			Elements locality = doc.select("span[itemprop=addressLocality]");
			Element description = doc.select("meta[name=description]").first();
			Element keyword =  doc.select("meta[name=keywords]").first();
			
			Elements temp = doc.getElementsByClass("microsite-box-content").select("img");
			
			ArrayList<String> images = new ArrayList<String>();
			for (Element element : temp) {
				images.add(element.attr("src").toString());
			}
			
			temp = doc.getElementsByClass("main-image");
			Element imgmain = temp.select("img[itemprop=image]").first();
			ProcessUtil.saveFile("C:\\store\\data.txt", html.toString());
			ProcessUtil.saveFile("C:\\store\\element.txt", nameRestaurant.text().toString() + "\n" +
					address.text().toString() + "\n" +
					locality.text().toString() + "\n" +
					description.attr("content") + "\n" +
					keyword.attr("content") + "\n" +
					images.toString() + "\n" + 
					imgmain.attr("src")) ;
			
			//Insert to DB
			Restaurant restaurant = new Restaurant();
			restaurant.setName(nameRestaurant.text().toString());
			restaurant.setIntroduce(description.attr("content") + "." + keyword.attr("content"));
			restaurant.setAvatar(imgmain.attr("src"));
			restaurant.setImages(images);
			restaurant.setType(2);// Đồ uống và âm nhạc
			
			Address address2 = new Address();
			address2.setDetail(address.text().toString());
			address2.setDistrict(locality.text().toString());
			address2.setCity("Hà Nội");
			restaurant.setAddress(address2);
			restaurant.setType(2);
			
			FakeDB fakeDB = new FakeDB();
			fakeDB.importFakeRestaurant(restaurant);
		}
	}
}

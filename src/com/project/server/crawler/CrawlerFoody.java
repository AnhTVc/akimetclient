package com.project.server.crawler;

import java.util.ArrayList;

import edu.uci.ics.crawler4j.crawler.CrawlConfig;
import edu.uci.ics.crawler4j.crawler.CrawlController;
import edu.uci.ics.crawler4j.fetcher.PageFetcher;
import edu.uci.ics.crawler4j.robotstxt.RobotstxtConfig;
import edu.uci.ics.crawler4j.robotstxt.RobotstxtServer;

public class CrawlerFoody {
	public static void main(String[] args) throws Exception {
        String crawlStorageFolder = "C:\\store\\";
        int numberOfCrawlers = 7;

        ArrayList<String> arrayList = new ArrayList<String>();
        arrayList.add("https://www.foody.vn/ha-noi/moc-quan-nha-san-cafe");
        arrayList.add("https://www.foody.vn/ha-noi/moc-mien-cafe-cafe-doc-sach");
        arrayList.add("https://www.foody.vn/ha-noi/moc-quan-cafe");
        arrayList.add("https://www.foody.vn/ha-noi/moc-quan-cafe-com-vong");
        arrayList.add("https://www.foody.vn/ha-noi/quan-q-cafe-89150");
        arrayList.add("https://www.foody.vn/ha-noi/moc-cafe-tran-binh");
        arrayList.add("https://www.foody.vn/ha-noi/ca-phe-moc");
        arrayList.add("https://www.foody.vn/ha-noi/moc-cafe-hang-dau");


        
        for (String string : arrayList) {
            CrawlConfig config = new CrawlConfig();
            config.setCrawlStorageFolder(crawlStorageFolder);

            /*
             * Instantiate the controller for this crawl.
             */
            PageFetcher pageFetcher = new PageFetcher(config);
            RobotstxtConfig robotstxtConfig = new RobotstxtConfig();
            RobotstxtServer robotstxtServer = new RobotstxtServer(robotstxtConfig, pageFetcher);
        	CrawlController controller = new CrawlController(config, pageFetcher, robotstxtServer);
        	/*
             * For each crawl, you need to add some seed urls. These are the first
             * URLs that are fetched and then the crawler starts following links
             * which are found in these pages
             */
            controller.addSeed(string);
            /*
             * Start the crawl. This is a blocking operation, meaning that your code
             * will reach the line after this only when crawling is finished.
             */
            controller.start(Crawler.class, numberOfCrawlers);
		}
        
        
    }
}

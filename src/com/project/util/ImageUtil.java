package com.project.util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import net.coobird.thumbnailator.Thumbnails;

public class ImageUtil {


	public static void main(String[] args) {

		try {

			/*BufferedImage originalImage = ImageIO.read(new File(
					"c:\\uploads\\1214312200home-bg.jpg"));
			int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB
					: originalImage.getType();

			BufferedImage resizeImageJpg = resizeImage(originalImage, type, IMG_HEIGHT, IMG_WIDTH);
			ImageIO.write(resizeImageJpg, "jpg", new File(
					"c:\\uploads\\mkyong_jpg.jpg"));

			BufferedImage resizeImagePng = resizeImage(originalImage, type, IMG_HEIGHT, IMG_WIDTH);
			ImageIO.write(resizeImagePng, "png", new File(
					"c:\\uploads\\mkyong_png.jpg"));

			BufferedImage resizeImageHintJpg = resizeImageWithHint(
					originalImage, type);
			ImageIO.write(resizeImageHintJpg, "jpg", new File(
					"c:\\uploads\\mkyong_hint_jpg.jpg"));

			BufferedImage resizeImageHintPng = resizeImageWithHint(
					originalImage, type);
			ImageIO.write(resizeImageHintPng, "png", new File(
					"c:\\uploads\\mkyong_hint_png.jpg"));*/
			
			Thumbnails.of("c:\\uploads\\1214312200home-bg.jpg").size(320, 320).toFile("c:\\uploads\\target.jpg");

		} catch (IOException e) {
			System.out.println(e.getMessage());
		}

	}


	public static String resize(String urlImage, String urlstorage, int height, int wight){
		try {
			BufferedImage originalImage = ImageIO.read(new File(urlImage));
			int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB
					: originalImage.getType();
			
			BufferedImage resizeImageJpg = resizeImage(originalImage, type, height, wight);
			ImageIO.write(resizeImageJpg, "jpg", new File( urlstorage + urlImage));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	private static BufferedImage resizeImage(BufferedImage originalImage,
			int type, int height, int wight) {
		BufferedImage resizedImage = new BufferedImage(height, wight,
				type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, wight, height, null);
		g.dispose();

		return resizedImage;
	}

	/*private static BufferedImage resizeImageWithHint(
			BufferedImage originalImage, int type) {

		BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT,
				type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
		g.dispose();
		g.setComposite(AlphaComposite.Src);

		g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
				RenderingHints.VALUE_INTERPOLATION_BILINEAR);
		g.setRenderingHint(RenderingHints.KEY_RENDERING,
				RenderingHints.VALUE_RENDER_QUALITY);
		g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
				RenderingHints.VALUE_ANTIALIAS_ON);

		return resizedImage;
	}*/
}

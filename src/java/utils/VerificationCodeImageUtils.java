package com.graduationDesign.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import javax.imageio.ImageIO;

public class VerificationCodeImageUtils {
	public static String generateCodeImg(OutputStream out) {
		// 创建一个验证码容器(画布)，并定义高和宽和类型
		int height = 50;
		int width = 110;
		int image_type = BufferedImage.TYPE_INT_RGB;
		BufferedImage bi = new BufferedImage(width, height, image_type);
		// 获取一支画笔
		Graphics2D graphics = (Graphics2D) bi.getGraphics();
		// 设置背景颜色
		graphics.setColor(new Color(222,225,230));
		// 填充背景颜色
		graphics.fillRect(0, 0, width, height);
		// 设置字体
		graphics.setFont(new Font("微软雅黑", Font.BOLD,30));
		// 字体库
		String fontLibrary = "abcdefghigklmnpqrstuvwxyz";
		fontLibrary += fontLibrary.toUpperCase();
		fontLibrary += "123456789";
		Random random = new Random();
		StringBuilder sb = new StringBuilder(4);
		for (int i = 0; i < 4; i++) {
			// 随机颜色
			graphics.setColor(getRandomColor());
			// 随机选取字符
			int nextInt = random.nextInt(fontLibrary.length());
			char charAt = fontLibrary.charAt(nextInt);
			//绘制字符
			graphics.drawString(charAt+"",(25*i)+8,35);
			sb.append(charAt);
		}
		// 画干扰线
		for (int i = 0; i < 6; i++) {
			// 设置随机颜色
			graphics.setColor(getRandomColor());
			// 随机画线
			graphics.drawLine(random.nextInt(width), random.nextInt(height), random.nextInt(width),
					random.nextInt(height));
		}
		// 添加噪点
		for (int i = 0; i < 30; i++) {
			int x1 = random.nextInt(width);
			int y1 = random.nextInt(height);
			graphics.setColor(getRandomColor());
			graphics.fillRect(x1, y1,2,2);
		}
		try {
			//输出图片
			ImageIO.write(bi, "jpg", out);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sb.toString();
	}

	/**
	 * 随机取色
	 */
	private static Color getRandomColor() {
		Random ran = new Random();
		Color color = new Color(ran.nextInt(256),
				ran.nextInt(256), ran.nextInt(256));
		return color;
	}
}

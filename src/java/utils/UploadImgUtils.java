package com.graduationDesign.utils;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class UploadImgUtils {
	public static String returnRelativePath(MultipartFile file) throws Exception {
		// 使用UUID给图片重命名，并去掉四个“-”
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		// 获取文件后缀名
		String extensionName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
		// 获取项目根路径下面自己新建的upload文件夹，用于存储图片,在tomcat中的server.xml设置了虚拟路径
		String addPhotoUrl = "D:\\graduationDesign\\personnelManagement\\src\\main\\webapp\\upload\\";
		// System.err.print("================="+addPhotoUrl);
		File addPhotoFile = new File(addPhotoUrl);
		if (!addPhotoFile.exists()) {
			// 文件若不存在，创建目录
			addPhotoFile.mkdir();
		}
		// 以绝对路径保存重名命后的图片
		file.transferTo(new File(addPhotoUrl + "/" + name + "." + extensionName));
		// 把图片以相对路径保存到数据库
		String photoUrl = "/upload/" + name + "." + extensionName;
		return photoUrl;
	}
}

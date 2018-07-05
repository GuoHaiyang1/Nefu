package com.util;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import com.Excepton.MyException;



public class FileUtils {
	private static Logger logger = LogManager.getLogger(FileUtils.class);
	private static final String ROOT = setRootDirectory();
	/**
	 * 获取应用当前绝对根路径，并基于根路径创建应用上传目录
	 * @return
	 */
	private static String setRootDirectory() {
		String webapp = System.getProperty("SpringMVCExamples.root");
		logger.debug("SpringMVCExamples.root: " + webapp);
		String uploadDirectory = webapp + "/WEB-INF/jsp/upload/";
		logger.debug("Upload Directory: " + uploadDirectory);
		Path path = Paths.get(uploadDirectory);
		// 判断路径是否为目录
		if (!Files.isDirectory(path)) {
			try {
				Files.createDirectories(path);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				throw new MyException("创建上传文件目录错误！" + e.getMessage());
			}
		}
		return uploadDirectory;
	}
	/**
	 * 应用通用的上传文件处理
	 * @param bytes
	 * @param path
	 */
	public static void copy(byte[] bytes, Path path) {
		try {
			path = Paths.get(ROOT + path);
			logger.debug(path);
			Files.write(path, bytes);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new MyException("文件写入错误！" + e.getMessage());
		}
	}
	
	public static ResponseEntity<byte[]> toResponseEntity(Path path) {
		ResponseEntity<byte[]> entity = null;
		try {
			path = Paths.get(ROOT + path);
			// 声明附件名称
			String fileName = URLEncoder.encode(path.getFileName().toString(), "UTF-8");
			HttpHeaders headers = new HttpHeaders();
			// 声明响应类型为流
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			// 声明返回文件名称
			headers.setContentDispositionFormData("attachment", fileName);
			// 创建封装文件二进制字节数组、HTTP状态码、HTTP头的响应实体
			entity = new ResponseEntity<byte[]>(Files.readAllBytes(path), 
					headers, 
					HttpStatus.OK);
			return entity;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new MyException("文件加载错误！" + e.getMessage());
		}
	}
	
}

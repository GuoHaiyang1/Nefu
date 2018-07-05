package com.service;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;

import com.entity.File;
import com.util.FileUtils;

@Service
@Transactional
public class FileService {
public static final List<File> files = new ArrayList<>();
	
	
	public void addFile(byte[] bytes,String originalFilename) {
		String ext = FilenameUtils.getExtension(originalFilename);
		String baseName = FilenameUtils.getBaseName(originalFilename);
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
		Path path = Paths.get(baseName + "-" + sf.format(new Date()) + "." + ext);
		FileUtils.copy(bytes, path);
	}
	
	public void addLecture(byte[] bytes,String originalFilename) {
		// 文件扩展名，基于apache.commons.io提供的工具类
		String ext = FilenameUtils.getExtension(originalFilename);
		// 文件名，
		String baseName = FilenameUtils.getBaseName(originalFilename);
		// 重名称文件
		Path path = Paths.get(baseName + "." + ext);
		// 自定义的应用通用文件复制方法，屏蔽真实文件目录
		FileUtils.copy(bytes, path);
		
		// 模拟将文件名称添加值数据库
		File file = new File();
		file.setId(files.size() + 1);
		file.setFilename(path.toString());
		files.add(file);
	}
	
	
	
	
	// 模拟从数据中查找文件
	public File getFile(int fileId) {
		File file = null;
		for (File file2 : files) {
			if (file2.getId() == fileId) {
				file = file2;
			}
		}
		return file;
	}
}

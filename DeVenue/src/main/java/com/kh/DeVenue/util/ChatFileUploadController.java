package com.kh.DeVenue.util;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

/**
 * 파일업로드를 처리합니다.
 */
@Controller
public class ChatFileUploadController {
	
   @RequestMapping(value="chatFileUpload.do", method=RequestMethod.POST, consumes= {"multipart/form-data"})
   public void chatFileUpload(HttpServletRequest request, @RequestParam(value="file") MultipartFile file, HttpServletResponse response) throws IOException {
	   System.out.println("파일업로드 하러 왔나");
	   response.setCharacterEncoding("UTF-8");
	   
	   if(!file.getOriginalFilename().equals("")) {
		   String renameFileName = saveFile(file, request);
		   System.out.println("파일 장 저장했나");

		   PrintWriter out = response.getWriter();
		   out.print(renameFileName);
		   out.flush();
		   out.close();
	   }
	   PrintWriter out = response.getWriter();
	   out.print("파일 저장 실패");
	   out.flush();
	   out.close();
   }

private String saveFile(MultipartFile file, HttpServletRequest request) throws UnsupportedEncodingException {
	String root = request.getSession().getServletContext().getRealPath("resources");
	
	String savePath = root + "\\chatFile";
	
	File folder = new File(savePath);
	
	if(!folder.exists()) {
		folder.mkdirs();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	String originFileName = file.getOriginalFilename();
	originFileName = new String(originFileName.getBytes("8859_1"),"utf-8");
    System.out.println(originFileName);
	String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
			+"."+originFileName;
	
	String filePath = folder + "\\"+renameFileName;
	
	try {
		file.transferTo(new File(filePath));
	} catch (IllegalStateException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
	
	return renameFileName;
}
}



package com.webkings.app.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadWabUtil {
	private static final Logger logger=
			LoggerFactory.getLogger(FileUploadWabUtil.class);
	
	// 자료실에서 업로드인지 , 상품등록에서 이미지 등록인지 구분 해주는 상수
	public static final int PDS_UPLOAD=1; // 자료실 업로드
	public static final int IMAGE_UPLOAD=2; // 상품이미지 업로드
	
	
	@Resource(name="fileUploadProperties")
	private Properties fileUploadProps;
	
	public List<Map<String, Object>> fileUPload(HttpServletRequest request, 
			int uploadTpye){
		// 업로드 처리가 가능한 클래스로 다운 캐스팅
		MultipartHttpServletRequest multipartRequset=
				(MultipartHttpServletRequest) request;
		
		Map<String, MultipartFile> fileMap
		=multipartRequset.getFileMap();
		
		// 결과를 저장할 List 컬렉션
		// 파일명과 파일크기를 여러개 저장해야함
		List<Map<String, Object>> fileList=new ArrayList<Map<String,Object>>();
		
		Iterator<String> iter= fileMap.keySet().iterator();
		while(iter.hasNext()){
			String key=iter.next();
			MultipartFile tempFile= fileMap.get(key);
			
			// 업로드 파일이 있을 때만 파일명, 파일크기
			// 구해오고, 업로드 처리하기
			if(!tempFile.isEmpty()){
				String ofileName= tempFile.getOriginalFilename();
				// 파일명 변경하기
				String fileName=getUniqueFileName(ofileName);
				
				// 파일크기 구하기
				long fileSize=tempFile.getSize();
				
				// 업로드 처리
				try{
					// 업로드 경로 구하기
					String upPath=getUploadPath(request, uploadTpye);
					
					// 파일객체 만들기
					File file=new File(upPath,fileName);
					
					// 업로드 처리하기
					tempFile.transferTo(file);
				}catch (IOException e) {
					e.printStackTrace();
				}
				Map<String, Object> map= new HashMap<String, Object>();
				map.put("fileName", fileName);
				map.put("fileSize", fileSize);
				
				// map을 List에 저장한다
				fileList.add(map);
			}
		}
		return fileList;
	}
	
	public String getUniqueFileName(String ofileName){
		//파일명에 현재시간을 추가해서 변경된 파일명 만들기
		//abc.txt => abc + 현재시간 + .txt
		//=> abc20160818111520123.txt
		int idx = ofileName.lastIndexOf(".");
		//순수파일명만 추출 => abc
		String fName = ofileName.substring(0,idx);
		//.을 포함한 확장자만 추출 => .txt
		String ext = ofileName.substring(idx);
		
		//순수파일명에 현재시간을 연결한 후 .확장자를 연결한다
		String fileName = fName+getCurrentTime()+ext;
		
		return fileName;
	}
	
	public String getCurrentTime(){
		//현재시간을 밀리초까지 보여주도록 변환하는 메서드
		Date today = new Date();
		SimpleDateFormat sdf 
		= new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String str = sdf.format(today);
		
		return str;
	}
	
	public String getUploadPath(HttpServletRequest request, int uploadTpye){
		//업로드 경로를 구하는 메서드
		String realPath="";
		
		String type
		=fileUploadProps.getProperty("file.upload.type");
		
		if(type.equals("test")){
			//테스트인 경우 => 테스트 경로를 구한다
			if(uploadTpye==PDS_UPLOAD){
				// 자료실 파일 업로드
				realPath=fileUploadProps.getProperty("file.upload.path.test");
			}else {
				// 상품등록시 파일 이미지 업로드
				realPath
				=fileUploadProps.getProperty("imageFile.upload.path.test");
			}
			logger.info("테스트 경로={}", realPath);
		}else{
			//실제 배포하는 경우 => 실제 경로를 구한다
			if(uploadTpye==PDS_UPLOAD){
				// 자료실
				realPath
				=fileUploadProps.getProperty("file.upload.path");							
			}else{
				// 상품이미지 등록
				realPath
				=fileUploadProps.getProperty("imageFile.upload.path");
			}
			logger.info("실제 배포시 경로={}", realPath);
			
			//물리적인 경로 구하기
			realPath
			=request.getSession().getServletContext().getRealPath(realPath);
			logger.info("실제 배포시 물리적 경로={}",realPath);
		}//if
		
		return realPath;		
	}
	
}


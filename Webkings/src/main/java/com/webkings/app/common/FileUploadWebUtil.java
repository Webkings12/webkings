package com.webkings.app.common;

import java.io.File;
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
public class FileUploadWebUtil {
	private static final Logger logger=
			LoggerFactory.getLogger(FileUploadWebUtil.class);
	
	//자료실에서 업로드인지, 상품등록에서의 이미지인지 구분해주는 상수
	public static final int PDS_UPLOAD=1; //자료실 업로드
	public static final int IMAGE_UPLOAD=2; //상품등록 이미지
	
	
	@Resource(name="fileUploadProperties")
	private Properties fileUploadProps;
	
	
	public List<Map<String , Object>> fileUpload(HttpServletRequest request, int uploadType){
		
		//업로드가 가능한 클래스로 다운 캐스팅
		MultipartHttpServletRequest multipartRequest=(MultipartHttpServletRequest)request;
		
		Map<String, MultipartFile> fileMap=multipartRequest.getFileMap();
		
		List<Map<String , Object>> fileList= new ArrayList<Map<String , Object>>();
		Iterator<String> iter=fileMap.keySet().iterator();
		while(iter.hasNext()){
			String key=iter.next();
			MultipartFile tempFile=fileMap.get(key);
			
			//업로드파일이 있을 대만 파일명, 파일크기를
			//구해오고, 업로드 처리하기
			if(!tempFile.isEmpty()){
				String ofileName=tempFile.getOriginalFilename();
				logger.info("원본 파일명={}",ofileName);
				//파일명 변경하기
				String fileName=getUniqueFileName(ofileName);
				logger.info("변경된 파일명={}",fileName);
				//파일크기 구하기
				long fileSize=tempFile.getSize();
				
				//업로드 처리
				try{
					String upPath= getUploadPath(request, uploadType);
					File file=new File(upPath,fileName);
					tempFile.transferTo(file);
				}catch (Exception e) {
					e.printStackTrace();
				}
				Map<String, Object>map
					= new HashMap<String,Object>();
				map.put("fileName", fileName);
				map.put("fileSize", fileSize);
				fileList.add(map);
			}//if
		}//while
		return fileList;
	}
	
	public String getUniqueFileName(String ofileName){
		//파일명에 현재시간을 추가해서 변경된 파일명 만들기
		//abc.txt= abc+현재시간+.txt
		//=>abc20160818111520123.txt
		int idx=ofileName.lastIndexOf(".");
		//순수 파일명만 추출
		String fName=ofileName.substring(0,idx);
		//.을 포함한 확장자 추출
		String ext=ofileName.substring(idx);
		//순수파일명 + 현재시간 + 확장자 연결
		String fileName=fName+getCurrentTime()+ext;
		return fileName;
		
	}
	
	public String getCurrentTime(){
		//현재시간을 밀리초까지 보여주는 메서드
		Date today=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String str= sdf.format(today);
		
		return str;
	}
	
	public String getUploadPath(HttpServletRequest request,int uploadType){
		//업로드 경로를 구하는 메서드
		String type
		=fileUploadProps.getProperty("file.upload.type");
		String realPath="";
		if(type.equals("test")){
			//테스트인 경우 => 테스트 경로를 구한다
			if(uploadType==PDS_UPLOAD){
				realPath
				=fileUploadProps.getProperty("file.upload.path.test");
			}else{
				realPath
				=fileUploadProps.getProperty("imageFile.upload.path.test");
			}
			
			logger.info("테스트 경로={}",realPath);
		}else{
			//실제 배포하는 경우 => 실제 경로를 구한다
			if(uploadType==PDS_UPLOAD){
				realPath
				=fileUploadProps.getProperty("file.upload.type");
			}else{
				realPath
				=fileUploadProps.getProperty("imageFile.upload.type");
			}
			
			logger.info("실제 배포시 경로={}",realPath);
			//물리적인 경로 구하기
			realPath
			=request.getSession().getServletContext().getRealPath(realPath);
			logger.info("실제 배포시 물리적={}",realPath);
		}
		return realPath;
	}
}

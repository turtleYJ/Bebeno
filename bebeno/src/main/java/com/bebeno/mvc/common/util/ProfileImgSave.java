package com.bebeno.mvc.common.util;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.bebeno.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

// 업로드 한 파일을 저장/삭제하는 클래스
@Slf4j
public class ProfileImgSave {
	
	
	// 업로드 한 파일을 저장하는 메소드
	public static String save(MultipartFile upfile, 
								String location, 
								Member loginMember) {
		
		String renamedFileName = null;
		String originalFileName = upfile.getOriginalFilename();
		
		log.info("UpProfileImg Name : {}", originalFileName);
		log.info("location : {}", location);
		log.info(loginMember.toString());
		
		// location이 실제로 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(location);
		
		if(!folder.exists()) {
			folder.mkdirs(); // mkdirs() : 실제 경로에 폴더를 만드는 메소드
		}		
		
		renamedFileName = 
				loginMember.getId() + 
				originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일의 확장자만 가져오는 것 
		
		try {
			// 업로드한 파일 데이터를 새로 지정한 파일에 저장한다.
			upfile.transferTo(new File(location + "/" + renamedFileName));
			
		} catch (IllegalStateException | IOException e) {
			log.error("파일 전송 에러");
			e.printStackTrace();
		}
		
		return renamedFileName;
	}

// ==============================================================================	
	
	public static void delete(String location) {
		log.info("location : {}", location);
		
		File file = new File(location);
		
		if(file.exists()) {
			file.delete();
		}
	}
}

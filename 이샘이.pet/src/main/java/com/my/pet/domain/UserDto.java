package com.my.pet.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Data 
public class UserDto {
	@NotNull(message="아이디를 입력하세요")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-z]).{4,16}", message = "4~16자 영문 소문자, 숫자 조합으로 입력하세요.")
	private String userId;
	@NotNull(message="비밀번호를 입력하세요")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-z]).{4,16}", message = "4~16자 영문 소문자, 숫자 조합으로 입력하세요.")
	private String pw;
	@NotNull(message="이름을 입력하세요")
	@Pattern(regexp = "(?=.*[가-힣]).{2,10}", message = "2자이상 10자이하 한글로 입력하세요.")
	private String userName;
    private String userIntro;
    private MultipartFile userProfile;
    @NotNull(message="전화번호를 입력하세요")
    @Pattern(regexp = "^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$", message = "10 ~ 11 자리의 숫자만 입력 가능합니다.")
    private String phone;
    @Pattern(regexp = "^(?:\\w+\\.?)*\\w+@(?:\\w+\\.)+\\w+$", message = "이메일 형식이 올바르지 않습니다.")
    private String email;
    @NotNull(message="주소를 입력하세요")
    private String address;
    private String detailedAddress;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
   	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private LocalDate birthdate;
    @NotNull(message="닉네임을 입력하세요")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[가-힣])(?=.*[a-zA-Z]).{2,10}", message = "2~10자 영어 대 소문자, 한글, 숫자만 입력 가능합니다.")
    private String nickname; 
    private int hasAdminRights;
    private int isSuspended;
    private int isNotifyAll;  
    private int isNotifyMeetingClose;
    private int isNotifyComment;
    private int isNotifyReply; 
    private int isNotifyMeetingDeletion;
    private int isNotifyMeetingReOpening;
} 
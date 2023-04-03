package com.my.pet.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class UserDto {
	private String userId;
	private String pw;
	private String userName;
    private String intro;
    private MultipartFile userProfile;
    private String phone; 
    private String email;
    private String address;
    private String detailedAddress;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss", timezone = "Asia/Seoul")
    private LocalDate birthdate;
    private String nickName;
    private int hasAdminRights;
    private int isSuspended;
    private int isNotifyAll; 
    private int isNotifyMeetingClose;
    private int isNotifyComment;
    private int isNotifyReply;
    private int isNotifyMeetingDeletion;
    private int isNotifyMeetingReOpening;
}
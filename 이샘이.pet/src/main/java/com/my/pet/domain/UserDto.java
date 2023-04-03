package com.my.pet.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class UserDto {
	private String userId;
	private String pw;
	private String userName;
    private String intro;
    private String profileImageFileName;
    private String phone; 
    private String email;
    private String address;
    private String detailedAddress;
    private LocalDate birthDate;
    private String nickName;
    private int hasAdminRights;
    private int isNotifyAll; 
    private int isNotifyMeetingClose;
    private int isNotifyComment;
    private int isNotifyReply;
    private int isNotifyMeetingDeletion;
    private int isNotifyMeetingReOpening;
}
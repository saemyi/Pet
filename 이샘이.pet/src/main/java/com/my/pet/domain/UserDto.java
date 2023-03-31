package com.my.pet.domain;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class UserDto {
	@Pattern(regexp = "[0-9a-z]", message ="영어소문자, 숫자 조합으로 입력하세요.")
	@NotEmpty(message="아이디를 입력하세요.")
	@Size(min=8, max=20, message ="8자 이상, 20자 이하이어야 합니다.")
	private String userId;
	@Pattern(regexp = "[0-9a-z]", message ="영어소문자, 숫자 조합으로 입력하세요.")
	@Size(min=8, max=20, message ="8자 이상, 20자 이하이어야 합니다.")
	@NotEmpty(message="비밀번호를 입력하세요.")
	private String pw;
}
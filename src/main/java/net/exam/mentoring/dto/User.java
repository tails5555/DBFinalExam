package net.exam.mentoring.dto;

import lombok.Data;

@Data
public class User {
	int id;
	String userType;
	String password;
	String userName;

	String studentName;
	String studentNumber;
	String departmentName;
	int grade;

}

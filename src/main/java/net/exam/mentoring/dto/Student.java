package net.exam.mentoring.dto;
import lombok.Data;
@Data
public class Student {
	int id;
	String studentNumber;
	String name;
	String phoneNumber;
	int grade;
	String email;
	int departmentId;
	int userId;
}

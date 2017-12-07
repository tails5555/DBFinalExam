package net.exam.mentoring.dto;
import lombok.Data;
@Data
public class Mento {
	int id;
	String teamName;
	String advertiseContext;
	String subject;
	String qualificContext;
	java.util.Date applicationDate;
	int studentId;
	String mentoName;
	String phoneNumber;
	String email;
	int grade;
	String departmentName;
}

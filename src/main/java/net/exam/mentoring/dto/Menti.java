package net.exam.mentoring.dto;
import lombok.Data;
@Data
public class Menti {
	int mentoId;
	int studentId;
	String studentNumber;
	String studentName;
	String email;
	String phoneNumber;
	int grade;
}

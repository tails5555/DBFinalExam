package net.exam.mentoring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.exam.mentoring.dto.Student;
import net.exam.mentoring.dto.User;
import net.exam.mentoring.mapper.StudentMapper;
import net.exam.mentoring.mapper.UserMapper;
import net.exam.mentoring.utils.Encryption;
@Service
public class StudentService {
	@Autowired StudentMapper studentMapper;
	@Autowired UserMapper userMapper;
	
	public Student findOne(int id) {
		return studentMapper.findOne(id);
	}
	
	
	public void update(User user,int id) {
		
		Student student = studentMapper.findOne(id);
		
		System.out.println(user.getEmail());
			
		
		
		student.setEmail(user.getEmail());
		student.setGrade(user.getGrade());
		student.setName(user.getStudentName());
		student.setStudentNumber(user.getStudentNumber());
		student.setPhoneNumber(user.getPhoneNumber());
		
		studentMapper.update(student);
			
	}
	
	
	public void insert(Student student) {
		Student student1 = new Student();
		student1=null;
		student1=studentMapper.findByStudentNumber(student.getStudentNumber());
		
		if(student1!=null) {
			
		}
		else {
			User newUser=new User();
			String phone=student.getPhoneNumber();
			int phoneLength=phone.length();
			String password="a"+phone.substring(phoneLength-4, phoneLength);
			newUser.setPassword(Encryption.encrypt(password, Encryption.MD5));
			newUser.setUserType("학생");
			userMapper.insert(newUser);
			User lastUser=userMapper.findLastUser();
			student.setUserId(lastUser.getId());
			studentMapper.insert(student);
		}
	}
	
	public void delete(int id) {

		studentMapper.delete(id);
		userMapper.delete(id);
		
		
	}
}

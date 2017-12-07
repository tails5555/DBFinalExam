package net.exam.mentoring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.exam.mentoring.dto.Student;
import net.exam.mentoring.dto.User;
import net.exam.mentoring.mapper.StudentMapper;
import net.exam.mentoring.mapper.UserMapper;
import net.exam.mentoring.model.Option;
import net.exam.mentoring.model.Pagination;
import net.exam.mentoring.utils.Encryption;
@Service
public class UserService {
	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	static Option[] orderBy= { new Option(0, "-- 정렬 순서 --"), new Option(1, "학번 순"), new Option(2, "학번 역순"), new Option(3, "이름 순"), new Option(4, "이름 역순"), new Option(5, "학년 순"), new Option(6, "학년 역순"), new Option(7, "학과 순"), new Option(8, "학과 역순")};
	static Option[] searchBy= {new Option(0, "-- 검색 순서 --"), new Option(1, "학번"), new Option(2, "이름"), new Option(3, "학과"), new Option(4, "회원 유형")};
	public User login(String loginId, String password) {
		Student student=studentMapper.findByStudentNumber(loginId);
		if(student==null) return null;
		String pw=Encryption.encrypt(password, Encryption.MD5);
		User user=userMapper.findByLogin(student.getUserId());
		if(user.getPassword().equals(pw)==false) return null;
		user.setUserName(student.getName());
		return user;
	}
	public List<User> findAll(Pagination pagination){
		int count=userMapper.count(pagination);
		pagination.setRecordCount(count);
		return userMapper.findAll(pagination);
	}
	public User findOne(int id) {
		return userMapper.findOne(id);
	}
	public Option[] getOrderBy() {
		return orderBy;
	}
	public Option[] getSearchBy() {
		return searchBy;
	}
}

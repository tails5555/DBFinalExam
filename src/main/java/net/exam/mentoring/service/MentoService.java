package net.exam.mentoring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import net.exam.mentoring.dto.Mento;
import net.exam.mentoring.dto.Student;
import net.exam.mentoring.dto.User;
import net.exam.mentoring.mapper.MentoMapper;
import net.exam.mentoring.mapper.StudentMapper;
import net.exam.mentoring.mapper.UserMapper;

@Service
public class MentoService {
	@Autowired MentoMapper mentoMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired UserMapper userMapper;
	public List<Mento> findAll(){
		return mentoMapper.findAll();
	}
	public boolean isMento(int id) {
		Mento mento=mentoMapper.findOne(id);
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		Student student=studentMapper.findByStudentNumber(authentication.getName());
		if(mento.getStudentId()==student.getId()) return true;
		else return false;
	}
	public Mento findOne(int id) {
		return mentoMapper.findOne(id);
	}
	public void insert(Mento mento) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		Student student=studentMapper.findByStudentNumber(authentication.getName());
		mento.setStudentId(student.getId());
		mentoMapper.insert(mento);
		User user=userMapper.findOne(student.getUserId());
		userMapper.updateType("멘토", user.getId());
	}
}

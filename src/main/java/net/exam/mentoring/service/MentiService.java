package net.exam.mentoring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import net.exam.mentoring.dto.Menti;
import net.exam.mentoring.dto.Student;
import net.exam.mentoring.mapper.MentiMapper;
import net.exam.mentoring.mapper.StudentMapper;
import net.exam.mentoring.mapper.UserMapper;

@Service
public class MentiService {
	@Autowired StudentMapper studentMapper;
	@Autowired MentiMapper mentiMapper;
	@Autowired UserMapper userMapper;
	public List<Menti> findByMentoId(int mentoId){
		return mentiMapper.findByMentoId(mentoId);
	}
	public void insert(int mentoId) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		Student student=studentMapper.findByStudentNumber(authentication.getName());
		mentiMapper.insert(mentoId, student.getId());
		userMapper.updateType("멘티", student.getId());
	}
	public void delete(int mentoId) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		Student student=studentMapper.findByStudentNumber(authentication.getName());
		mentiMapper.delete(mentoId, student.getId());
		userMapper.updateType("학생", student.getUserId());
	}
	public boolean isMenti(int mentoId) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		Student student=studentMapper.findByStudentNumber(authentication.getName());
		List<Menti> menties=mentiMapper.findByMentoId(mentoId);
		boolean isMenti=false;
		for(Menti menti : menties) {
			if(student.getId()==menti.getStudentId()) {
				isMenti=true;
				break;
			}
		}
		return isMenti;
	}
}

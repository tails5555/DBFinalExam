package net.exam.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.exam.mentoring.dto.Student;
@Mapper
public interface StudentMapper {
	List<Student> findAll();
	Student findByStudentNumber(@Param("studentNumber") String studentNumber);
	Student findOne(int id);
	void insert(Student student);
	void delete(int id);
	void update(Student student);
}

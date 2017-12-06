package net.exam.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.exam.mentoring.dto.Department;

@Mapper
public interface DepartmentMapper {
	List<Department> findAll();
}

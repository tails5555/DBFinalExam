package net.exam.mentoring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.exam.mentoring.dto.Department;
import net.exam.mentoring.mapper.DepartmentMapper;

@Service
public class DepartmentService {
	@Autowired DepartmentMapper departmentMapper;
	public List<Department> findAll(){
		return departmentMapper.findAll();
	}
	public int findByDepartmentName(String departmentName) {
		int departmentId=-1;
		for(Department d : departmentMapper.findAll()) {
			if(d.getDepartmentName().equals(departmentName)) {
				departmentId=d.getId();
			}
		}
		if(departmentId!=-1) return departmentId;
		else return 12;
	}
}

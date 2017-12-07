package net.exam.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.exam.mentoring.dto.Mento;

@Mapper
public interface MentoMapper {
	List<Mento> findAll();
	Mento findOne(int id);
	void insert(Mento mento);
}

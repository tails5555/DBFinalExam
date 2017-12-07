package net.exam.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.exam.mentoring.dto.Menti;

@Mapper
public interface MentiMapper {
	List<Menti> findByMentoId(@Param("mentoId") int mentoId);
	void insert(@Param("mentoId") int mentoId, @Param("studentId") int studentId);
	void delete(@Param("mentoId") int mentoId, @Param("studentId") int studentId);
}

package net.exam.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.exam.mentoring.dto.User;
import net.exam.mentoring.model.Pagination;
@Mapper
public interface UserMapper {
	User findOne(int id);
	List<User> findAll(Pagination pagination);
	int count(Pagination pagination);
	User findLastUser();
	void insert(User user);
	void updateType(@Param("userType") String type, @Param("id") int id);
}

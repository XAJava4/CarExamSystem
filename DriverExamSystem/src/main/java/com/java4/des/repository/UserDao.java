package com.java4.des.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.java4.des.entity.User;


public interface UserDao extends PagingAndSortingRepository<User, Long> {

	public List<User> findByUsername(String username);
	
	public List<User> findByPassword(String password);
	
	@Query(value = "SELECT * FROM mxy_user WHERE id = ?1", nativeQuery = true)
	public User findById(Long id);
}

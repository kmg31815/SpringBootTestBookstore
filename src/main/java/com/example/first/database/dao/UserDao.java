package com.example.first.database.dao;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.example.first.database.entity.UserEntity;

public interface UserDao extends CrudRepository<UserEntity, String> {
	
	Boolean existsByUserName(String user);
//	Boolean existsByPassword(String pass);
	Optional<UserEntity> findByUserName(String user);

}

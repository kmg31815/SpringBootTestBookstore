package com.example.first.database.dao;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.example.first.database.entity.ClassEntity;

public interface ClassDao extends CrudRepository<ClassEntity, Integer> {
	
	Optional<ClassEntity> findByBookClassName(String bookClassName);

}

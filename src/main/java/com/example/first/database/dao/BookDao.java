package com.example.first.database.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.first.database.entity.BookEntity;
import com.example.first.database.entity.ClassEntity;

public interface BookDao extends CrudRepository<BookEntity, Integer> {
	
	Iterable<BookEntity> findALLByBookClassAndBookName(ClassEntity bookClass, String bookName);
	Iterable<BookEntity> findAllByBookClass(ClassEntity bookClass);
	Iterable<BookEntity> findAllByBookName(String bookName);

}

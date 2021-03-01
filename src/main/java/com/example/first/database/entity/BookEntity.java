package com.example.first.database.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="books")
@Data
public class BookEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="book_id")
	private int bookId;
	
	@Column(name="book_name")
	private String bookName;
	
//	@Column(name="class_id")
	@ManyToOne()
	@JoinColumn(name="class_id", referencedColumnName="id")
	private ClassEntity bookClass;
	
	public BookEntity() {
		
	}
	
	public BookEntity(String bookName, ClassEntity bookClass) {
		this.bookName = bookName;
		this.bookClass = bookClass;
	}
	
}

package com.example.first.model;

public class Books {
	
	private int id;
	private String bookName;
	
	public Books(int id, String name) {
		this.id = id;
		this.bookName = name;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	@Override
	public String toString() {
		return "Books [id=" + id + ", bookName=" + bookName + "]";
	}

}

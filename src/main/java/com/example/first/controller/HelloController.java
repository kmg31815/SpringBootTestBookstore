package com.example.first.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.first.database.dao.BookDao;
import com.example.first.database.dao.ClassDao;
import com.example.first.database.dao.UserDao;
import com.example.first.database.entity.BookEntity;
import com.example.first.database.entity.ClassEntity;

@Controller
public class HelloController {

	@Autowired
	private UserDao daoUser;
	@Autowired
	private BookDao daoBook;
	@Autowired
	private ClassDao daoClass;

	@RequestMapping("/login")
	public String index() {
		return "login";
	}

	@PostMapping("/login")
	public ModelAndView login(@RequestParam String user, @RequestParam String pass, HttpServletRequest request) {
		ModelAndView modelLogin = new ModelAndView("login");
		if (daoUser.existsByUserName(user)) {
			if (daoUser.findByUserName(user).get().getPassword().equals(pass)) {
				request.getSession().setAttribute("account", user);
				return new ModelAndView("redirect:/search");
			}
			modelLogin.addObject("respError", "帳密錯誤");
			return modelLogin;
		}
		modelLogin.addObject("respError", "帳密錯誤");
		return modelLogin;
	}

	@RequestMapping("/search")
	public ModelAndView search() {
		ModelAndView model = new ModelAndView("search");
		model.addObject("respSearch", daoClass.findAll());
		model.addObject("respBooks", daoBook.findAll());
		return model;
	}

	@PostMapping("/search")
	public ModelAndView search(@RequestParam String bookClassName, @RequestParam String bookName) {
		ModelAndView model = new ModelAndView("search");
		if (!bookClassName.equals("") && !bookName.equals("")) {
			ClassEntity bookClass = daoClass.findByBookClassName(bookClassName).get();
			model.addObject("respBooks", daoBook.findALLByBookClassAndBookName(bookClass, bookName));
			model.addObject("respSearch", daoClass.findAll());
			return model;
		} else if (!bookClassName.equals("") && bookName.equals("")) {
			ClassEntity bookClass = daoClass.findByBookClassName(bookClassName).get();
			model.addObject("respBooks", daoBook.findAllByBookClass(bookClass));
			model.addObject("respSearch", daoClass.findAll());
			return model;
		} else if (bookClassName.equals("") && !bookName.equals("")) {
			model.addObject("respBooks", daoBook.findAllByBookName(bookName));
			model.addObject("respSearch", daoClass.findAll());
			return model;
		} else {
			model.addObject("respBooks", daoBook.findAll());
			model.addObject("respSearch", daoClass.findAll());
			return model;
		}
	}

	@GetMapping("/update")
	public ModelAndView update(@RequestParam int id) {
		ModelAndView model = new ModelAndView("update");
		model.addObject("respUpdate", daoBook.findById(id).get());
		model.addObject("respSearch", daoClass.findAll());
		return model;
	}

	@PostMapping("/update")
	public ModelAndView update(@RequestParam int bookId, @RequestParam String bookClassName,
			@RequestParam String bookName) {
		BookEntity book = daoBook.findById(bookId).get();
		ClassEntity bookClass = daoClass.findByBookClassName(bookClassName).get();
		book.setBookClass(bookClass);
		book.setBookName(bookName);
		daoBook.save(book);
		return new ModelAndView("redirect:/search");
	}

	@PostMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam int id) {
		daoBook.deleteById(id);
		return "SECCESS";
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public BookEntity insert(@RequestParam String bookClassName, @RequestParam String bookName) {
		ClassEntity bookClass = daoClass.findByBookClassName(bookClassName).get();
		return daoBook.save(new BookEntity(bookName, bookClass));
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("account");
		return "redirect:/login";
	}

}

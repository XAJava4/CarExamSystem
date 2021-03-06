package com.java4.des.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java4.des.entity.Student;
import com.java4.des.repository.StudentDao;

@Component
@Transactional
public class StudentService {
	@Autowired
	private StudentDao studentDao;

	public Student findByStuId(int id) {

		return studentDao.findByStuId(id);
	}

	public void addstudent(Student student) {
		studentDao.save(student);
	}

	public List<Student> findAll() {
		return (List<Student>) studentDao.findAll();
	}

	public void delete(Integer id) {
		studentDao.delete(id);

	}

	public Student getOne(Integer id) {

		return studentDao.findOne(id);
	}

	public void update(String stuName, String stuPass, int stuSex, String teaName, int stuId) {
		studentDao.update(stuName, stuPass, stuSex, teaName, stuId);
	}


}

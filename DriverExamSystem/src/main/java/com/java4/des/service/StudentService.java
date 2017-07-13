package com.java4.des.service;

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
		
		public Student findByStuId( int id ){
			
			return studentDao.findByStuId(id);
		}
		
		public  void  addstudent( Student student ){
			studentDao.save(student);
		}
}

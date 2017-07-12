package com.java4.des.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java4.des.entity.Student;
import com.java4.des.repository.StudentDao;

@Component

public class StudentService {
		@Autowired
		private StudentDao studentDao;
		
		public Student findByStuId( int id ){
			
			return studentDao.findByStuId(id);
		}
}

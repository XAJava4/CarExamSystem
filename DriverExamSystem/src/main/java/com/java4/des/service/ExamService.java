package com.java4.des.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.java4.des.entity.Exam;
import com.java4.des.repository.ExamDao;

//Spring Bean的标识.
@Component
// 类中所有public函数都纳入事务管理的标识.
@Transactional
public class ExamService {
	//自动注入Dao层组件
	@Autowired
	private ExamDao examDao;
	
	public Exam findByExamID( int id ){
		return examDao.findByExamID(id);
	}
	public void addExam(Exam exam){
		examDao.save(exam);
	}
}


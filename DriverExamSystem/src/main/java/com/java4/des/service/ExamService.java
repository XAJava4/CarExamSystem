package com.java4.des.service;

import java.util.ArrayList;
import java.util.List;

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
	
	public Exam findByExamID( int examID ){
		return examDao.findByExamID(examID);
	}
	
	public void addExam(Exam exam){
		examDao.save(exam);
	}
	
	public List<Exam> getAllExams(){
		List<Exam> list = (List<Exam>) examDao.findAll();
		return list;
	}
	
	public Exam getOne(Integer examID){
		Exam exam=examDao.findOne(examID);
		return exam;
	}
	
	public void delteExam(Integer examID) {
		examDao.delete(examID);
	}
}


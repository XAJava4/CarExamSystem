package com.java4.des.service;

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
	//查找一个
	public Exam findByExamID( int examID ){
		return examDao.findByExamID(examID);
	}
	//添加
	public void addExam(Exam exam){
		examDao.save(exam);
	}
	//获取所有
	public List<Exam> getAllExams(){
		List<Exam> list = (List<Exam>) examDao.findAll();
		return list;
	}
	//获取一个
	public Exam getOne(Integer examID){
		
		return examDao.findOne(examID);
	}
	//删除
	public void delteExam(Integer examID) {
		examDao.delete(examID);
	}
	
	//更新试题
	public void updateExam(Exam exam){
		examDao.save(exam);
	}
}


package com.java4.des.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.java4.des.entity.Exam;

public interface ExamDao extends PagingAndSortingRepository<Exam, Integer> {
	@Query(value = "select examID,examTitle,examOptionA,examOptionB,examOptionC,examOptionD,examOptionAnswer,examParse from db_exam where ExamID = ?1", nativeQuery = true)
	public Exam findByExamID(int id);
	
/*	@Query(value="",nativeQuery=true)
	public boolean save(Exam exam);*/

}

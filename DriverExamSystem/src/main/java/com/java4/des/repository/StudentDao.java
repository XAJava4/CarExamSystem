package com.java4.des.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.java4.des.entity.Student;

public interface StudentDao extends PagingAndSortingRepository<Student, Integer> {
		@Query(value=" select stu_id ,stu_name , stu_pass ,stu_score ,stu_sex ,tea_name  from student where  stu_id=?1 ; ",nativeQuery=true)
		public Student findByStuId( int id );
}

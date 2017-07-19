package com.java4.des.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

/**
 *学生实体 
 */
@Setter @Getter
@Entity
@Table(name="student")
public class Student {
	@Id
	private int stuId;				//学号
	private String stuName;			//学生姓名	
	private String stuPass;			//密码
	private int stuSex;			//性别
	private float stuScore;			//成绩
	private String teaName;			//对应教练的姓名
	
}

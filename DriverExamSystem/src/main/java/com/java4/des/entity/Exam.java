package com.java4.des.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="db_exam")
public class Exam {
	@Id
	private int examID;			//试题序号
	private String examTitle;	//试题内容
	private String examOptionA; //试题选项A
	private String examOptionB; //试题选项B
	private String examOptionC; //试题选项C
	private String examOptionD; //试题选项D
	private String examAnswer;  //试题答案
	private String examParse;   //试题说明
	public int getExamID() {
		return examID;
	}
	public void setExamID(int examID) {
		this.examID = examID;
	}
	public String getExamTitle() {
		return examTitle;
	}
	public void setExamTitle(String examTitle) {
		this.examTitle = examTitle;
	}
	public String getExamOptionA() {
		return examOptionA;
	}
	public void setExamOptionA(String examOptionA) {
		this.examOptionA = examOptionA;
	}
	public String getExamOptionB() {
		return examOptionB;
	}
	public void setExamOptionB(String examOptionB) {
		this.examOptionB = examOptionB;
	}
	public String getExamOptionC() {
		return examOptionC;
	}
	public void setExamOptionC(String examOptionC) {
		this.examOptionC = examOptionC;
	}
	public String getExamOptionD() {
		return examOptionD;
	}
	public void setExamOptionD(String examOptionD) {
		this.examOptionD = examOptionD;
	}
	public String getExamAnswer() {
		return examAnswer;
	}
	public void setExamAnswer(String examAnswer) {
		this.examAnswer = examAnswer;
	}
	public String getExamParse() {
		return examParse;
	}
	public void setExamParse(String examParse) {
		this.examParse = examParse;
	}
	
	
}

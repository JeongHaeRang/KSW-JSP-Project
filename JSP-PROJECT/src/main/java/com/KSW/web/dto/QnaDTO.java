package com.KSW.web.dto;

import java.util.Date;

public class QnaDTO {
    private int qnaNum;			//문의 번호 PK
    private String userId;		//유저 아이디 FK
    private String qnatitle;	//문의 제목
    private String qnaDetails;	//문의 내용
    private String createdat;	//작성 날짜
    private String answerat;		//답변 날짜
    private String qnaanswer;	//답변 내용

    // Getters and Setters
    public int getQnaNum() {
        return qnaNum;
    }

    public void setQnaNum(int qnaNum) {
        this.qnaNum = qnaNum;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getQnaDetails() {
        return qnaDetails;
    }

    public void setQnaDetails(String qnaDetails) {
        this.qnaDetails = qnaDetails;
    }

	public String getQnatitle() {
		return qnatitle;
	}

	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}

	public String getCreatedat() {
		return createdat;
	}

	public void setCreatedat(String createdat) {
		this.createdat = createdat;
	}

	public String getAnswerat() {
		return answerat;
	}

	public void setAnswerat(String answerat) {
		this.answerat = answerat;
	}

	public String getQnaanswer() {
		return qnaanswer;
	}

	public void setQnaanswer(String qnaanswer) {
		this.qnaanswer = qnaanswer;
	}
    
}

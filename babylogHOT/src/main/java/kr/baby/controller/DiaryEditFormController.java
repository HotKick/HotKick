package kr.baby.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.baby.dao.BabyMyBatisDAO;
import kr.baby.dao.DiaryVO;

public class DiaryEditFormController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BabyMyBatisDAO dao = new BabyMyBatisDAO();
		int diary_seq = Integer.parseInt(request.getParameter("diary_seq"));
		DiaryVO vo = dao.getDiary_seq(diary_seq);
		request.setAttribute("vo", vo);
		
		
		return "diaryEdit";
	}

}

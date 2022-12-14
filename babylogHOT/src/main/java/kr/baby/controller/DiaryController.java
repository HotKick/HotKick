package kr.baby.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.baby.dao.BabyMyBatisDAO;
import kr.baby.dao.DiaryVO;

public class DiaryController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 일기 목록 불러오기
		BabyMyBatisDAO dao = new BabyMyBatisDAO();
		List<DiaryVO> list =dao.listDiary();
		request.setAttribute("list",list);
		return "diary";
	}

}

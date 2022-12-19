package kr.baby.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.baby.dao.BabyMyBatisDAO;
import kr.baby.dao.DiaryVO;
import kr.baby.dao.MemberVO;

public class MypageController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BabyMyBatisDAO dao = new BabyMyBatisDAO();
		List<DiaryVO> list =dao.listDiary();
		request.setAttribute("list",list);
		HttpSession session=request.getSession();
		MemberVO mvo=null; 
		if(session.getAttribute("mvo")!=null) {
			MemberVO vo=(MemberVO)session.getAttribute("mvo");
			mvo=dao.getMember(vo.getMem_id());
			session.setAttribute("mvo", mvo);
		}
		return "mypage";
	}

}

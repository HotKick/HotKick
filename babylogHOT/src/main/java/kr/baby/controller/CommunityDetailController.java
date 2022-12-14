package kr.baby.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.baby.dao.BabyMyBatisDAO;
import kr.baby.dao.CommunityVO;

public class CommunityDetailController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		BabyMyBatisDAO dao = new BabyMyBatisDAO();
		CommunityVO vo= new CommunityVO();

		int community_seq = Integer.parseInt(request.getParameter("community_seq"));
		vo = dao.getCommunity_seq(community_seq);
		dao.countFree(community_seq); //조회수 누적 
		
		request.setAttribute("vo", vo);
		
		return "communityDetail";
	}

}



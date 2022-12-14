package kr.baby.dao;

public class DiaryCommentVO {
	
	private int diary_cmt_seq;
	private int diary_seq;
	private String diary_cmt_content;
	private String diary_cmt_date;
	private String mem_id;
	private String mem_nick;
	
	public DiaryCommentVO() {}
	

	public DiaryCommentVO(int diary_cmt_seq, int diary_seq, String diary_cmt_content, String diary_cmt_date,
			String mem_id, String mem_nick) {
		super();
		this.diary_cmt_seq = diary_cmt_seq;
		this.diary_seq = diary_seq;
		this.diary_cmt_content = diary_cmt_content;
		this.diary_cmt_date = diary_cmt_date;
		this.mem_id = mem_id;
		this.mem_nick = mem_nick;
	}
	@Override
	public String toString() {
		return "DiaryCommentVO [diary_cmt_seq=" + diary_cmt_seq + ", diary_seq=" + diary_seq + ", diary_cmt_content="
				+ diary_cmt_content + ", diary_cmt_date=" + diary_cmt_date + ", mem_id=" + mem_id + ", mem_nick="
				+ mem_nick + "]";
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public int getDiary_cmt_seq() {
		return diary_cmt_seq;
	}
	public void setDiary_cmt_seq(int diary_cmt_seq) {
		this.diary_cmt_seq = diary_cmt_seq;
	}
	public int getDiary_seq() {
		return diary_seq;
	}
	public void setDiary_seq(int diary_seq) {
		this.diary_seq = diary_seq;
	}
	public String getDiary_cmt_content() {
		return diary_cmt_content;
	}
	public void setDiary_cmt_content(String diary_cmt_content) {
		this.diary_cmt_content = diary_cmt_content;
	}
	public String getDiary_cmt_date() {
		return diary_cmt_date;
	}
	public void setDiary_cmt_date(String diary_cmt_date) {
		this.diary_cmt_date = diary_cmt_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

}

package model;

import java.util.Date;

public class MemSco {
	//member
		private String m_id;
		private String password;
		private String intro;
		private String email;
		private String name;
		private String birthday;	// 아이디 찾을때 쓰기위한 질문의 답변
		private String question;	// 암호 찾을때 쓰기위한 질문의 답변
		private Date lastDate;
		private int vsyn;	// 대결 가능 여부
		private int coin;
		private int heart;
		//scoretable
		private String c_id;
		private int score;
		private int scoreAve;
		private int scoreCnt;
		private int win;
		private int lose;
		private int draw;
		
		public String getM_id() {
			return m_id;
		}
		public void setM_id(String m_id) {
			this.m_id = m_id;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getIntro() {
			return intro;
		}
		public void setIntro(String intro) {
			this.intro = intro;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getBirthday() {
			return birthday;
		}
		public void setBirthday(String birthday) {
			this.birthday = birthday;
		}
		public String getQuestion() {
			return question;
		}
		public void setQuestion(String question) {
			this.question = question;
		}
		public Date getLastDate() {
			return lastDate;
		}
		public void setLastDate(Date lastDate) {
			this.lastDate = lastDate;
		}
		public int getVsyn() {
			return vsyn;
		}
		public void setVsyn(int vsyn) {
			this.vsyn = vsyn;
		}
		public int getCoin() {
			return coin;
		}
		public void setCoin(int coin) {
			this.coin = coin;
		}
		public int getHeart() {
			return heart;
		}
		public void setHeart(int heart) {
			this.heart = heart;
		}
		public String getC_id() {
			return c_id;
		}
		public void setC_id(String c_id) {
			this.c_id = c_id;
		}
		public int getScore() {
			return score;
		}
		public void setScore(int score) {
			this.score = score;
		}
		public int getScoreAve() {
			return scoreAve;
		}
		public void setScoreAve(int scoreAve) {
			this.scoreAve = scoreAve;
		}
		public int getScoreCnt() {
			return scoreCnt;
		}
		public void setScoreCnt(int scoreCnt) {
			this.scoreCnt = scoreCnt;
		}
		public int getWin() {
			return win;
		}
		public void setWin(int win) {
			this.win = win;
		}
		public int getLose() {
			return lose;
		}
		public void setLose(int lose) {
			this.lose = lose;
		}
		public int getDraw() {
			return draw;
		}
		public void setDraw(int draw) {
			this.draw = draw;
		}
		
}

package model;

public class Scoretable {
	private String m_id;
	private String c_id;
	private int score;
	private int highScore;
	private int scoreAve;
	private int scoreCnt;
	private int win;
	private int lose;
	private int draw;
	private int rate;
	private int rank;
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getHighScore() {
		return highScore;
	}
	public void setHighScore(int highScore) {
		this.highScore = highScore;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
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

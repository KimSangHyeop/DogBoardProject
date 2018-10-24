package board;

public class Board {
	private int num;
	private String wdate;
	private String write;
	private String title;
	private String cont;
	private int rate;
	
	public Board() {
		super();
	}
	public Board(int num, String wdate, String write, String title, String cont, int rate) {
		super();
		this.num = num;
		this.wdate = wdate;
		this.write = write;
		this.title = title;
		this.cont = cont;
		this.rate = rate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getWrite() {
		return write;
	}
	public void setWrite(String write) {
		this.write = write;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Board [num=");
		builder.append(num);
		builder.append(", wdate=");
		builder.append(wdate);
		builder.append(", write=");
		builder.append(write);
		builder.append(", title=");
		builder.append(title);
		builder.append(", cont=");
		builder.append(cont);
		builder.append(", rate=");
		builder.append(rate);
		builder.append("]");
		return builder.toString();
	}
	

}

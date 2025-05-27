package day0508;

public class Counter {

	private int cnt;
	
	public Counter() {
		System.out.println("Counter 생성");
	}//Counter

	public int getCnt() {
		return cnt;
	}//getCnt

	public void setCnt(int cnt) {
		this.cnt += cnt;
	}//setCnt
	
	
	
	
}//class

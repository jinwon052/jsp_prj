package day0508;

public class DataDTO {
	private String name;
	private int myAge;
	
	public DataDTO() {
		System.out.println("DataDTO 기본생성자");
	}//DataDTO

	public DataDTO(String name, int age) {
		this.name = name;
		this.myAge = age;
		System.out.println("DataDTO 매개변수 있는 생성자");
	}//DataDTO

	public String getName() {
		System.out.println("getName 호출");
		return name;
	}//getName

	public void setName(String name) {
		System.out.println("setName 호출");
		this.name = name;
	}//setName

	public int getMyAge() {
		return myAge;
	}//getAge

	public void setMyAge(int age) {
		this.myAge = age;
	}//setMyAge

	@Override
	public String toString() {
		return "DataDTO [name=" + name + ", myAge=" + myAge + "]";
	}//toString
	
	
	
}//class

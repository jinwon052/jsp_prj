package day0515;

import java.io.FileWriter;
import java.io.IOException;

public class CreateText {

	public static void main(String[] args) {
		String msg="AJAX 동작은 쉽지 않구만 오늘은 금요일 이었으면 좋겠다!!!@@@";
		try {
			FileWriter fw=new FileWriter("C:/dev/workspace/jsp_prj/src/main/webapp/day0515/ajax.txt");
			fw.write(msg);
			fw.flush();
			if(fw !=null) {fw.close();} //end if
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
	}//main

}//class

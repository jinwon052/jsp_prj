package day0516;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class EmpService {

	
	/**
	 * 복합형태의 JSONObject을 반환
	 * @return
	 */
	public String searchEmp(int deptno) {
		String strJSON=null;
		
		List<EmpDTO> list=null;
		
		EmpDAO empDAO=EmpDAO.getInstance();
		
		try {
			list=empDAO.selectEmp(deptno); //데이터 조회
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//1.JSONObject 생성(데이터의 부가적인 정보, 데이터를 가질 때 사용)
			JSONObject jsonObj=new JSONObject();
			jsonObj.put("resultFlag", !list.isEmpty());//검색 정보가 존재
			jsonObj.put("pubDate", sdf.format(new Date()));//검색 정보가 존재
			jsonObj.put("dataLength", list.size());//검색 정보가 존재
			
			//2.데이터 채우기
			//JSONArray생성
			JSONArray jsonArr=new JSONArray();
			
			JSONObject jsonTemp=null;
			for(EmpDTO empDto : list) {
				//DB에서 검색된 데이터로 JSONObject을 생성하여 JSONArray에 할당
				jsonTemp=new JSONObject();
				jsonTemp.put("empno", empDto.getEmpno());
				jsonTemp.put("ename", empDto.getEname());
				//날짜를 그대로 JSONObject 할당하면 사용한 곳에서 정수형으로 반환되어 error 발생
				jsonTemp.put("hiredate", sdf.format(empDto.getHiredate()));//날짜 -> 문자열
				jsonTemp.put("job", empDto.getJob());
				jsonTemp.put("sal", empDto.getSal());
				jsonArr.add(jsonTemp);
			}//end for
			//JSONArray를 JSONObjct 할당
			jsonObj.put("data", jsonArr);
			
			
			strJSON=jsonObj.toJSONString();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return strJSON;
	}//jsonObj
}//class

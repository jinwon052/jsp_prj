package xml0528;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import day0515.Dept;
import day0515.DeptService;

public class CreateDeptXML {

	public void createDeptFile() {
		try {
		FileOutputStream fos = 
				new FileOutputStream("C:/dev/workspace/jsp_prj/src/main/webapp/xml0528/db_dept.xml");
		createXml(fos, null);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}//createDeptFile
	
	public void webBrowserOutput( JspWriter out) {
		try {
			createXml(null, out);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}//webBrowserOutput
	
	private void createXml(FileOutputStream fos, JspWriter out) throws IOException {
		DeptService ds = new DeptService();
		List<Dept> deptList = ds.searchAllDept();
		
		//문서객체 생성
		Document doc = new Document();//<?xml version="1.0" encoding ="utf-8"
		//최상위 근 노드 생성
		Element rootNode = new Element("depts");// <depts/>
		
		//조회결과로 노드 생성
		//정보를 가진 노드 생성 : 부가적인 정보를 생성  {result:true, pubDate:생성,data:[{deptno:10,dname}]
		Element resultNode = new Element("result"); // <result/>
		resultNode.setText(String.valueOf(!deptList.isEmpty()));
		Element pubDateNode = new Element("pubDate"); // <result/>
		//<pubDate> 2025-05-08..</pubDate>
		pubDateNode.setText(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date() ));
		
		//검색 정보를 가진 노드를 최상위 부모노드 배치
		rootNode.addContent(resultNode);
		rootNode.addContent(pubDateNode);
		
		//<depts>
		//<result>true</result>
		//<pubDate>날짜</pubDate>
		
		//조회결과로 노드를 생성하여 배치
		Element deptNode=null; //하나의 레코드를 저장하기위한 노드
		Element deptnoNode=null;//컬럼값을 저장하기위한 노드
		Element dnameNode=null;
		Element locNode=null;
		
		for(Dept dept : deptList) {
			//하나의 레코드를 저장하기 위한 노드
			deptNode = new Element("dept");
			//컬럼값을 저장하기위한 노드를 생성
			deptnoNode = new Element("deptno");
			dnameNode = new Element("dname");
			locNode = new Element("loc");
			
			//조회된 컬럼값을 생성한 노드에 설정
			deptnoNode.setText(String.valueOf(dept.getDeptno()));
			dnameNode.setText(dept.getDname());
			locNode.setText(dept.getLoc());
			
			//컬럼 값을 가진 노드를 부모노드(dept) 에 배치
			deptNode.addContent(deptnoNode);
			deptNode.addContent(dnameNode);
			deptNode.addContent(locNode);
			
			//dept 노드를 depts노드에 배치
			
			rootNode.addContent(deptNode);
			
		}//end for
		
		//모든 레코드를 가진 rootNode를 XML문서 객체 배치
		doc.addContent(rootNode);
		
		//출력
		XMLOutputter xOut=new XMLOutputter(Format.getPrettyFormat());
		
		if(out == null) {
				xOut.output(doc, fos);//파일로 출려
			
		}else {
			xOut.output(doc, out);
			
		}//end else
	}//createXml
}

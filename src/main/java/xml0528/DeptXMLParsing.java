package xml0528;

import java.io.IOException;
import java.net.URL;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;


public class DeptXMLParsing {

	public void parsing() {
		//1.XML을  로딩할 수 있는 객체 생성
		SAXBuilder builder=new SAXBuilder();
		//2.XML에 접근하여 문서객체로 얻는다
		//Local
		try {
			//Local
			//Document doc=builder.build(new File("C:/dev/workspace/jsp_prj/src/main/webapp/xml0528/db_dept.xml"));
			//Web
			Document doc=builder.build(new URL("http://localhost/jsp_prj/xml0528/db_dept.xml"));
			//최상위 부모노드 얻기
			Element rootNode=doc.getRootElement();
			System.out.println(rootNode);
			//정보를 제공하는 특정자식노드 하나 얻기
			Element resultNode=rootNode.getChild("result");
			Boolean flag=Boolean.valueOf(resultNode.getText());//parsing
			Element pubDateNode=rootNode.getChild("pubDate");
			String pubDate=pubDateNode.getText();//parsing
			System.out.println("데이터 생성일"+pubDate);
			if( flag ) {//검색 결과가 있음
				//여러 자식 노드를 가진 반복되는 노드를 얻기
				List<Element> deptList=rootNode.getChildren("dept");
				Element deptnoNode=null;
				Element dnameNode=null;
				Element locNode=null;
				
				for( Element deptNode : deptList) {
					deptnoNode=deptNode.getChild("deptno");
					dnameNode=deptNode.getChild("dname");
					locNode=deptNode.getChild("loc");
					
					System.out.println(deptnoNode.getText()+"/"
							+dnameNode.getText()+"/"
							+locNode.getText());
				}//end for
			}//end if
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
	}//parsing
	
	public static void main(String[] args) {
		DeptXMLParsing dxp=new DeptXMLParsing();
		dxp.parsing();
	}//main
	
}//class

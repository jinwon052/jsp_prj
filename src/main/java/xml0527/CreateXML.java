package xml0527;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspWriter;

import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class CreateXML {

	public void createXML() {
		//1.XML 문서객체 생성
		Document doc=new Document();
		
		
		//2.최상위 부모노드 생성
		Element rootNode=new Element("root");
		
		//3.자식 노드 생성
		Element msgNode=new Element("msg");
		Element nameNode=new Element("name");
//		System.out.println(msgNode);
		msgNode.setText("안녕하세요?");
		nameNode.setText("홍길동");

		//자식노드에 속성을 설정
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		//속성객체 생성
		Attribute attr=new  Attribute("today", sdf.format(new Date()));
		//자식노드에 배치
		msgNode.setAttribute(attr);
		//4.자식노드를 부모노드에 배치
		rootNode.addContent(msgNode);
		rootNode.addContent(nameNode);
		//모든 자식노드를 가진 부모노드를 문서객체에 배치
		doc.addContent(rootNode);
		
		//출력객체 생성
		//XMLOutputter xout=new XMLOutputter();
		//XMLOutputter xout=new XMLOutputter(Format.getRawFormat());
		//XMLOutputter xout=new XMLOutputter(Format.getCompactFormat());
		XMLOutputter xout=new XMLOutputter(Format.getPrettyFormat());
		
		try {
			//콘솔출력
			xout.output(doc, System.out);
			//파일로 출력
			xout.output(doc, new FileOutputStream("C:/dev/workspace/jsp_prj/src/main/webapp/xml0527/create.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
	}//createXML
	
	public void createXML2(JspWriter out) {
		//1.XML 문서객체 생성
		Document doc=new Document();
		
		
		//2.최상위 부모노드 생성
		Element rootNode=new Element("root");
		
		//3.자식 노드 생성
		Element msgNode=new Element("msg");
		Element nameNode=new Element("name");
//		System.out.println(msgNode);
		msgNode.setText("안녕하세요?");
		nameNode.setText("홍길동");

		//자식노드에 속성을 설정
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		//속성객체 생성
		Attribute attr=new  Attribute("today", sdf.format(new Date()));
		//자식노드에 배치
		msgNode.setAttribute(attr);
		//4.자식노드를 부모노드에 배치
		rootNode.addContent(msgNode);
		rootNode.addContent(nameNode);
		//모든 자식노드를 가진 부모노드를 문서객체에 배치
		doc.addContent(rootNode);
		
		//출력객체 생성
		//XMLOutputter xout=new XMLOutputter();
		//XMLOutputter xout=new XMLOutputter(Format.getRawFormat());
		//XMLOutputter xout=new XMLOutputter(Format.getCompactFormat());
		XMLOutputter xout=new XMLOutputter(Format.getPrettyFormat());
		
		try {
			//웹브라우저 출력
			xout.output(doc, out);
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
	}//createXML2
	
	public static void main(String[] args) {
		new CreateXML().createXML();
		
	}//main

}//class

<%@page import="java.io.IOException"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info=""%>
<%
//1.XML 문서객체 생성
		Document doc=new Document();
		
		//2.최상위 부모노드 생성
		Element rootNode=new Element("root");
		
		//3.자식 노드 생성
		Element msgNode=new Element("msg");
		msgNode.setText("안녕하세요?");

		//4.자식노드를 부모노드에 배치
		rootNode.addContent(msgNode);
		//모든 자식노드를 가진 부모노드를 문서객체에 배치
		doc.addContent(rootNode);
		
		//출력객체 생성
		//XMLOutputter xout=new XMLOutputter(Format.getRawFormat());
		//XMLOutputter xout=new XMLOutputter(Format.getCompactFormat());
		XMLOutputter xout=new XMLOutputter(Format.getPrettyFormat());
		
		try {
			//콘솔출력
			xout.output(doc, out);
			//파일로 출력
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
%>
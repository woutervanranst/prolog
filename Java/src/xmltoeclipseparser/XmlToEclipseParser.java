package xmltoeclipseparser;

import java.io.File;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import xmltoeclipseparser.types.ArticleList;
import xmltoeclipseparser.types.PageList;

public class XmlToEclipseParser 
{
	private File xml;
	
	public XmlToEclipseParser(File xml)
	{
		this.xml = xml;
	}
	
	public String parse() throws SAXException, IOException, ParserConfigurationException
	{
		DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
		Document doc = docBuilder.parse(xml);

		PageList pl = new PageList(doc.getDocumentElement());
		
		ArticleList al = new ArticleList(doc.getDocumentElement());
		
		return String.format("Pages=%s, Articles=%s", pl.getStringValue(), al.getStringValue());
	}
}

package xmltoeclipseparser.types;

import java.util.LinkedList;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import xmltoeclipseparser.ValueElement;

public class ArticleList implements ValueElement
{
	private LinkedList<Article> list = new LinkedList<Article>();
	
	public ArticleList(Element el)
	{
		NodeList listOfElements = el.getElementsByTagName("artikel");
        for (int i = 0; i < listOfElements.getLength() ; i++)
        {
        	Element thisElement = (Element)listOfElements.item(i);
        	list.add(new Article(thisElement));
        }
	}
	
	@Override
	public String getStringValue() {
		String values = "";
		
		for (Article thisElement : list)
		{
			if (!values.isEmpty())
				values += ", ";
			
			values += thisElement.getStructString();
		}
		
		return String.format("[%s]", values);
	}
}
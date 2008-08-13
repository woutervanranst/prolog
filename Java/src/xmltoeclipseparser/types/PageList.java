package xmltoeclipseparser.types;

import java.util.LinkedList;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import xmltoeclipseparser.ValueElement;

public class PageList implements ValueElement
{
	private LinkedList<Page> list = new LinkedList<Page>();
	
	public PageList(Element el)
	{
		NodeList listOfElements = el.getElementsByTagName("page");
        for (int i = 0; i < listOfElements.getLength() ; i++)
        {
        	Element thisElement = (Element)listOfElements.item(i);
        	list.add(new Page(thisElement));
        }
	}
	
	@Override
	public String getStringValue() {
		String values = "";
		
		for (Page thisElement : list)
		{
			if (!values.isEmpty())
				values += ", ";
			
			values += thisElement.getStructString();
		}
		
		return String.format("[%s]", values);
	}
}
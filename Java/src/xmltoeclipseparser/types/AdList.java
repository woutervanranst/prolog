package xmltoeclipseparser.types;

import java.util.LinkedList;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import xmltoeclipseparser.ValueElement;

public class AdList implements ValueElement
{
	private LinkedList<Ad> list = new LinkedList<Ad>();
	
	public AdList(Element el)
	{
		NodeList listOfElements = el.getElementsByTagName("ad");
        for (int i = 0; i < listOfElements.getLength() ; i++)
        {
        	Element thisElement = (Element)listOfElements.item(i);
        	list.add(new Ad(thisElement));
        }
	}
	
	@Override
	public String getStringValue() {
		String values = "";
		
		for (Ad thisElement : list)
		{
			if (!values.isEmpty())
				values += ", ";
			
			values += thisElement.getStructString();
		}
		
		return String.format("[%s]", values);
	}
}
package xmltoeclipseparser.types;

import java.util.LinkedList;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import xmltoeclipseparser.ValueElement;

public class LayoutList implements ValueElement
{
	private LinkedList<Layout> list = new LinkedList<Layout>();
	
	public LayoutList(Element el)
	{
		NodeList listOfElements = el.getElementsByTagName("artlayout");
        for (int i = 0; i < listOfElements.getLength() ; i++)
        {
        	Element thisElement = (Element)listOfElements.item(i);
        	list.add(new Layout(thisElement));
        }
	}
	
	@Override
	public String getStringValue() {
		String values = "";
		
		for (Layout thisElement : list)
		{
			if (!values.isEmpty())
				values += ", ";
			
			values += thisElement.getStructString();
		}
		
		return String.format("[%s]", values);
	}
}
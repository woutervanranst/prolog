package xmltoeclipseparser;

import java.util.Dictionary;
import java.util.Enumeration;
import java.util.Hashtable;

import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;

public abstract class EclipseElement
{
	protected Dictionary<String, ValueElement> attributes = new Hashtable<String, ValueElement>();
	
	public EclipseElement(Element el)
	{
		// Read Attributes
		NamedNodeMap attributes = el.getAttributes();
		for (int i = 0; i < attributes.getLength(); i++)
		{
			Node thisAttribute = attributes.item(i);
			this.attributes.put(thisAttribute.getNodeName(), new StringValue(thisAttribute.getNodeValue()));			
		}
	}
	
	public abstract String getStructMask();
	
	public String getStructString()
	{
		String structBody = "";
		
		Enumeration<String> keys = attributes.keys();
		while(keys.hasMoreElements())
		{
			// Get key and value
			String thisKey = keys.nextElement();
			String thisValue = attributes.get(thisKey).getStringValue();
			
			// Add , if needed
			if (!structBody.isEmpty())
				structBody += ", ";
			// Add this keyvalue pair
			structBody += String.format("%s:%s", thisKey, thisValue);
		}
		
		String thisStruct = String.format(getStructMask(), structBody);
		
		return thisStruct;
	}
}

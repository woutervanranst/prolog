package eclipsetoxmlparser;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.LinkedList;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.parctechnologies.eclipse.CompoundTerm;
import com.sun.org.apache.xpath.internal.XPathAPI;

public class EclipseToXmlParser 
{
	private LinkedList<Allocation> allocations;
	private File in;
	
	public EclipseToXmlParser(File in, CompoundTerm eclipseResult)
	{
		//Read Allocations
		allocations = (new AllocationReader(eclipseResult)).getAllocations();
		
		this.in = in;
	}
	
	public void parse(File out) throws SAXException, IOException, ParserConfigurationException, TransformerException
	{
		//Read document
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(in);
		
		for (Allocation alloc : allocations) {
			if (alloc.getLayoutId() == 0)
				//Voor ads: layoutId == 0. Artikels hebben een plaas die al op voorhand bepaald is, en al in de xml zit
				continue;
			
			//Artikel
			setCoordinates(document, 
					Integer.toString(alloc.getArticleId()),
					Integer.toString(alloc.getPageId()),
					Integer.toString(alloc.getLayoutId()),
					Integer.toString(alloc.getStartX()),
					Integer.toString(alloc.getStartY()));
		}
		
		//Save document
        serialize(out, document);
    }
	
	private void setCoordinates(Document document, String artId, String pageId, String layoutId, String x, String y) throws TransformerException 
	{
        String xpath = "/all/artikels/artikel[@id='" + artId + "']";
        NodeList list = XPathAPI.selectNodeList(document.getDocumentElement(), xpath);
        assert list.getLength() == 1;
        Element element = (Element) list.item(0);
        
        element.setAttribute("pageid", pageId);
        element.setAttribute("layoutid", layoutId);
        element.setAttribute("startx", x);
        element.setAttribute("starty", y);
    }

    private void serialize(File out, Document document) throws TransformerException, IOException 
    {
        Transformer transformer = TransformerFactory.newInstance().newTransformer();
        FileOutputStream fileOutputStream = new FileOutputStream(out);
        transformer.transform(new DOMSource(document), new StreamResult(fileOutputStream));
        fileOutputStream.flush();
        fileOutputStream.close();
    }
}

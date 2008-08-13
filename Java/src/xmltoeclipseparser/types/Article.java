package xmltoeclipseparser.types;

import org.w3c.dom.Element;

import xmltoeclipseparser.EclipseElement;
import xmltoeclipseparser.ValueElement;

public class Article extends EclipseElement {

	public Article(Element el) {
		// Read Article
		super(el);
		
		// Read Layouts
		ValueElement layoutList = new LayoutList(el);
		attributes.put("layouts", layoutList);
	}

	@Override
	public String getStructMask() {
		return "article{%s}";
	}
}

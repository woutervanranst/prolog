package xmltoeclipseparser.types;

import org.w3c.dom.Element;

import xmltoeclipseparser.EclipseElement;

public class Ad extends EclipseElement {

	public Ad(Element el) {
		super(el);
	}

	@Override
	public String getStructMask() {
		return "ad{%s}";
	}
}

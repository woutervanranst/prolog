package xmltoeclipseparser.types;

import org.w3c.dom.Element;

import xmltoeclipseparser.EclipseElement;

public class Layout extends EclipseElement {

	public Layout(Element el) {
		super(el);
	}

	@Override
	public String getStructMask() {
		return "layout{%s}";
	}
}

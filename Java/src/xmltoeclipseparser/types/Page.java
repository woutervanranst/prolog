package xmltoeclipseparser.types;

import org.w3c.dom.Element;

import xmltoeclipseparser.EclipseElement;
import xmltoeclipseparser.ValueElement;

public class Page extends EclipseElement 
{
/*	*** FROM
	<page id="4995" isleft="1" artikelslinks="true" margex="35.4325" margey="73.8328262" usewidth="822.034" useheight="1208.8236738">
	  <ad id="5015" x="35.433" y="1208.957" width="266.452" height="73.7" /> 
	 </page>
	 
	 *** TO
	 pagein(id:4995, isleft:1, artikelslinks:true, margex:35.4325, margey:73.8328262, usewidth:822.034, useheight:1208.8236738,
			ads:[ad(id:5015, x:35.433, y:1135.275, width:266.452, height:73.7)]),s
*/
	
	public Page(Element el)
	{
		// Read Page
		super(el);
		
		// Read Ads
		ValueElement adList = new AdList(el);
		attributes.put("ads", adList);
	}

	@Override
	public String getStructMask() {
		return "pagein{%s}";
	}
}
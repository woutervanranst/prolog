package xmltoeclipseparser;

public class StringValue implements ValueElement {
	
	private String thisValue;
	
	public StringValue(String value)
	{
		thisValue = value.toLowerCase();	//Prolog constants are lowercase
	}
	
	@Override
	public String getStringValue() {
		return thisValue;
	}

}

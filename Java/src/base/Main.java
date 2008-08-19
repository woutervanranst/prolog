package base;
import com.parctechnologies.eclipse.*;

import eclipsetoxmlparser.AllocationReader;
import eclipsetoxmlparser.EclipseToXmlParser;

import java.io.*;

import xmltoeclipseparser.XmlToEclipseParser;

public class Main {

	/**
	 * @param args
	 */
	//VM Arg: -Declipse.directory="C:\Program Files\ECLiPSe 5.10"
	public static void main(String[] args) throws Exception 
	{
		// Create some default Eclipse options
	    EclipseEngineOptions eclipseEngineOptions = new EclipseEngineOptions();
	    // Object representing the Eclipse process
	    EclipseEngine eclipse;
	
	    // Connect the Eclipse's standard streams to the JVM's
	    eclipseEngineOptions.setUseQueues(false);
	
	    // Initialise Eclipse
	    eclipse = EmbeddedEclipse.getInstance(eclipseEngineOptions);
	
	    // Write a message
	    
	    File in = new File("C:/Documents and Settings/Administrator/Desktop/HLN/XML/data.xml");
	    File out = new File("C:/Documents and Settings/Administrator/Desktop/HLN/XML/result.xml");
	    XmlToEclipseParser xtep = new XmlToEclipseParser(in);
	    
	    String rpcCommand = String.format("%s, doLayout(bestfirst, Pages, Articles, PagesOut, Score).", xtep.parse());
	    System.out.println(rpcCommand);

	    eclipse.rpc("set_flag('cwd', '//C/Documents and Settings/Administrator/Desktop/HLN/ECLiPSe/'), include('hln5.pl').");
	    CompoundTerm result = eclipse.rpc(rpcCommand);
	    
	    EclipseToXmlParser etxp = new EclipseToXmlParser(in, result);
	    etxp.parse(out);
	   	
	    // Destroy the Eclipse process
	    ((EmbeddedEclipse) eclipse).destroy();
	}
}
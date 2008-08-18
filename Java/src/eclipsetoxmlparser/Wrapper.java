package eclipsetoxmlparser;

import java.util.Iterator;
import java.util.LinkedList;

import com.parctechnologies.eclipse.CompoundTerm;
import com.parctechnologies.eclipse.CompoundTermImpl;

public class Wrapper implements Iterable {
	private LinkedList ll;
	private CompoundTerm ct;
	
	public Wrapper(Object obj)
	{
		if (obj.getClass().equals(CompoundTermImpl.class))
			ct = (CompoundTermImpl)obj;
		else if (obj.getClass().equals(LinkedList.class))
			ll = (LinkedList)obj;
	}

	@Override
	public Iterator iterator() {
		if (ll != null)
			//Return default LinkedList iterator
			return ll.iterator();
		else if (ct != null)
			//Return custom CompoundTerm iterator
			return new CompoundTermIterator();
		else
			return null;
	}
	
	//inner class implements the Iterator pattern
    private class CompoundTermIterator implements Iterator {
    	private int next = 1;
    	
		@Override
		public boolean hasNext() {
			return (next <= ct.arity());
		}

		@Override
		public Object next() {
        	Object retValue = ct.arg(next);
        	next += 1;
        	return retValue;
		}

		@Override
		public void remove() {
			// TODO Auto-generated method stub	
		}
    }
}

package eclipsetoxmlparser;

import java.util.LinkedList;

import com.parctechnologies.eclipse.CompoundTerm;
import com.parctechnologies.eclipse.CompoundTermImpl;

public class AllocationReader {
	private LinkedList<Allocation> allocations = new LinkedList<Allocation>();
	
	//private Wrapper wrapper; 
	public AllocationReader(CompoundTerm ct)
	{
		//wrapper = ;
		
		readAllocations(new Wrapper(ct));
	}
	
	public LinkedList<Allocation> getAllocations()
	{
		return allocations;
	}
	
	private void readAllocations(Wrapper wrapper)
	{
		for (Object object : wrapper) 
		{
			if (object.getClass().equals(CompoundTermImpl.class) &&
					((CompoundTerm)object).functor().equals("allocation"))
			{
				//System.out.println("ALLOCATION");
				readAllocation((CompoundTerm)object);
			}
			else
			{
				if (object.getClass().equals(CompoundTermImpl.class) ||
						object.getClass().equals(LinkedList.class))
				{
					readAllocations(new Wrapper(object));
				}
				else
				{
					//System.out.println(object.toString());
				}	
			}
				
			//System.out.println();
		}
	}
	
	private void readAllocation(CompoundTerm allocationTerm)
	{
		//struct(allocation(pageid, artid, layoutid, sx, sy, ex, ey, score))
		assert(allocationTerm.functor().equals("allocation"));
		assert(allocationTerm.arity() == 8);
		
		Allocation allocationObject = new Allocation(
				Integer.parseInt(allocationTerm.arg(1).toString()),
				Integer.parseInt(allocationTerm.arg(2).toString()),
				Integer.parseInt(allocationTerm.arg(3).toString()),
				new Rectangle(
						Integer.parseInt(allocationTerm.arg(4).toString()),
						Integer.parseInt(allocationTerm.arg(5).toString()),
						Integer.parseInt(allocationTerm.arg(6).toString()),
						Integer.parseInt(allocationTerm.arg(7).toString())));
		
		allocations.add(allocationObject);
	}
}

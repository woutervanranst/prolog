package eclipsetoxmlparser;

public class Allocation {
	//struct(allocation(pageid, artid, layoutid, sx, sy, ex, ey, score))
	
	private int pageId, artId, layoutId;
	private Rectangle rectangle;
	
	public Allocation(int pageId, int artId, int layoutId, Rectangle rectangle)
	{
		this.pageId = pageId;
		this.artId = artId;
		this.layoutId = layoutId;
		this.rectangle = rectangle;
	}
	
	public int getArticleId()
	{
		return artId;
	}
	
	public int getPageId()
	{
		return pageId;
	}
	
	public int getLayoutId()
	{
		return layoutId;
	}
	
	public int getStartX()
	{
		return rectangle.getStartX();
	}
	
	public int getStartY()
	{
		return rectangle.getStartY();
	}
	
	@Override
	public String toString()
	{
		return String.format("Allocation: PageId: %s, ArtId: %s, LayoutId: %s, %s", 
				pageId, artId, layoutId,
				rectangle.toString());
	}
}

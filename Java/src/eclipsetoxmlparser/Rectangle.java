package eclipsetoxmlparser;

public class Rectangle {
	private int sx, sy, ex, ey;
	
	public Rectangle(int sx, int sy, int ex, int ey)
	{
		this.sx = sx;
		this.sy = sy;
		this.ex = ex;
		this.ey = ey;
	}
	
	public int getStartX()
	{
		return sx;
	}
	
	public int getStartY()
	{
		return sy;
	}
	
	@Override
	public String toString()
	{
		return String.format("Rectangle: SX: %s, SY: %s, EX: %s, EY: %s",
				sx, sy, ex, ey);
	}
}

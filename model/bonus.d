module model.bonus;

import model.bonus_type;
import model.rectangular_unit;

class Bonus : RectangularUnit
{
	immutable BonusType type;

	public immutable this (long id,
	    double mass,
	    double x,
	    double y,
	    double speedX,
	    double speedY,
	    double angle,
	    double angularSpeed,
	    double width,
	    double height,
	    BonusType type)
	{
		super (id, mass, x, y, speedX, speedY, angle, angularSpeed,
		    width, height);
		this.type = type;
	}
}

module model.rectangular_unit;

import model.unit;

abstract class RectangularUnit : Unit
{
	immutable double width;
	immutable double height;

	protected immutable this (long id,
	    double mass,
	    double x,
	    double y,
	    double speedX,
	    double speedY,
	    double angle,
	    double angularSpeed,
	    double width,
	    double height)
	{
		super (id, mass, x, y, speedX, speedY, angle, angularSpeed);
		this.width = width;
		this.height = height;
	}
}

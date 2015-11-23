module model.unit;

import std.math;

abstract class Unit
{
	immutable long id;
	immutable double mass;
	immutable double x;
	immutable double y;
	immutable double speedX;
	immutable double speedY;
	immutable double angle;
	immutable double angularSpeed;

	protected immutable this (long id,
	    double mass,
	    double x,
	    double y,
	    double speedX,
	    double speedY,
	    double angle,
	    double angularSpeed)
	{
		this.id = id;
		this.mass = mass;
		this.x = x;
		this.y = y;
		this.speedX = speedX;
		this.speedY = speedY;
		this.angle = angle;
		this.angularSpeed = angularSpeed;
	}

	double GetAngleTo (double x, double y)
	{
		double absoluteAngleTo = atan2 (y - this.y, x - this.x);
		double relativeAngleTo = absoluteAngleTo - angle;

		while (relativeAngleTo > +PI)
		{
			relativeAngleTo -= 2.0 * PI;
		}

		while (relativeAngleTo < -PI)
		{
			relativeAngleTo += 2.0 * PI;
		}

		return relativeAngleTo;
	}

	double GetAngleTo (Unit unit)
	{
		return GetAngleTo (unit.x, unit.y);
	}

	double GetDistanceTo (double x, double y)
	{
		double xRange = x - this.x;
		double yRange = y - this.y;
		return sqrt (xRange * xRange + yRange * yRange);
	}

	double GetDistanceTo (Unit unit)
	{
		return GetDistanceTo (unit.x, unit.y);
	}
}

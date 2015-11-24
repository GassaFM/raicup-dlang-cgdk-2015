module model.circular_unit;

import model.unit;

abstract class CircularUnit : Unit
{
    immutable double radius;

    protected immutable this (long id,
        double mass,
        double x,
        double y,
        double speedX,
        double speedY,
        double angle,
        double angularSpeed,
        double radius)
    {
        super (id, mass, x, y, speedX, speedY, angle, angularSpeed);
        this.radius = radius;
    }
}

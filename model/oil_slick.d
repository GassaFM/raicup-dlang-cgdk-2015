module model.oil_slick;

import model.circular_unit;

class OilSlick : CircularUnit
{
    immutable int remainingLifetime;

    public immutable this (long id,
        double mass,
        double x,
        double y,
        double speedX,
        double speedY,
        double angle,
        double angularSpeed,
        double radius,
        int remainingLifetime)
    {
        super (id, mass, x, y, speedX, speedY, angle, angularSpeed,
            radius);
        this.remainingLifetime = remainingLifetime;
    }
}

module model.projectile;

import model.circular_unit;
import model.projectile_type;

class Projectile : CircularUnit
{
    immutable long carId;
    immutable long playerId;
    immutable ProjectileType type;

    public immutable this (long id,
        double mass,
        double x,
        double y,
        double speedX,
        double speedY,
        double angle,
        double angularSpeed,
        double radius,
        long carId,
        long playerId,
        ProjectileType type)
    {
        super (id, mass, x, y, speedX, speedY, angle, angularSpeed,
            radius);
        this.carId = carId;
        this.playerId = playerId;
        this.type = type;
    }
}

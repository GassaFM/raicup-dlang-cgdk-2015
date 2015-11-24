module model.car;

import model.car_type;
import model.rectangular_unit;

class Car : RectangularUnit
{
    immutable long playerId;
    immutable int teammateIndex;
    immutable bool isTeammate;
    immutable CarType type;
    immutable int projectileCount;
    immutable int nitroChargeCount;
    immutable int oilCanisterCount;
    immutable int remainingProjectileCooldownTicks;
    immutable int remainingNitroCooldownTicks;
    immutable int remainingOilCooldownTicks;
    immutable int remainingNitroTicks;
    immutable int remainingOiledTicks;
    immutable double durability;
    immutable double enginePower;
    immutable double wheelTurn;
    immutable int nextWaypointIndex;
    immutable int nextWaypointX;
    immutable int nextWaypointY;
    immutable bool isFinishedTrack;

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
        long playerId,
        int teammateIndex,
        bool isTeammate,
        CarType type,
        int projectileCount,
        int nitroChargeCount,
        int oilCanisterCount,
        int remainingProjectileCooldownTicks,
        int remainingNitroCooldownTicks,
        int remainingOilCooldownTicks,
        int remainingNitroTicks,
        int remainingOiledTicks,
        double durability,
        double enginePower,
        double wheelTurn,
        int nextWaypointIndex,
        int nextWaypointX,
        int nextWaypointY,
        bool isFinishedTrack)
    {
        super (id, mass, x, y, speedX, speedY, angle, angularSpeed,
            width, height);
        this.playerId = playerId;
        this.teammateIndex = teammateIndex;
        this.isTeammate = isTeammate;
        this.type = type;
        this.projectileCount = projectileCount;
        this.nitroChargeCount = nitroChargeCount;
        this.oilCanisterCount = oilCanisterCount;
        this.remainingProjectileCooldownTicks = remainingProjectileCooldownTicks;
        this.remainingNitroCooldownTicks = remainingNitroCooldownTicks;
        this.remainingOilCooldownTicks = remainingOilCooldownTicks;
        this.remainingNitroTicks = remainingNitroTicks;
        this.remainingOiledTicks = remainingOiledTicks;
        this.durability = durability;
        this.enginePower = enginePower;
        this.wheelTurn = wheelTurn;
        this.nextWaypointIndex = nextWaypointIndex;
        this.nextWaypointX = nextWaypointX;
        this.nextWaypointY = nextWaypointY;
        this.isFinishedTrack = isFinishedTrack;
    }
}

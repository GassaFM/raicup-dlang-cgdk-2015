module my_strategy;

import model;
import strategy;

final class MyStrategy : Strategy
{
    void move (immutable Car self, immutable World world,
        immutable Game game, ref Move move)
    {
        move.enginePower = 1.0;
        move.isThrowProjectile = true;
        move.isSpillOil = true;

        if (world.tick > game.initialFreezeDurationTicks)
        {
            move.isUseNitro = true;
        }

/+
        if (world.bonuses.length > 0 &&
            self.getDistanceTo (world.bonuses[0]) < 1500.0)
        {
            move.isThrowProjectile = true;
        }
+/

/+
        if (world.cars.length > 1 &&
            world.cars[1].getAngleTo (self) < 1.0)
        {
            move.isSpillOil = true;
        }
+/

/+
        if (world.getMyPlayer () is null)
        {
            assert (false);
        }
+/
    }
}

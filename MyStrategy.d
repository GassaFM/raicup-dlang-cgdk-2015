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
	}
}

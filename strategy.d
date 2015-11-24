module strategy;

import model.car;
import model.game;
import model.move;
import model.world;

public interface Strategy
{
    void move (immutable Car self, immutable World world,
        immutable Game game, ref Move move);
}

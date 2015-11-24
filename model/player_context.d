module model.player_context;

import model.car;
import model.world;
    
final class PlayerContext
{
    immutable Car [] cars;
    immutable World world;

    public immutable this (immutable (Car) [] cars, immutable World world)
    {
        this.cars = cars.idup;
        this.world = world;
    }
}

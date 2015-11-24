module model.world;

import std.algorithm;
import std.array;

import model.bonus;
import model.car;
import model.direction;
import model.oil_slick;
import model.player;
import model.projectile;
import model.tile_type;

class World
{
    immutable int tick;
    immutable int tickCount;
    immutable int lastTickIndex;
    immutable int width;
    immutable int height;
    immutable Player [] players;
    immutable Car [] cars;
    immutable Projectile [] projectiles;
    immutable Bonus [] bonuses;
    immutable OilSlick [] oilSlicks;
    immutable string mapName;
    immutable TileType [] [] tilesXY;
    immutable int [2] [] waypoints;
    immutable Direction startingDirection;

    public immutable this (int tick,
        int tickCount,
        int lastTickIndex,
        int width,
        int height,
        immutable (Player) [] players,
        immutable (Car) [] cars,
        immutable (Projectile) [] projectiles,
        immutable (Bonus) [] bonuses,
        immutable (OilSlick) [] oilSlicks,
        string mapName,
        immutable (TileType) [] [] tilesXY,
        int [2] [] waypoints,
        Direction startingDirection)
    {
        this.tick = tick;
        this.tickCount = tickCount;
        this.lastTickIndex = lastTickIndex;
        this.width = width;
        this.height = height;
        this.players = players.idup;
        this.cars = cars.idup;
        this.projectiles = projectiles.idup;
        this.bonuses = bonuses.idup;
        this.oilSlicks = oilSlicks.idup;
        this.mapName = mapName;
        this.tilesXY = tilesXY.map !(x => x.idup).array.idup;
        this.waypoints = waypoints.idup;
        this.startingDirection = startingDirection;
    }

    immutable (Player) getMyPlayer () const
    {
        foreach (player; players)
        {
            if (player.isMe)
            {
                return player;
            }
        }
        return null;
    }
}

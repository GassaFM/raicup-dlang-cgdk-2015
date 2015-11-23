module rpc;

import std.bitmanip;
import std.conv;
import std.exception;
import std.range;
import std.socket;
import std.stdio;
import std.traits;

import model;

enum MessageType : byte
{
	UNKNOWN_MESSAGE,
	GAME_OVER,
	AUTHENTICATION_TOKEN,
	TEAM_SIZE,
	PROTOCOL_VERSION,
	GAME_CONTEXT,
	PLAYER_CONTEXT,
	MOVE_MESSAGE
}

class RemoteProcessClient
{
public:
	this (string host, string port)
	{
		Address addr = getAddress (host, port)[0];
		socket = new Socket (addr.addressFamily, SocketType.STREAM);
		socket.setOption (SocketOptionLevel.TCP,
		    SocketOption.TCP_NODELAY, true);
		socket.setOption (SocketOptionLevel.SOCKET,
		    SocketOption.RCVBUF, 1 << 12);
		socket.connect (addr);
	}

	void writeToken (string token)
	{
		write (MessageType.AUTHENTICATION_TOKEN);
		write (token);
	}

	int readTeamSize ()
	{
		enforce (read !(MessageType) == MessageType.TEAM_SIZE);
		return read !(int);
	}
	
	void writeProtocolVersion ()
	{
		write (MessageType.PROTOCOL_VERSION);
		write !(int) (2);
	}

	auto readGameContextMessage ()
	{
		auto messageType = read !(MessageType) ();
		enforce (messageType == MessageType.GAME_CONTEXT);

		return read !(immutable Game) ();
	}

	auto readPlayerContextMessage ()
	{
		auto messageType = read !(MessageType) ();
		if (messageType == MessageType.GAME_OVER)
		{
			return null;
		}
		enforce (messageType == MessageType.PLAYER_CONTEXT);

		return read !(immutable PlayerContext) ();
	}

	void writeMovesMessage (Move [] moves)
	{
		write (MessageType.MOVE_MESSAGE);

		write !(Move []) (moves);
	}

	void close ()
	{
		socket.close;
	}

private:
	Socket socket;

	string mapName;
	immutable (TileType) [] [] tilesXY;
	int [2] [] waypoints;
	Direction startingDirection = Direction.DirectionCount;

	auto read (T : const Bonus) ()
	{
		enforce (read !(bool));

		auto id = read !(long) ();
		auto mass = read !(double) ();
		auto x = read !(double) ();
		auto y = read !(double) ();
		auto speedX = read !(double) ();
		auto speedY = read !(double) ();
		auto angle = read !(double) ();
		auto angularSpeed = read !(double) ();
		auto width = read !(double) ();
		auto height = read !(double) ();
		auto type = read !(BonusType) ();

		return new T (id, mass, x, y, speedX, speedY,
		    angle, angularSpeed, width, height, type);
	}

	auto read (T : const Car) ()
	{
		enforce (read !(bool));

		auto id = read !(long) ();
		auto mass = read !(double) ();
		auto x = read !(double) ();
		auto y = read !(double) ();
		auto speedX = read !(double) ();
		auto speedY = read !(double) ();
		auto angle = read !(double) ();
		auto angularSpeed = read !(double) ();
		auto width = read !(double) ();
		auto height = read !(double) ();
		auto playerId = read !(long) ();
		auto teammateIndex = read !(int) ();
		auto isTeammate = read !(bool) ();
		auto type = read !(CarType) ();
		auto projectileCount = read !(int) ();
		auto nitroChargeCount = read !(int) ();
		auto oilCanisterCount = read !(int) ();
		auto remainingProjectileCooldownTicks = read !(int) ();
		auto remainingNitroCooldownTicks = read !(int) ();
		auto remainingOilCooldownTicks = read !(int) ();
		auto remainingNitroTicks = read !(int) ();
		auto remainingOiledTicks = read !(int) ();
		auto durability = read !(double) ();
		auto enginePower = read !(double) ();
		auto wheelTurn = read !(double) ();
		auto nextWaypointIndex = read !(int) ();
		auto nextWaypointX = read !(int) ();
		auto nextWaypointY = read !(int) ();
		auto isFinishedTrack = read !(bool) ();

		return new immutable T (id, mass, x, y, speedX, speedY,
		    angle, angularSpeed, width, height,
		    playerId,
		    teammateIndex,
		    isTeammate,
		    type,
		    projectileCount,
		    nitroChargeCount,
		    oilCanisterCount,
		    remainingProjectileCooldownTicks,
		    remainingNitroCooldownTicks,
		    remainingOilCooldownTicks,
		    remainingNitroTicks,
		    remainingOiledTicks,
		    durability,
		    enginePower,
		    wheelTurn,
		    nextWaypointIndex,
		    nextWaypointX, 
		    nextWaypointY,
		    isFinishedTrack);
	}

	auto read (T : const Game) ()
	{
		enforce (read !(bool));
	
		auto randomSeed = read !(long) ();
		auto tickCount = read !(int) ();
		auto worldWidth = read !(int) ();
		auto worldHeight = read !(int) ();
		auto trackTileSize = read !(double) ();
		auto trackTileMargin = read !(double) ();
		auto lapCount = read !(int) ();
		auto lapTickCount = read !(int) ();
		auto initialFreezeDurationTicks = read !(int) ();
		auto burningTimeDurationFactor = read !(double) ();
		auto finishTrackScores = read !(int []) ();
		auto finishLapScore = read !(int) ();
		auto lapWaypointsSummaryScoreFactor = read !(double) ();
		auto carDamageScoreFactor = read !(double) ();
		auto carEliminationScore = read !(int) ();
		auto carWidth = read !(double) ();
		auto carHeight = read !(double) ();
		auto carEnginePowerChangePerTick = read !(double) ();
		auto carWheelTurnChangePerTick = read !(double) ();
		auto carAngularSpeedFactor = read !(double) ();
		auto carMovementAirFrictionFactor = read !(double) ();
		auto carRotationAirFrictionFactor = read !(double) ();
		auto carLengthwiseMovementFrictionFactor = read !(double) ();
		auto carCrosswiseMovementFrictionFactor = read !(double) ();
		auto carRotationFrictionFactor = read !(double) ();
		auto throwProjectileCooldownTicks = read !(int) ();
		auto useNitroCooldownTicks = read !(int) ();
		auto spillOilCooldownTicks = read !(int) ();
		auto nitroEnginePowerFactor = read !(double) ();
		auto nitroDurationTicks = read !(int) ();
		auto carReactivationTimeTicks = read !(int) ();
		auto buggyMass = read !(double) ();
		auto buggyEngineForwardPower = read !(double) ();
		auto buggyEngineRearPower = read !(double) ();
		auto jeepMass = read !(double) ();
		auto jeepEngineForwardPower = read !(double) ();
		auto jeepEngineRearPower = read !(double) ();
		auto bonusSize = read !(double) ();
		auto bonusMass = read !(double) ();
		auto pureScoreAmount = read !(int) ();
		auto washerRadius = read !(double) ();
		auto washerMass = read !(double) ();
		auto washerInitialSpeed = read !(double) ();
		auto washerDamage = read !(double) ();
		auto sideWasherAngle = read !(double) ();
		auto tireRadius = read !(double) ();
		auto tireMass = read !(double) ();
		auto tireInitialSpeed = read !(double) ();
		auto tireDamageFactor = read !(double) ();
		auto tireDisappearSpeedFactor = read !(double) ();
		auto oilSlickInitialRange = read !(double) ();
		auto oilSlickRadius = read !(double) ();
		auto oilSlickLifetime = read !(int) ();
		auto maxOiledStateDurationTicks = read !(int) ();

		return new immutable T (randomSeed,
		    tickCount,
		    worldWidth,
		    worldHeight,
		    trackTileSize,
		    trackTileMargin,
		    lapCount,
		    lapTickCount,
		    initialFreezeDurationTicks,
		    burningTimeDurationFactor,
		    finishTrackScores,
		    finishLapScore,
		    lapWaypointsSummaryScoreFactor,
		    carDamageScoreFactor,
		    carEliminationScore,
		    carWidth,
		    carHeight,
		    carEnginePowerChangePerTick,
		    carWheelTurnChangePerTick,
		    carAngularSpeedFactor,
		    carMovementAirFrictionFactor,
		    carRotationAirFrictionFactor,
		    carLengthwiseMovementFrictionFactor,
		    carCrosswiseMovementFrictionFactor,
		    carRotationFrictionFactor,
		    throwProjectileCooldownTicks,
		    useNitroCooldownTicks,
		    spillOilCooldownTicks,
		    nitroEnginePowerFactor,
		    nitroDurationTicks,
		    carReactivationTimeTicks,
		    buggyMass,
		    buggyEngineForwardPower,
		    buggyEngineRearPower,
		    jeepMass,
		    jeepEngineForwardPower,
		    jeepEngineRearPower,
		    bonusSize,
		    bonusMass,
		    pureScoreAmount,
		    washerRadius,
		    washerMass,
		    washerInitialSpeed,
		    washerDamage,
		    sideWasherAngle,
		    tireRadius,
		    tireMass,
		    tireInitialSpeed,
		    tireDamageFactor,
		    tireDisappearSpeedFactor,
		    oilSlickInitialRange,
		    oilSlickRadius,
		    oilSlickLifetime,
		    maxOiledStateDurationTicks);
	}

	auto read (T : const OilSlick) ()
	{
		debug (io) {writeln ("oil slick started");}
		enforce (read !(bool));

		auto id = read !(long) ();
		auto mass = read !(double) ();
		auto x = read !(double) ();
		auto y = read !(double) ();
		auto speedX = read !(double) ();
		auto speedY = read !(double) ();
		auto angle = read !(double) ();
		auto angularSpeed = read !(double) ();
		auto radius = read !(double) ();
		auto remainingLifetime = read !(int) ();
		debug (io) {writeln ("oil slick finished");}

		return new immutable T (id, mass, x, y, speedX, speedY,
		    angle, angularSpeed, radius, remainingLifetime);
	}

	auto read (T : const Player) ()
	{
		enforce (read !(bool));

		auto id = read !(long) ();
		auto isMe = read !(bool) ();
		auto name = read !(string) ();
		auto isStrategyCrashed = read !(bool) ();
		auto score = read !(int) ();

		return new immutable T (id, isMe,
		    name, isStrategyCrashed, score);
	}

	auto read (T : const PlayerContext) ()
	{
		enforce (read !(bool));

		auto cars = read !(immutable Car []) ();
		auto world = read !(immutable World) ();

		return new immutable T (cars, world);
	}

	auto read (T : const Projectile) ()
	{
		enforce (read !(bool));

		auto id = read !(long) ();
		auto mass = read !(double) ();
		auto x = read !(double) ();
		auto y = read !(double) ();
		auto speedX = read !(double) ();
		auto speedY = read !(double) ();
		auto angle = read !(double) ();
		auto angularSpeed = read !(double) ();
		auto radius = read !(double) ();
		auto carId = read !(long) ();
		auto playerId = read !(long) ();
		auto type = read !(ProjectileType) ();

		return new immutable T (id, mass, x, y, speedX, speedY,
		    angle, angularSpeed, radius, carId, playerId, type);
	}

	auto read (T : const World) ()
	{
		enforce (read !(bool));

		auto tick = read !(int) ();
		auto tickCount = read !(int) ();
		auto lastTickIndex = read !(int) ();
		auto width = read !(int) ();
		auto height = read !(int) ();
		debug (io) {writeln ("to player");}
		auto players = read !(immutable (Player) []) ();
		debug (io) {writeln ("to car");}
		auto cars = read !(immutable (Car) []) ();
		debug (io) {writeln ("to projectile");}
		auto projectiles = read !(immutable (Projectile) []) ();
		debug (io) {writeln ("to bonus");}
		auto bonuses = read !(immutable (Bonus) []) ();
		debug (io) {writeln ("to oilslick");}
		auto oilSlicks = read !(immutable (OilSlick) []) ();
		if (mapName is null)
		{
			mapName = read !(string) ();
		}
		auto curTilesXY = read !(immutable (TileType) [] []) ();
		if (!curTilesXY.empty)
		{
			tilesXY = curTilesXY;
		}
		if (waypoints is null)
		{
			waypoints = read !(int [2] []) ();
		}
		if (startingDirection == Direction.DirectionCount)
		{
			startingDirection = read !(Direction) ();
		}

		return new immutable T (tick,
		    tickCount,
		    lastTickIndex,
		    width,
		    height,
		    players,
		    cars,
		    projectiles,
		    bonuses,
		    oilSlicks,
		    mapName,
		    tilesXY,
		    waypoints,
		    startingDirection);
	}

	void write (T : Move) (Move move)
	{
		write !(bool) (true);

		write !(double) (move.enginePower);
		write !(bool) (move.isBrake);
		write !(double) (move.wheelTurn);
		write !(bool) (move.isThrowProjectile);
		write !(bool) (move.isUseNitro);
		write !(bool) (move.isSpillOil);
	}

	auto read (T : T [num], ulong num) ()
	{
		int len = read !(int) ();
		enforce (len == num);

		T [num] ret = void;
		foreach (ref val; ret)
		{
			val = read !(T) ();
		}
		return ret;
	}

	auto read (T : string) ()
	{
		int len = read !(int) ();
		enforce (len >= 0);
		return cast (string) (readBytesRuntime (len).idup);
	}

	void write (T : string) (T value)
	{
		write !(int) (cast (int) (value.length));
		writeBytes (cast (ubyte []) value);
	}

	auto read (T : T []) ()
	{
		debug (io) {writeln ("array read");}
		int len = read !(int) ();
		enforce (len >= 0);

		T [] ret;
		ret.reserve (len);
		foreach (i; 0..len)
		{
			ret ~= read !(T) ();
		}

		return ret;
	}

	void write (T : T []) (T [] value)
	{
		write !(int) (cast (int) (value.length));
		foreach (elem; value)
		{
			write !(T) (elem);
		}
	}

	auto read (T) ()
	{
		return littleEndianToNative !(T) (readBytes !(T.sizeof));
	}

	void write (T) (T value)
	{
		writeBytes (nativeToLittleEndian (value));
	}

	auto readBytes (size_t byteCount) ()
	{
		ubyte [byteCount] bytes = readBytesRuntime (byteCount);
		return bytes;
	}

	auto readBytesRuntime (size_t byteCount)
	{
		auto bytes = new ubyte [byteCount];
		size_t offset = 0;
		while (offset < byteCount)
		{
			debug (io) {writeln ("in ", offset, " ", byteCount);}
			offset += socket.receive (bytes[offset..bytes.length]);
		}
		debug (io) {writeln ("read: ", bytes);}
		return bytes;
	}

	void writeBytes (const ubyte [] bytes)
	{
		size_t offset = 0;
		while (offset < bytes.length)
		{
			auto sent = socket.send (bytes);
			enforce (sent > 0);
			offset += sent;
		}
		debug (io) {writeln ("write: ", bytes);}
	}
}

module runner;

import std.stdio;

import rpc;
import my_strategy;

import model.car;
import model.game;
import model.move;
import model.player_context;

void main (string [] args)
{
	auto host = "127.0.0.1";
	auto port = "31001";
	auto token = "0000000000000000";
	if (args.length == 4)
	{
		host = args[1];
		port = args[2];
		token = args[3];
	}

	auto client = new RemoteProcessClient (host, port);
	scope (exit) {client.close ();}

	client.writeToken (token);
	int teamSize = client.readTeamSize ();
	debug {writefln ("Team size: %d", teamSize);}
	client.writeProtocolVersion ();
	auto game = client.readGameContextMessage ();

	debug (io) {writeln ("-1"); stdout.flush ();}
	auto strategies = new MyStrategy [teamSize];
	foreach (ref strategy; strategies)
	{
		strategy = new MyStrategy ();
	}
	debug (io) {writeln ("0"); stdout.flush ();}

	while (true)
	{
		immutable PlayerContext playerContext =
		    client.readPlayerContextMessage ();
		debug (io) {writeln ("got context"); stdout.flush ();}
		if (playerContext is null)
		{
			break;
		}

		auto playerCars = playerContext.cars;
		debug (io) {writeln ("got cars"); stdout.flush ();}
		if (playerCars is null || playerCars.length != teamSize)
		{
			break;
		}

		debug (io) {writeln ("1"); stdout.flush ();}
		auto moves = new Move [teamSize];
		foreach (carIndex, ref curMove; moves)
		{
			curMove = new Move ();
			debug (io) {writeln ("2 ", carIndex); stdout.flush ();}
			strategies[playerCars[carIndex].teammateIndex]
			    .move (playerCars[carIndex],
			    playerContext.world, game, curMove);
		}
		debug (io) {writeln ("3"); stdout.flush ();}
		client.writeMovesMessage (moves);
	}
	debug (io) {writeln ("4"); stdout.flush ();}
}

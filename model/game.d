module model.game;

class Game
{
    immutable long randomSeed;
    immutable int tickCount;
    immutable int worldWidth;
    immutable int worldHeight;
    immutable double trackTileSize;
    immutable double trackTileMargin;
    immutable int lapCount;
    immutable int lapTickCount;
    immutable int initialFreezeDurationTicks;
    immutable double burningTimeDurationFactor;
    immutable int [] finishTrackScores;
    immutable int finishLapScore;
    immutable double lapWaypointsSummaryScoreFactor;
    immutable double carDamageScoreFactor;
    immutable int carEliminationScore;
    immutable double carWidth;
    immutable double carHeight;
    immutable double carEnginePowerChangePerTick;
    immutable double carWheelTurnChangePerTick;
    immutable double carAngularSpeedFactor;
    immutable double carMovementAirFrictionFactor;
    immutable double carRotationAirFrictionFactor;
    immutable double carLengthwiseMovementFrictionFactor;
    immutable double carCrosswiseMovementFrictionFactor;
    immutable double carRotationFrictionFactor;
    immutable int throwProjectileCooldownTicks;
    immutable int useNitroCooldownTicks;
    immutable int spillOilCooldownTicks;
    immutable double nitroEnginePowerFactor;
    immutable int nitroDurationTicks;
    immutable int carReactivationTimeTicks;
    immutable double buggyMass;
    immutable double buggyEngineForwardPower;
    immutable double buggyEngineRearPower;
    immutable double jeepMass;
    immutable double jeepEngineForwardPower;
    immutable double jeepEngineRearPower;
    immutable double bonusSize;
    immutable double bonusMass;
    immutable int pureScoreAmount;
    immutable double washerRadius;
    immutable double washerMass;
    immutable double washerInitialSpeed;
    immutable double washerDamage;
    immutable double sideWasherAngle;
    immutable double tireRadius;
    immutable double tireMass;
    immutable double tireInitialSpeed;
    immutable double tireDamageFactor;
    immutable double tireDisappearSpeedFactor;
    immutable double oilSlickInitialRange;
    immutable double oilSlickRadius;
    immutable int oilSlickLifetime;
    immutable int maxOiledStateDurationTicks;

    public immutable this (long randomSeed,
        int tickCount,
        int worldWidth,
        int worldHeight,
        double trackTileSize,
        double trackTileMargin,
        int lapCount,
        int lapTickCount,
        int initialFreezeDurationTicks,
        double burningTimeDurationFactor,
        int [] finishTrackScores,
        int finishLapScore,
        double lapWaypointsSummaryScoreFactor,
        double carDamageScoreFactor,
        int carEliminationScore,
        double carWidth,
        double carHeight,
        double carEnginePowerChangePerTick,
        double carWheelTurnChangePerTick,
        double carAngularSpeedFactor,
        double carMovementAirFrictionFactor,
        double carRotationAirFrictionFactor,
        double carLengthwiseMovementFrictionFactor,
        double carCrosswiseMovementFrictionFactor,
        double carRotationFrictionFactor,
        int throwProjectileCooldownTicks,
        int useNitroCooldownTicks,
        int spillOilCooldownTicks,
        double nitroEnginePowerFactor,
        int nitroDurationTicks,
        int carReactivationTimeTicks,
        double buggyMass,
        double buggyEngineForwardPower,
        double buggyEngineRearPower,
        double jeepMass,
        double jeepEngineForwardPower,
        double jeepEngineRearPower,
        double bonusSize,
        double bonusMass,
        int pureScoreAmount,
        double washerRadius,
        double washerMass,
        double washerInitialSpeed,
        double washerDamage,
        double sideWasherAngle,
        double tireRadius,
        double tireMass,
        double tireInitialSpeed,
        double tireDamageFactor,
        double tireDisappearSpeedFactor,
        double oilSlickInitialRange,
        double oilSlickRadius,
        int oilSlickLifetime,
        int maxOiledStateDurationTicks)
    {
        this.randomSeed = randomSeed;
        this.tickCount = tickCount;
        this.worldWidth = worldWidth;
        this.worldHeight = worldHeight;
        this.trackTileSize = trackTileSize;
        this.trackTileMargin = trackTileMargin;
        this.lapCount = lapCount;
        this.lapTickCount = lapTickCount;
        this.initialFreezeDurationTicks = initialFreezeDurationTicks;
        this.burningTimeDurationFactor = burningTimeDurationFactor;
        this.finishTrackScores = finishTrackScores.idup;
        this.finishLapScore = finishLapScore;
        this.lapWaypointsSummaryScoreFactor = lapWaypointsSummaryScoreFactor;
        this.carDamageScoreFactor = carDamageScoreFactor;
        this.carEliminationScore = carEliminationScore;
        this.carWidth = carWidth;
        this.carHeight = carHeight;
        this.carEnginePowerChangePerTick = carEnginePowerChangePerTick;
        this.carWheelTurnChangePerTick = carWheelTurnChangePerTick;
        this.carAngularSpeedFactor = carAngularSpeedFactor;
        this.carMovementAirFrictionFactor = carMovementAirFrictionFactor;
        this.carRotationAirFrictionFactor = carRotationAirFrictionFactor;
        this.carLengthwiseMovementFrictionFactor = carLengthwiseMovementFrictionFactor;
        this.carCrosswiseMovementFrictionFactor = carCrosswiseMovementFrictionFactor;
        this.carRotationFrictionFactor = carRotationFrictionFactor;
        this.throwProjectileCooldownTicks = throwProjectileCooldownTicks;
        this.useNitroCooldownTicks = useNitroCooldownTicks;
        this.spillOilCooldownTicks = spillOilCooldownTicks;
        this.nitroEnginePowerFactor = nitroEnginePowerFactor;
        this.nitroDurationTicks = nitroDurationTicks;
        this.carReactivationTimeTicks = carReactivationTimeTicks;
        this.buggyMass = buggyMass;
        this.buggyEngineForwardPower = buggyEngineForwardPower;
        this.buggyEngineRearPower = buggyEngineRearPower;
        this.jeepMass = jeepMass;
        this.jeepEngineForwardPower = jeepEngineForwardPower;
        this.jeepEngineRearPower = jeepEngineRearPower;
        this.bonusSize = bonusSize;
        this.bonusMass = bonusMass;
        this.pureScoreAmount = pureScoreAmount;
        this.washerRadius = washerRadius;
        this.washerMass = washerMass;
        this.washerInitialSpeed = washerInitialSpeed;
        this.washerDamage = washerDamage;
        this.sideWasherAngle = sideWasherAngle;
        this.tireRadius = tireRadius;
        this.tireMass = tireMass;
        this.tireInitialSpeed = tireInitialSpeed;
        this.tireDamageFactor = tireDamageFactor;
        this.tireDisappearSpeedFactor = tireDisappearSpeedFactor;
        this.oilSlickInitialRange = oilSlickInitialRange;
        this.oilSlickRadius = oilSlickRadius;
        this.oilSlickLifetime = oilSlickLifetime;
        this.maxOiledStateDurationTicks = maxOiledStateDurationTicks;
    }
}

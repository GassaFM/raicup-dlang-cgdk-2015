module model.player;

class Player
{
    immutable long id;
    immutable bool isMe;
    immutable string name;
    immutable bool isStrategyCrashed;
    immutable int score;

    public immutable this (long id,
        bool isMe,
        string name,
        bool isStrategyCrashed,
        int score)
    {
        this.id = id;
        this.isMe = isMe;
        this.name = name;
        this.isStrategyCrashed = isStrategyCrashed;
        this.score = score;
    }
}

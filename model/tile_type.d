module model.tile_type;

enum TileType : byte
{
	Empty,
	Vertical,
	Horizontal,
	LeftTopCorner,
	RightTopCorner,
	LeftBottomCorner,
	RightBottomCorner,
	LeftHeadedT,
	RightHeadedT,
	TopHeadedT,
	BottomHeadedT,
	Crossroads,
	Unknown
}

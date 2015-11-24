module model.tile_type;

enum TileType : byte
{
    empty,
    vertical,
    horizontal,
    leftTopCorner,
    rightTopCorner,
    leftBottomCorner,
    rightBottomCorner,
    leftHeadedT,
    rightHeadedT,
    topHeadedT,
    bottomHeadedT,
    crossroads,
    unknown
}

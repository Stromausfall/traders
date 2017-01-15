package net.matthiasauer.utils.hexmap;

/**
 * @author 
 */
interface IOffsetCoordinate 
{
	var row(default, null) : Int;
	var column(default, null) : Int;
	var orientation(default, null) : HexagonOrientation;
}
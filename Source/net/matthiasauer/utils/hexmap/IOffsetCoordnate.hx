package net.matthiasauer.utils.hexmap;

/**
 * @author 
 */
interface IOffsetCoordnate 
{
	var row(default, null) : Int;
	var column(default, null) : Int;
	var orientation(default, null) : HexagonOrientation;
}
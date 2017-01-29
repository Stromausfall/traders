package net.matthiasauer.traders.view;
import haxe.Int64;
import net.matthiasauer.utils.hexmap.IOffsetCoordinate;

interface IGui 
{
	function createElement(data:GUIData, coordinate:IOffsetCoordinate) : Int64;
}
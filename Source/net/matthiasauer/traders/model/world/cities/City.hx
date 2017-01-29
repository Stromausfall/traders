package net.matthiasauer.traders.model.world.cities;
import haxe.Int64;
import net.matthiasauer.traders.persistence.data.CitiesElementData;
import net.matthiasauer.traders.view.GUIData;
import net.matthiasauer.traders.view.IGui;
import net.matthiasauer.utils.hexmap.IOffsetCoordinate;

/**
 * ...
 * @author ...
 */
class City implements ICity
{
	public var name(default, null):String;
	private var guiId:Int64;

	public function new(gui:IGui, data:CitiesElementData, coordinate:IOffsetCoordinate) 
	{
		this.name = data.name;
		
		// create a gui element and then store the id to it
		this.guiId = gui.createElement(GUIData.City, coordinate);
	}
}
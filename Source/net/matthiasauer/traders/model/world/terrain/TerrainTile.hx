package net.matthiasauer.traders.model.world.terrain;
import haxe.Int64;
import net.matthiasauer.traders.view.GUIData;
import net.matthiasauer.traders.view.IGui;
import net.matthiasauer.utils.hexmap.IOffsetCoordinate;

/**
 * ...
 * @author 
 */
class TerrainTile 
{
	public var type(default, null):TerrainType;
	private var guiId:Int64;

	public function new(gui:IGui, type:TerrainType, coordinate:IOffsetCoordinate) 
	{
		this.type = type;
		
		// create the element in the gui
		var guiData:GUIData = get(this.type);
		
		// create a gui element and then store the id to it
		this.guiId = gui.createElement(guiData, coordinate);
	}
	
	private static function get(terrainType:TerrainType) : GUIData {
		switch (terrainType) {
			case TerrainType.Grassland:
				return GUIData.Grass;
			case TerrainType.Mountain:
				return GUIData.Mountain;
		}
	}
}
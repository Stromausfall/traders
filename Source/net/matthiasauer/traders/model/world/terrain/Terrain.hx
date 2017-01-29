package net.matthiasauer.traders.model.world.terrain;

import net.matthiasauer.traders.persistence.data.TerrainElementData;
import net.matthiasauer.traders.view.IGui;
import net.matthiasauer.utils.hexmap.Coordinate;
import net.matthiasauer.utils.hexmap.CoordinateMap;
import net.matthiasauer.utils.general.Pair;
import net.matthiasauer.utils.hexmap.HexagonOrientation;

/**
 * ...
 * @author 
 */
class Terrain implements ITerrain
{
	private var map:CoordinateMap<TerrainTile>;
	private var gui:IGui;

	public function new(gui:IGui, terrainData:Array<TerrainElementData>, orientation:HexagonOrientation) 
	{
		this.map = new CoordinateMap<TerrainTile>();
		this.gui = gui;
		
		this.initialize(terrainData, orientation);
	}
	
	private function initialize(terrainData:Array<TerrainElementData>, orientation:HexagonOrientation) : Void {
		for (element in terrainData) {
			var coordinate:Coordinate = Coordinate.fromOffset(element.column, element.row, orientation);
			var terrainTile:TerrainTile = new TerrainTile(this.gui, TerrainType.createByName(element.type), coordinate);
			
			this.map.set(coordinate, terrainTile);
		}
	}
	
	public function get(coordinate:Coordinate) : TerrainTile {
		return this.map.get(coordinate);
	}
	
	public function entries() : Array<Pair<Coordinate, TerrainTile>> {
		return this.map.entries();
	}
}
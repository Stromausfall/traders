package net.matthiasauer.traders.model.world.terrain;

import net.matthiasauer.traders.persistence.data.TerrainElementData;
import net.matthiasauer.traders.utils.hexmap.Coordinate;
import net.matthiasauer.traders.utils.hexmap.CoordinateMap;
import net.matthiasauer.traders.utils.hexmap.HexagonOrientation;

/**
 * ...
 * @author 
 */
class Terrain 
{
	private var map:CoordinateMap<TerrainType>;

	public function new(terrainData:Array<TerrainElementData>, orientation:HexagonOrientation) 
	{
		this.map = new CoordinateMap<TerrainType>();
		
		this.initialize(terrainData, orientation);
	}
	
	private function initialize(terrainData:Array<TerrainElementData>, orientation:HexagonOrientation) : Void {
		for (element in terrainData) {
			var coordinates:Coordinate = Coordinate.fromOffset(element.column, element.row, orientation);
			var terrainType:TerrainType = TerrainType.createByName(element.type);
			
			this.map.set(coordinates, terrainType);
		}
	}
	
	public function get(coordinate:Coordinate) : TerrainType {
		return this.map.get(coordinate);
	}
	
	public function entries() : Array<CoordinateMapPair<TerrainType>> {
		return this.map.entries();
	}
}
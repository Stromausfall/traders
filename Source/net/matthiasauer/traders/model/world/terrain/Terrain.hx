package net.matthiasauer.traders.model.world.terrain;
import net.matthiasauer.traders.persistence.data.TerrainElementData;
import net.matthiasauer.traders.utils.hexmap.Coordinate;
import net.matthiasauer.traders.utils.hexmap.HexagonOrientation;

/**
 * ...
 * @author 
 */
class Terrain 
{

	public function new(terrainData:Array<TerrainElementData>, orientation:HexagonOrientation) 
	{
		
	}
	
	public function get(coordinate:Coordinate) : TerrainType {
		return TerrainType.Mountain;
	}
	
	/*
	WAIT the hash for coordinates must be better and unique - only use x and y of the coordinates (as z is a composite of both).....
	
	--> alternative a multi hierarchical hash map -->  first x  then y (then z)   -->   map[x][y][z] 
	--> create the multi hierarchical coordinate hashmap !*/
}
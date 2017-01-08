package net.matthiasauer.traders.model.world.terrain;
import net.matthiasauer.utils.hexmap.Coordinate;
import net.matthiasauer.utils.general.Pair;

/**
 * @author 
 */
interface ITerrain 
{
	function get(coordinate:Coordinate) : TerrainType;
	
	function entries() : Array<Pair<Coordinate, TerrainType>>;
}
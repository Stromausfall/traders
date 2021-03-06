package net.matthiasauer.traders.model.world.terrain;
import net.matthiasauer.utils.general.Pair;
import net.matthiasauer.utils.hexmap.Coordinate;

/**
 * @author 
 */
interface ITerrain 
{
	function get(coordinate:Coordinate) : TerrainTile;
	
	function entries() : Array<Pair<Coordinate, TerrainTile>>;
}
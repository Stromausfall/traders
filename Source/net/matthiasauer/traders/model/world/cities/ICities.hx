package net.matthiasauer.traders.model.world.cities;

import net.matthiasauer.utils.general.Pair;
import net.matthiasauer.utils.hexmap.Coordinate;

/**
 * @author 
 */
interface ICities 
{
	function get(coordinate:Coordinate) : City;
	
	function entries() : Array<Pair<Coordinate, City>>;
}
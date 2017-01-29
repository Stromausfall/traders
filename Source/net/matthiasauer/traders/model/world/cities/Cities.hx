package net.matthiasauer.traders.model.world.cities;
import net.matthiasauer.traders.view.IGui;
import net.matthiasauer.utils.general.Pair;
import net.matthiasauer.utils.hexmap.Coordinate;
import net.matthiasauer.utils.hexmap.CoordinateMap;
import net.matthiasauer.utils.hexmap.HexagonOrientation;
import net.matthiasauer.traders.persistence.data.CitiesElementData;

/**
 * ...
 * @author ...
 */
class Cities implements ICities
{
	private var map:CoordinateMap<City>;
	private var gui:IGui;

	public function new(gui:IGui, citiesData:Array<CitiesElementData>, orientation:HexagonOrientation) 
	{
		this.gui = gui;
		this.map = new CoordinateMap<City>();
		
		this.initialize(citiesData, orientation);
	}
	
	private function initialize(citiesData:Array<CitiesElementData>, orientation:HexagonOrientation) : Void {
		for (element in citiesData) {
			var coordinate:Coordinate = Coordinate.fromOffset(element.column, element.row, orientation);
			var city:City = new City(gui, element, coordinate);
			
			this.map.set(coordinate, city);
		}
	}
	
	public function get(coordinate:Coordinate) : City {
		return this.map.get(coordinate);
	}
	
	public function entries() : Array<Pair<Coordinate, City>> {
		return this.map.entries();
	}
}
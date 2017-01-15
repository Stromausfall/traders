package net.matthiasauer.traders.model.world.cities;

import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import net.matthiasauer.traders.persistence.data.WorldData;
import net.matthiasauer.traders.persistence.data.CitiesElementData;
import net.matthiasauer.utils.general.Pair;
import net.matthiasauer.utils.hexmap.Coordinate;
import net.matthiasauer.utils.hexmap.HexagonOrientation;
import org.hamcrest.Matchers;
using mockatoo.Mockatoo;

/**
 * ...
 * @author ...
 */
class CitiesTest extends TestCase
{
	public function testGetCity() {
		// GIVEN:
		var citiesData:Array<CitiesElementData> = [
			{ column: -1, row:5, name:"Name#1" },
			{ column:3, row:2, name:"Name#2" }
		];
		var orientation:HexagonOrientation = HexagonOrientation.Horizontal;
		var expectedCoordinated1:Coordinate = Coordinate.fromOffset(citiesData[0].column, citiesData[0].row, orientation);
		var expectedCoordinated2:Coordinate = Coordinate.fromOffset(citiesData[1].column, citiesData[1].row, orientation);

		// WHEN:
		var cities:Cities = new Cities(citiesData, orientation);
		
		// THEN:
		assertEquals("Name#1", cities.get(expectedCoordinated1).name);
		assertEquals("Name#2", cities.get(expectedCoordinated2).name);
	}
	
	public function testGetEntries() {
		// GIVEN:
		var citiesData:Array<CitiesElementData> = [
			{ column: -1, row:5, name:"Name#1" },
			{ column:3, row:2, name:"Name#2" }
		];
		var orientation:HexagonOrientation = HexagonOrientation.Horizontal;
		var expectedCoordinated1:Coordinate = Coordinate.fromOffset(citiesData[0].column, citiesData[0].row, orientation);
		var expectedCoordinated2:Coordinate = Coordinate.fromOffset(citiesData[1].column, citiesData[1].row, orientation);
		var cities:Cities = new Cities(citiesData, orientation);

		// WHEN:
		var entries:Array<Pair<Coordinate, City>> = cities.entries();
		
		// THEN:
		assertEquals(2, entries.length);
	}
}
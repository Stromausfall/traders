package net.matthiasauer.traders.model.world.cities;

import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import net.matthiasauer.traders.persistence.data.WorldData;
import net.matthiasauer.traders.persistence.data.CitiesElementData;
import net.matthiasauer.traders.view.GUIData;
import net.matthiasauer.traders.view.IGui;
import net.matthiasauer.utils.general.Pair;
import net.matthiasauer.utils.hexmap.Coordinate;
import net.matthiasauer.utils.hexmap.HexagonOrientation;
import net.matthiasauer.utils.hexmap.IOffsetCoordinate;
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
		var mockedGUI:IGui = Mockatoo.mock(IGui);
		var orientation:HexagonOrientation = HexagonOrientation.Horizontal;
		var expectedCoordinated1:Coordinate = Coordinate.fromOffset(citiesData[0].column, citiesData[0].row, orientation);
		var expectedCoordinated2:Coordinate = Coordinate.fromOffset(citiesData[1].column, citiesData[1].row, orientation);

		// WHEN:
		var cities:Cities = new Cities(mockedGUI, citiesData, orientation);
		
		// THEN:
		assertEquals("Name#1", cities.get(expectedCoordinated1).name);
		assertEquals("Name#2", cities.get(expectedCoordinated2).name);
	}
	
	public function testThatTheGuiIsCalled() {
		// GIVEN:
		var citiesData:Array<CitiesElementData> = [
			{ column: -1, row:5, name:"Name#1" },
			{ column:3, row:2, name:"Name#2" }
		];
		var mockedGUI = Mockatoo.mock(IGui);
		var orientation:HexagonOrientation = HexagonOrientation.Horizontal;
		var expectedCoordinated1:Coordinate = Coordinate.fromOffset(citiesData[0].column, citiesData[0].row, orientation);
		var expectedCoordinated2:Coordinate = Coordinate.fromOffset(citiesData[1].column, citiesData[1].row, orientation);

		// WHEN:
		var cities:Cities = new Cities(mockedGUI, citiesData, orientation);
		
		// THEN:
		mockedGUI.createElement(cast any, cast any).verify(2);
		assertTrue(true);
	}
	
	public function testGetEntries() {
		// GIVEN:
		var citiesData:Array<CitiesElementData> = [
			{ column: -1, row:5, name:"Name#1" },
			{ column:3, row:2, name:"Name#2" }
		];
		var mockedGUI:IGui = Mockatoo.mock(IGui);
		var orientation:HexagonOrientation = HexagonOrientation.Horizontal;
		var expectedCoordinated1:Coordinate = Coordinate.fromOffset(citiesData[0].column, citiesData[0].row, orientation);
		var expectedCoordinated2:Coordinate = Coordinate.fromOffset(citiesData[1].column, citiesData[1].row, orientation);
		var cities:Cities = new Cities(mockedGUI, citiesData, orientation);

		// WHEN:
		var entries:Array<Pair<Coordinate, City>> = cities.entries();
		
		// THEN:
		assertEquals(2, entries.length);
	}
}
package net.matthiasauer.utils.hexmap;

import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import net.matthiasauer.utils.hexmap.Coordinate;
import net.matthiasauer.utils.general.Pair;
import net.matthiasauer.utils.hexmap.HexagonOrientation;
import org.hamcrest.Matchers;
using mockatoo.Mockatoo;

class CoordinateMapTest extends TestCase
{
	public function testGetReturnsNullIfNoEntry() {
		// GIVEN:
		var coord1:Coordinate = Coordinate.fromOffset(2, 3, HexagonOrientation.Horizontal);
		var map:CoordinateMap<String> = new CoordinateMap<String>();
		
		// WHEN:
		var result:String = map.get(coord1);
		
		// THEN:
		assertEquals(null, result);		
	}
	
	public function testPutGetForMultiple() {
		// GIVEN:
		var coord1:Coordinate = Coordinate.fromOffset(2, 3, HexagonOrientation.Horizontal);
		var coord2:Coordinate = Coordinate.fromOffset(2, 1, HexagonOrientation.Horizontal);
		var coord3:Coordinate = Coordinate.fromOffset(1, 3, HexagonOrientation.Horizontal);
		var value1:String = "foo1";
		var value2:String = "foo12";
		var value3:String = "foo123";
		var map:CoordinateMap<String> = new CoordinateMap<String>();
		
		// WHEN:
		map.set(coord1, value1);
		map.set(coord2, value2);
		map.set(coord3, value3);
		
		// THEN:
		assertEquals(value1, map.get(coord1));
		assertEquals(value2, map.get(coord2));
		assertEquals(value3, map.get(coord3));
	}
	
	public function testGetEntries() {
		// GIVEN:
		var coord1:Coordinate = Coordinate.fromOffset(2, 3, HexagonOrientation.Horizontal);
		var coord2:Coordinate = Coordinate.fromOffset(2, 1, HexagonOrientation.Horizontal);
		var coord3:Coordinate = Coordinate.fromOffset(1, 3, HexagonOrientation.Horizontal);
		var value1:String = "foo1";
		var value2:String = "foo12";
		var value3:String = "foo123";
		var map:CoordinateMap<String> = new CoordinateMap<String>();
		map.set(coord1, value1);
		map.set(coord2, value2);
		map.set(coord3, value3);
		
		// WHEN:
		var entries:Array<Pair<Coordinate, String>> = map.entries();
		
		// THEN:
		assertEquals(3, entries.length);
	}
	
	public function testThatTheResultOfEntriesCanBeChangedWithoutEffectOnTheMap() {
		// GIVEN:
		var coord1:Coordinate = Coordinate.fromOffset(2, 3, HexagonOrientation.Horizontal);
		var coord2:Coordinate = Coordinate.fromOffset(2, 1, HexagonOrientation.Horizontal);
		var value1:String = "foo1";
		var value2:String = "foo12";
		var map:CoordinateMap<String> = new CoordinateMap<String>();
		map.set(coord1, value1);
		map.set(coord2, value2);
		
		// WHEN:
		map.entries().pop();
		var entries:Array<Pair<Coordinate, String>> = map.entries();
		
		// THEN:
		assertEquals(2, entries.length);
	}
	
	public function testThatRemoveElementWorks() {
		// GIVEN:
		var coord1:Coordinate = Coordinate.fromOffset(2, 3, HexagonOrientation.Horizontal);
		var coord2:Coordinate = Coordinate.fromOffset(2, 1, HexagonOrientation.Horizontal);
		var value1:String = "foo1";
		var value2:String = "foo12";
		var map:CoordinateMap<String> = new CoordinateMap<String>();
		map.set(coord1, value1);
		map.set(coord2, value2);
		
		// WHEN:
		map.remove(coord1);
		
		// THEN:
		assertEquals(1, map.entries().length);
		assertEquals(null, map.get(coord1));
		assertEquals(value2, map.get(coord2));
	}
	
	public function testThatRemoveElementWorksWhenRemovingYMap() {
		// GIVEN:
		var coord1:Coordinate = Coordinate.fromOffset(2, 3, HexagonOrientation.Horizontal);
		var value1:String = "foo1";
		var map:CoordinateMap<String> = new CoordinateMap<String>();
		map.set(coord1, value1);
		
		// WHEN:
		map.remove(coord1);
		
		// THEN:
		assertEquals(0, map.entries().length);
		assertEquals(null, map.get(coord1));
	}
}
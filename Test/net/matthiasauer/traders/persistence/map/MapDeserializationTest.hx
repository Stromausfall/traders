package net.matthiasauer.traders.persistence.map;

import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import org.hamcrest.Matchers;
using mockatoo.Mockatoo;

class MapDeserializationTest extends TestCase
{
	public function testConstructor() {
		// GIVEN:
		var assetId:String = "test.json";
		var testData:String = '{"map":{"orientation":"Horizontal","terrain":[{"column":3,"row":-1,"type":"Grassland"}]}}';
		var mockedDataAccess:IDataAccess = Mockatoo.mock(IDataAccess);
		mockedDataAccess.getString(assetId).returns(testData);
		var serializer:ISerializer = new JSONSerializer(mockedDataAccess);
		
		// WHEN:
		var deserialized = serializer.deserialize(assetId);
		
		// THEN:
		assertEquals("Horizontal", deserialized.map.orientation);
		assertEquals(1, deserialized.map.terrain.length);
		assertEquals(3, deserialized.map.terrain[0].column);
		assertEquals(-1, deserialized.map.terrain[0].row);
		assertEquals("Grassland", deserialized.map.terrain[0].type);
	}
}
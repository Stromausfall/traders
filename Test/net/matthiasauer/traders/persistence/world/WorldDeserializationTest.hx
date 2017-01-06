package net.matthiasauer.traders.persistence.world;

import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import org.hamcrest.Matchers;
using mockatoo.Mockatoo;

class WorldDeserializationTest extends TestCase
{
	public function testConstructor() {
		// GIVEN:
		var assetId:String = "test.json";
		var testData:String = '{"world":{"orientation":"Horizontal","terrain":[{"column":3,"row":-1,"type":"Grassland"}]}}';
		var mockedDataAccess:IDataAccess = Mockatoo.mock(IDataAccess);
		mockedDataAccess.getString(assetId).returns(testData);
		var serializer:ISerializer = new JSONSerializer(mockedDataAccess);
		
		// WHEN:
		var deserialized = serializer.deserialize(assetId);
		
		// THEN:
		assertEquals("Horizontal", deserialized.world.orientation);
		assertEquals(1, deserialized.world.terrain.length);
		assertEquals(3, deserialized.world.terrain[0].column);
		assertEquals(-1, deserialized.world.terrain[0].row);
		assertEquals("Grassland", deserialized.world.terrain[0].type);
	}
}
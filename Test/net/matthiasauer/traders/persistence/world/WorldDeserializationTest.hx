package net.matthiasauer.traders.persistence.world;

import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import net.matthiasauer.traders.persistence.data.GameData;
import org.hamcrest.Matchers;
using mockatoo.Mockatoo;

class WorldDeserializationTest extends TestCase
{
	public function testWorld() {
		// GIVEN:
		var assetId:String = "test.json";
		var testData:String = '{"world":{"orientation":"Horizontal","terrain":[{"column":3,"row":-1,"type":"Grassland"}]}}';
		var mockedDataAccess:IDataAccess = Mockatoo.mock(IDataAccess);
		mockedDataAccess.getString(assetId).returns(testData);
		var serializer:ISerializer = new JSONSerializer(mockedDataAccess);
		
		// WHEN:
		var deserialized:GameData = serializer.deserialize(assetId);
		
		// THEN:
		assertEquals("Horizontal", deserialized.world.orientation);
	}
	
	public function testTerrain() {
		// GIVEN:
		var assetId:String = "test.json";
		var testData:String = '{"world":{"orientation":"Horizontal","terrain":[{"column":3,"row":-1,"type":"Grassland"}]}}';
		var mockedDataAccess:IDataAccess = Mockatoo.mock(IDataAccess);
		mockedDataAccess.getString(assetId).returns(testData);
		var serializer:ISerializer = new JSONSerializer(mockedDataAccess);
		
		// WHEN:
		var deserialized:GameData = serializer.deserialize(assetId);
		
		// THEN:
		assertEquals(1, deserialized.world.terrain.length);
		assertEquals(3, deserialized.world.terrain[0].column);
		assertEquals(-1, deserialized.world.terrain[0].row);
		assertEquals("Grassland", deserialized.world.terrain[0].type);
	}
	
	public function testCities() {
		// GIVEN:
		var assetId:String = "test.json";
		var testData:String = '{"world":{"orientation":"Horizontal","cities":[{"column":3,"row":-1,"name":"The Big City #1"}]}}';
		var mockedDataAccess:IDataAccess = Mockatoo.mock(IDataAccess);
		mockedDataAccess.getString(assetId).returns(testData);
		var serializer:ISerializer = new JSONSerializer(mockedDataAccess);
		
		// WHEN:
		var deserialized:GameData = serializer.deserialize(assetId);
		
		// THEN:
		assertEquals(1, deserialized.world.cities.length);
		assertEquals(3, deserialized.world.cities[0].column);
		assertEquals(-1, deserialized.world.cities[0].row);
		assertEquals("The Big City #1", deserialized.world.cities[0].name);
	}
}
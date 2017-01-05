package net.matthiasauer.traders.persistence;

import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import org.hamcrest.Matchers;
using mockatoo.Mockatoo;

class DeserializationTest extends TestCase
{
	public function testConstructor() {
		// GIVEN:
		var assetId:String = "test.json";
		var testData:String = '{"name":"testMap"}';
		var mockedDataAccess:IDataAccess = Mockatoo.mock(IDataAccess);
		mockedDataAccess.getString(assetId).returns(testData);
		var serializer:ISerializer = new JSONSerializer(mockedDataAccess);
		
		// WHEN:
		var deserialized = serializer.deserialize(assetId);
		
		// THEN:
		assertEquals("testMap", deserialized.name);
	}
}
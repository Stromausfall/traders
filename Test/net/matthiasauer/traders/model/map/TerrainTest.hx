package net.matthiasauer.traders.model.map;

import haxe.Json;
import haxe.unit.TestCase;
import net.matthiasauer.traders.utils.hexmap.HexagonOrientation;
import openfl.Assets;
import openfl.Lib;
import org.hamcrest.Matchers.*;

typedef TerrainElement = {
	var column:Int;
	var row:Int;
	var orientation:String;
	var type:String;
}

typedef Content = {
	var terrain:Array<TerrainElement>;
}

class TerrainTest extends TestCase
{
    public function testFoo() {
		
		var text:String = Assets.getText("assets/map.json");
		var data:Content = Json.parse(text);
		
		for (element in data.terrain) {
			Lib.trace(element.orientation + " - " + (element.orientation == "Vertical"));
		}
		
		Lib.trace("===============");
		Lib.trace(data);
		Lib.trace("===============");
		
		assertTrue(true);
    }
	
}
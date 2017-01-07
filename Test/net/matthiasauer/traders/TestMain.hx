package net.matthiasauer.traders;

import haxe.unit.TestRunner;
import net.matthiasauer.traders.model.world.terrain.TerrainTest;
import net.matthiasauer.traders.persistence.DeserializationTest;
import net.matthiasauer.traders.persistence.world.WorldDeserializationTest;
import net.matthiasauer.traders.utils.hexmap.CoordinateConverterTest;
import net.matthiasauer.traders.utils.hexmap.CoordinateMapTest;
import net.matthiasauer.traders.utils.hexmap.CoordinateTest;
import net.matthiasauer.traders.model.world.WorldTest;


class TestMain {
	public static function main() {
		var testRunner = new TestRunner();
		
		////// persistence
		testRunner.add(new DeserializationTest());
		// map
		testRunner.add(new WorldDeserializationTest());
		
		////// model
		// world
		testRunner.add(new WorldTest());
		//testRunner.add(new TerrainTest());
		
		////// utils		
		// hexmap
		testRunner.add(new CoordinateConverterTest());
		testRunner.add(new CoordinateTest());
		testRunner.add(new CoordinateMapTest());
		
		// run the tests
		testRunner.run();
		
		// close
		Sys.exit(0);
	}
}
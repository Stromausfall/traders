package net.matthiasauer.traders;

import haxe.unit.TestRunner;
import net.matthiasauer.traders.model.world.cities.CitiesTest;
import net.matthiasauer.traders.model.world.terrain.TerrainTest;
import net.matthiasauer.traders.persistence.DeserializationTest;
import net.matthiasauer.traders.persistence.world.WorldDeserializationTest;
import net.matthiasauer.traders.model.world.WorldTest;
import net.matthiasauer.traders.view.IDGeneratorTest;
import net.matthiasauer.utils.general.ArrayUtilsTest;
import net.matthiasauer.utils.hexmap.CoordinateConverterTest;
import net.matthiasauer.utils.hexmap.CoordinateMapTest;
import net.matthiasauer.utils.hexmap.CoordinateTest;
import net.matthiasauer.utils.observer.GenericObservableTest;
import net.matthiasauer.utils.observer.SimpleObservableTest;


class TestMain {
	public static function main() {
		var testRunner = new TestRunner();
		
		////// view
		testRunner.add(new IDGeneratorTest());
		
		////// persistence
		testRunner.add(new DeserializationTest());
		// map
		testRunner.add(new WorldDeserializationTest());
		
		////// model
		// world
		testRunner.add(new WorldTest());
		testRunner.add(new TerrainTest());
		testRunner.add(new CitiesTest());
		
		////// utils		
		// hexmap
		testRunner.add(new CoordinateConverterTest());
		testRunner.add(new CoordinateTest());
		testRunner.add(new CoordinateMapTest());
		
		// observer
		testRunner.add(new GenericObservableTest());
		testRunner.add(new SimpleObservableTest());
		
		// general
		testRunner.add(new ArrayUtilsTest());
		
		////// run the tests
		testRunner.run();
		
		// close
		Sys.exit(0);
	}
}
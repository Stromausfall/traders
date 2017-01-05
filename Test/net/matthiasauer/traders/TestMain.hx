package net.matthiasauer.traders;

import haxe.unit.TestRunner;
import net.matthiasauer.traders.persistence.DeserializationTest;
import net.matthiasauer.traders.utils.hexmap.CoordinateConverterTest;
import net.matthiasauer.traders.utils.hexmap.CoordinateTest;


class TestMain {
	public static function main() {
		var testRunner = new TestRunner();
		
		////// persistence
		testRunner.add(new DeserializationTest());
				
		////// utils		
		// hexmap
		testRunner.add(new CoordinateConverterTest());
		testRunner.add(new CoordinateTest());
		
		// run the tests
		testRunner.run();
		
		// close
		Sys.exit(0);
	}
}
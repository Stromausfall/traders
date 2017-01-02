package;
import haxe.unit.TestRunner;
import net.matthiasauer.utils.hexmap.CoordinateConverterTest;
import net.matthiasauer.utils.hexmap.CoordinateTest;


class TestMain {
	public static function main() {
		var testRunner = new TestRunner();
		
		////// utils		
		// hexmap
		testRunner.add(new CoordinateConverterTest());
		testRunner.add(new CoordinateTest());
		
		testRunner.run();
		
		// close
		Sys.exit(0);
	}
}
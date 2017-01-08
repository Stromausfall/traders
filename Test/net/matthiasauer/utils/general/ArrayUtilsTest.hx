package net.matthiasauer.utils.general;

import haxe.ds.HashMap;
import haxe.ds.IntMap;
import haxe.Constraints.IMap;
import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import org.hamcrest.Matchers;
using mockatoo.Mockatoo;

class ArrayUtilsTest extends TestCase
{
	public function testTransformArray() {
		// GIVEN:
		var values:Array<IntMap<String>> = [
			new IntMap<String>(),
			new IntMap<String>()
		];
		var transformFun:IntMap<String> -> IMap<Int, String> = function(x) return x;
		
		// WHEN:
		var transformed:Array<haxe.Constraints.IMap<Int, String>> = ArrayUtils.transform(values, transformFun);
		
		// THEN:
		for (value in transformed) {
			value.set(9, "asdf");
		}
		assertEquals(2, transformed.length);
	}
}
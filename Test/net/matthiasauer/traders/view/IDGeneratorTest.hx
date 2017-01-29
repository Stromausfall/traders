package net.matthiasauer.traders.view;

import haxe.Int64;
import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import org.hamcrest.Matchers;
using mockatoo.Mockatoo;

class IDGeneratorTest extends TestCase
{
	public function testEntries() {
		// GIVEN:
		var generator:IDGenerator = new IDGenerator();
		
		// WHEN:
		var first:Int64 = generator.getNext();
		var second:Int64 = generator.getNext();
		var third:Int64 = generator.getNext();
		var fourth:Int64 = generator.getNext();
		var fifth:Int64 = generator.getNext();
		
		// THEN:
		assertEquals(true, Int64.eq(Int64.fromFloat(1), first));
		assertEquals(true, Int64.eq(Int64.fromFloat(2), second));
		assertEquals(true, Int64.eq(Int64.fromFloat(3), third));
		assertEquals(true, Int64.eq(Int64.fromFloat(4), fourth));
		assertEquals(true, Int64.eq(Int64.fromFloat(5), fifth));
	}
	
	
}
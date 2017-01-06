package net.matthiasauer.traders.model.world;

import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import net.matthiasauer.traders.persistence.data.WorldData;
import net.matthiasauer.traders.utils.hexmap.HexagonOrientation;
import org.hamcrest.Matchers;
using mockatoo.Mockatoo;

class WorldTest extends TestCase
{
	public function testConstructorForOrientation() {
		// GIVEN:
		var worldData:WorldData = {
			orientation:"Horizontal",
			terrain:[]
		}
		
		// WHEN:
		var world:World = new World(worldData);
		
		// THEN:
		assertEquals(HexagonOrientation.Horizontal, world.orientation);
	}
}
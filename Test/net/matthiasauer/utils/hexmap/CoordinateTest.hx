package net.matthiasauer.utils.hexmap;

import haxe.unit.TestCase;
import org.hamcrest.Matchers.*;

class CoordinateTest extends TestCase 
{
	public function testConstructor() {
		// GIVEN:
		var x:Int = 2;
		var y:Int = 3;
		var z:Int = -5;
		
		// WHEN:
		var coordinates:Coordinate = new Coordinate(x, y, z);
		
		// THEN:
		assertThat(coordinates.x, equalTo(x));
		assertThat(coordinates.y, equalTo(y));
		assertThat(coordinates.z, equalTo(z));
		assertTrue(true);
	}
	
	public function testConstructorOffsetHorizontal() {
		// GIVEN:
		var expectedX:Int = 2;
		var expectedY:Int = 3;
		var expectedZ:Int = -5;
		var row:Int = -5;
		var column:Int = -1;
		
		// WHEN:
		var coordinates:Coordinate = Coordinate.fromOffset(column, row, HexagonOrientation.Horizontal);
		
		// THEN:
		assertThat(coordinates.x, equalTo(expectedX));
		assertThat(coordinates.y, equalTo(expectedY));
		assertThat(coordinates.z, equalTo(expectedZ));
		assertTrue(true);
	}
	
	public function testConstructorOffsetVertical() {
		// GIVEN:
		var expectedX:Int = 2;
		var expectedY:Int = 3;
		var expectedZ:Int = -5;
		var row:Int = -5;
		var column:Int = -1;
		
		// WHEN:
		var coordinates:Coordinate = Coordinate.fromOffset(column, row, HexagonOrientation.Vertical);
		
		// THEN:
		assertThat(coordinates.x, equalTo(expectedX));
		assertThat(coordinates.y, equalTo(expectedY));
		assertThat(coordinates.z, equalTo(expectedZ));
		assertTrue(true);
	}
	
	public function testAdd() {
		// GIVEN:
		var c1:Coordinate = new Coordinate(1, 2, -3);
		var c2:Coordinate = new Coordinate( -3, 5, -2);
		var expected:Coordinate = new Coordinate( -2, 7, -5);
		
		// WHEN:
		var result:Coordinate = c1.add(c2);
		
		// THEN:
		assertThat(result.x, equalTo(expected.x));
		assertThat(result.y, equalTo(expected.y));
		assertThat(result.z, equalTo(expected.z));
		assertTrue(true);
	}
	
	public function testHashCode() {
		// GIVEN:
		var c1:Coordinate = new Coordinate(1, 2, -3);
		var c2:Coordinate = new Coordinate(1, 2, -3);
		var f1:Coordinate = new Coordinate(1, 2, -2);
		var f2:Coordinate = new Coordinate(1, 3, -3);
		var f3:Coordinate = new Coordinate(2, 2, -3);
		
		// WHEN:
		var c1HashCode = c1.hashCode();
		var c2HashCode = c2.hashCode();
		var f1HashCode = f1.hashCode();
		var f2HashCode = f2.hashCode();
		var f3HashCode = f3.hashCode();
		
		// THEN:
		assertTrue(c1HashCode == c2HashCode);
		assertTrue(c1HashCode != f1HashCode);
		assertTrue(c1HashCode != f2HashCode);
		assertTrue(c1HashCode != f3HashCode);
	}
	
	public function testEquals() {
		// GIVEN:
		var c1:Coordinate = new Coordinate(1, 2, -3);
		var c2:Coordinate = new Coordinate(1, 2, -3);
		var f1:Coordinate = new Coordinate(1, 2, -2);
		var f2:Coordinate = new Coordinate(1, 3, -3);
		var f3:Coordinate = new Coordinate(2, 2, -3);
		
		// WHEN:
		var c1c2Equals = c1.equals(c2);
		var c1f1Equals = c1.equals(f1);
		var c1f2Equals = c1.equals(f2);
		var c1f3Equals = c1.equals(f3);
		
		// THEN:
		assertTrue(c1c2Equals);
		assertFalse(c1f1Equals);
		assertFalse(c1f2Equals);
		assertFalse(c1f3Equals);
	}
	
	public function testGetNeighbors() {
		// GIVEN:
		var c1:Coordinate = new Coordinate(1, 2, -3);
		var expectedNeighbors:Array<Coordinate> = [
			new Coordinate(2, 1, -3), new Coordinate(2, 2, -4), new Coordinate(1, 3, -4),
			new Coordinate(0, 3, -3), new Coordinate(0, 2, -2), new Coordinate(1, 1, -2)
		];
		
		// WHEN:
		var neighbors:Array<Coordinate> = c1.getNeighbors();
		
		// THEN:
		assertEquals(neighbors.length, expectedNeighbors.length);
		
		// make sure that the same neighbors are returned - as expected
		for (returnedNeighbor in neighbors) {
			var neighborFound:Bool = false;
			
			for (expectedNeighbor in expectedNeighbors) {
				if (expectedNeighbor.equals(returnedNeighbor)) {
					neighborFound = true;
				}
			}
			
			assertTrue(neighborFound);
		}
	}
	
	public function testGetDistance() {
		// GIVEN:
		var c1:Coordinate = new Coordinate(0, 0, 0);
		var c2:Coordinate = new Coordinate(3, 2, -5);
		var expectedDistance = 5;
		
		// WHEN:
		var dist1 = c1.getDistance(c2);
		var dist2 = c2.getDistance(c1);
		
		// THEN:
		assertEquals(expectedDistance, dist1);
		assertEquals(dist1, dist2);
	}
}
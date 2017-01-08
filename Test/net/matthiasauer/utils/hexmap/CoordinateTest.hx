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
		var row:Int = -5;
		var column:Int = -1;
		
		// WHEN:
		var coordinates:Coordinate = Coordinate.fromCube(x, y, z, HexagonOrientation.Horizontal);
		
		// THEN:
		assertThat(coordinates.x, equalTo(x));
		assertThat(coordinates.y, equalTo(y));
		assertThat(coordinates.z, equalTo(z));
		assertThat(coordinates.row, equalTo(row));
		assertThat(coordinates.column, equalTo(column));
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
		assertThat(coordinates.row, equalTo(row));
		assertThat(coordinates.column, equalTo(column));
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
		assertThat(coordinates.row, equalTo(row));
		assertThat(coordinates.column, equalTo(column));
		assertTrue(true);
	}
	
	public function testAdd() {
		// GIVEN:
		var c1:Coordinate = Coordinate.fromCube(1, 2, -3, HexagonOrientation.Horizontal);
		var c2:Coordinate = Coordinate.fromCube( -3, 5, -2, HexagonOrientation.Horizontal);
		var expected:Coordinate = Coordinate.fromCube( -2, 7, -5, HexagonOrientation.Horizontal);
		
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
		var c1:Coordinate = Coordinate.fromCube(1, 2, -3, HexagonOrientation.Horizontal);
		var c2:Coordinate = Coordinate.fromCube(1, 2, -3, HexagonOrientation.Horizontal);
		var f1:Coordinate = Coordinate.fromCube(1, 2, -2, HexagonOrientation.Horizontal);
		var f2:Coordinate = Coordinate.fromCube(1, 3, -3, HexagonOrientation.Horizontal);
		var f3:Coordinate = Coordinate.fromCube(2, 2, -3, HexagonOrientation.Horizontal);
		var f4:Coordinate = Coordinate.fromCube(1, 2, -3, HexagonOrientation.Vertical);
		
		// WHEN:
		var c1HashCode = c1.hashCode();
		var c2HashCode = c2.hashCode();
		var f1HashCode = f1.hashCode();
		var f2HashCode = f2.hashCode();
		var f3HashCode = f3.hashCode();
		var f4HashCode = f4.hashCode();
		
		// THEN:
		assertTrue(c1HashCode == c2HashCode);
		assertTrue(c1HashCode != f1HashCode);
		assertTrue(c1HashCode != f2HashCode);
		assertTrue(c1HashCode != f3HashCode);
		assertTrue(c1HashCode == f4HashCode);
	}
	
	public function testEquals() {
		// GIVEN:
		var c1:Coordinate = Coordinate.fromCube(1, 2, -3, HexagonOrientation.Horizontal);
		var c2:Coordinate = Coordinate.fromCube(1, 2, -3, HexagonOrientation.Horizontal);
		var f1:Coordinate = Coordinate.fromCube(1, 2, -2, HexagonOrientation.Horizontal);
		var f2:Coordinate = Coordinate.fromCube(1, 3, -3, HexagonOrientation.Horizontal);
		var f3:Coordinate = Coordinate.fromCube(2, 2, -3, HexagonOrientation.Horizontal);
		var f4:Coordinate = Coordinate.fromCube(1, 2, -3, HexagonOrientation.Vertical);
		
		// WHEN:
		var c1c2Equals = c1.equals(c2);
		var c1f1Equals = c1.equals(f1);
		var c1f2Equals = c1.equals(f2);
		var c1f3Equals = c1.equals(f3);
		var c1f4Equals = c1.equals(f4);
		
		// THEN:
		assertTrue(c1c2Equals);
		assertFalse(c1f1Equals);
		assertFalse(c1f2Equals);
		assertFalse(c1f3Equals);
		assertFalse(c1f4Equals);
	}
	
	public function testGetNeighbors() {
		// GIVEN:
		var c1:Coordinate = Coordinate.fromCube(1, 2, -3, HexagonOrientation.Horizontal);
		var expectedNeighbors:Array<Coordinate> = [
			Coordinate.fromCube(2, 1, -3, HexagonOrientation.Horizontal),
			Coordinate.fromCube(2, 2, -4, HexagonOrientation.Horizontal),
			Coordinate.fromCube(1, 3, -4, HexagonOrientation.Horizontal),
			Coordinate.fromCube(0, 3, -3, HexagonOrientation.Horizontal),
			Coordinate.fromCube(0, 2, -2, HexagonOrientation.Horizontal),
			Coordinate.fromCube(1, 1, -2, HexagonOrientation.Horizontal)
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
		var c1:Coordinate = Coordinate.fromCube(0, 0, 0, HexagonOrientation.Horizontal);
		var c2:Coordinate = Coordinate.fromCube(3, 2, -5, HexagonOrientation.Horizontal);
		var expectedDistance = 5;
		
		// WHEN:
		var dist1 = c1.getDistance(c2);
		var dist2 = c2.getDistance(c1);
		
		// THEN:
		assertEquals(expectedDistance, dist1);
		assertEquals(dist1, dist2);
	}
}
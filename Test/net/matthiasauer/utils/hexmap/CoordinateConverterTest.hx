package net.matthiasauer.utils.hexmap;

import haxe.unit.TestCase;
import org.hamcrest.Matchers.*;

class CoordinateConverterTest extends TestCase
{
    public function testAxialToCube() {
        // GIVEN:
        var axial:Array<Int> = [3, 2];
        var expectedCube:Array<Int> = [3, -5, 2];

        // WHEN:
        var converted:Array<Int> = CoordinateConverter.axialToCube(axial[0], axial[1]);

        // THEN:
        assertThat(converted[0], equalTo(expectedCube[0]));
        assertThat(converted[1], equalTo(expectedCube[1]));
        assertThat(converted[2], equalTo(expectedCube[2]));
		assertTrue(true);
    }
	
    public function testCubeToAxial() {
        // GIVEN:
        var cube:Array<Int> = [3, -5, 2];
        var expectedAxial:Array<Int> = [3, 2];

        // WHEN:
        var converted:Array<Int> = CoordinateConverter.cubeToAxial(cube[0], cube[1], cube[2]);

        // THEN:
        assertThat(converted[0], equalTo(expectedAxial[0]));
        assertThat(converted[1], equalTo(expectedAxial[1]));
		assertTrue(true);
    }
	
	public function testHorizontalOffsetToCube1() {
        // GIVEN:
        var offset:Array<Int> = [3, 2];
        var expectedCube:Array<Int> = [2, -4, 2];

        // WHEN:
        var converted:Array<Int> = CoordinateConverter.offsetToCube(offset[0], offset[1], HexagonOrientation.Horizontal);

        // THEN:
        assertThat(converted[0], equalTo(expectedCube[0]));
        assertThat(converted[1], equalTo(expectedCube[1]));
        assertThat(converted[2], equalTo(expectedCube[2]));
		assertTrue(true);
	}
	
	public function testHorizontalOffsetToCube2() {
        // GIVEN:
        var offset:Array<Int> = [3, 3];
        var expectedCube:Array<Int> = [2, -5, 3];

        // WHEN:
        var converted:Array<Int> = CoordinateConverter.offsetToCube(offset[0], offset[1], HexagonOrientation.Horizontal);

        // THEN:
        assertThat(converted[0], equalTo(expectedCube[0]));
        assertThat(converted[1], equalTo(expectedCube[1]));
        assertThat(converted[2], equalTo(expectedCube[2]));
		assertTrue(true);
	}
	
	public function testCubeToHorizontalOffset1() {
        // GIVEN:
        var cube:Array<Int> = [2, -4, 2];
		var expectedOffset:Array<Int> = [3, 2];

        // WHEN:
        var converted:Array<Int> = CoordinateConverter.cubeToOffset(cube[0], cube[1], cube[2], HexagonOrientation.Horizontal);

        // THEN:
        assertThat(converted[0], equalTo(expectedOffset[0]));
        assertThat(converted[1], equalTo(expectedOffset[1]));
		assertTrue(true);
	}
	
	public function testCubeToHorizontalOffset2() {
        // GIVEN:
        var cube:Array<Int> = [2, -5, 3];
        var expectedOffset:Array<Int> = [3, 3];

        // WHEN:
        var converted:Array<Int> = CoordinateConverter.cubeToOffset(cube[0], cube[1], cube[2], HexagonOrientation.Horizontal);

        // THEN:
        assertThat(converted[0], equalTo(expectedOffset[0]));
        assertThat(converted[1], equalTo(expectedOffset[1]));
		assertTrue(true);
	}
}
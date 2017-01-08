package net.matthiasauer.traders.model.world.terrain;

import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import net.matthiasauer.traders.persistence.data.TerrainElementData;
import net.matthiasauer.traders.persistence.data.WorldData;
import net.matthiasauer.utils.hexmap.Coordinate;
import net.matthiasauer.utils.hexmap.CoordinateMap.CoordinateMapPair;
import net.matthiasauer.utils.hexmap.HexagonOrientation;
import org.hamcrest.Matchers;
using mockatoo.Mockatoo;

class TerrainTest extends TestCase
{
	public function testGetTerrainType() {
		// GIVEN:
		var terrainData:Array<TerrainElementData> = [
			{ column: -1, row:5, type:"Grassland" },
			{ column:3, row:2, type:"Mountain" }
		];
		var orientation:HexagonOrientation = HexagonOrientation.Horizontal;
		var expectedCoordinated1:Coordinate = Coordinate.fromOffset(terrainData[0].column, terrainData[0].row, orientation);
		var expectedCoordinated2:Coordinate = Coordinate.fromOffset(terrainData[1].column, terrainData[1].row, orientation);

		// WHEN:
		var terrain:Terrain = new Terrain(terrainData, orientation);
		
		// THEN:
		assertEquals(TerrainType.Grassland, terrain.get(expectedCoordinated1));
		assertEquals(TerrainType.Mountain, terrain.get(expectedCoordinated2));
	}
	
	public function testGetEntries() {
		// GIVEN:
		var terrainData:Array<TerrainElementData> = [
			{ column: -1, row:5, type:"Grassland" },
			{ column:3, row:2, type:"Mountain" }
		];
		var orientation:HexagonOrientation = HexagonOrientation.Horizontal;
		var expectedCoordinated1:Coordinate = Coordinate.fromOffset(terrainData[0].column, terrainData[0].row, orientation);
		var expectedCoordinated2:Coordinate = Coordinate.fromOffset(terrainData[1].column, terrainData[1].row, orientation);
		var terrain:Terrain = new Terrain(terrainData, orientation);

		// WHEN:
		var entries:Array<CoordinateMapPair<TerrainType>> = terrain.entries();
		
		// THEN:
		assertEquals(2, entries.length);
	}
}
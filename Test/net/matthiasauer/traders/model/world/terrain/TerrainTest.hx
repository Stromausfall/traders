package net.matthiasauer.traders.model.world.terrain;

import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import net.matthiasauer.traders.persistence.data.TerrainElementData;
import net.matthiasauer.traders.persistence.data.WorldData;
import net.matthiasauer.traders.view.GUIData;
import net.matthiasauer.traders.view.IGui;
import net.matthiasauer.utils.general.Pair;
import net.matthiasauer.utils.hexmap.Coordinate;
import net.matthiasauer.utils.hexmap.HexagonOrientation;
import net.matthiasauer.utils.hexmap.IOffsetCoordinate;
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
		var mockedGUI:IGui = Mockatoo.mock(IGui);
		var orientation:HexagonOrientation = HexagonOrientation.Horizontal;
		var expectedCoordinated1:Coordinate = Coordinate.fromOffset(terrainData[0].column, terrainData[0].row, orientation);
		var expectedCoordinated2:Coordinate = Coordinate.fromOffset(terrainData[1].column, terrainData[1].row, orientation);

		// WHEN:
		var terrain:Terrain = new Terrain(mockedGUI, terrainData, orientation);
		
		// THEN:
		assertEquals(TerrainType.Grassland, terrain.get(expectedCoordinated1).type);
		assertEquals(TerrainType.Mountain, terrain.get(expectedCoordinated2).type);
	}
	
	public function testThatTheGuiIsCalled() {
		// GIVEN:
		var terrainData:Array<TerrainElementData> = [
			{ column: -1, row:5, type:"Grassland" },
			{ column:3, row:2, type:"Mountain" }
		];
		var mockedGUI:IGui = Mockatoo.mock(IGui);
		var orientation:HexagonOrientation = HexagonOrientation.Horizontal;
		var expectedCoordinated1:Coordinate = Coordinate.fromOffset(terrainData[0].column, terrainData[0].row, orientation);
		var expectedCoordinated2:Coordinate = Coordinate.fromOffset(terrainData[1].column, terrainData[1].row, orientation);

		// WHEN:
		var terrain:Terrain = new Terrain(mockedGUI, terrainData, orientation);
		
		// THEN:
		mockedGUI.createElement(cast any, cast any).verify(2);
		assertTrue(true);
	}
	
	public function testGetEntries() {
		// GIVEN:
		var terrainData:Array<TerrainElementData> = [
			{ column: -1, row:5, type:"Grassland" },
			{ column:3, row:2, type:"Mountain" }
		];
		var mockedGUI:IGui = Mockatoo.mock(IGui);
		var orientation:HexagonOrientation = HexagonOrientation.Horizontal;
		var expectedCoordinated1:Coordinate = Coordinate.fromOffset(terrainData[0].column, terrainData[0].row, orientation);
		var expectedCoordinated2:Coordinate = Coordinate.fromOffset(terrainData[1].column, terrainData[1].row, orientation);
		var terrain:Terrain = new Terrain(mockedGUI, terrainData, orientation);

		// WHEN:
		var entries:Array<Pair<Coordinate, TerrainTile>> = terrain.entries();
		
		// THEN:
		assertEquals(2, entries.length);
	}
}
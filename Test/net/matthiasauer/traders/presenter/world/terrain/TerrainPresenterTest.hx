package net.matthiasauer.traders.presenter.world.terrain;

import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import net.matthiasauer.traders.model.world.terrain.ITerrain;
import net.matthiasauer.traders.model.world.terrain.Terrain;
import net.matthiasauer.traders.model.world.terrain.TerrainType;
import net.matthiasauer.utils.general.Pair;
import net.matthiasauer.utils.hexmap.Coordinate;
import net.matthiasauer.utils.hexmap.HexagonOrientation;
import net.matthiasauer.utils.hexmap.IOffsetCoordnate;
import org.hamcrest.Matchers;
using mockatoo.Mockatoo;

class TerrainPresenterTest extends TestCase
{
	public function testEntries() {
		// GIVEN:
		var terrainModel:ITerrain = Mockatoo.mock(ITerrain);
		var terrainModelEntries:Array<Pair<Coordinate, TerrainType>> = [
			new Pair(Coordinate.fromOffset(1, 2, HexagonOrientation.Horizontal), TerrainType.Grassland),
			new Pair(Coordinate.fromOffset(1, -2, HexagonOrientation.Horizontal), TerrainType.Mountain)
		];
		terrainModel.entries().returns(terrainModelEntries);
		var terrainPresenter:TerrainPresenter = new TerrainPresenter(terrainModel);
		
		// WHEN:
		var entries:Array<Pair<IOffsetCoordnate, TerrainType>> = terrainPresenter.entries();
		
		// THEN:
		assertEquals(2, entries.length);
	}
}
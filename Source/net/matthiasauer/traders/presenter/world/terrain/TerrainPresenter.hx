package net.matthiasauer.traders.presenter.world.terrain;
import net.matthiasauer.traders.model.world.terrain.ITerrain;
import net.matthiasauer.traders.model.world.terrain.TerrainType;
import net.matthiasauer.utils.general.ArrayUtils;
import net.matthiasauer.utils.general.Pair;
import net.matthiasauer.utils.hexmap.Coordinate;
import net.matthiasauer.utils.hexmap.IOffsetCoordinate;

class TerrainPresenter 
{
	private var terrain:ITerrain;
	
	public function new(terrain:ITerrain) 
	{
		this.terrain = terrain;
	}

	public function entries() : Array<Pair<IOffsetCoordinate, TerrainType>> {
		return ArrayUtils.transform(terrain.entries(), this.transform);
	}
	
	private function transform(input:Pair<Coordinate, TerrainType>) : Pair<IOffsetCoordinate, TerrainType> {
		return new Pair<IOffsetCoordinate, TerrainType>(input.key, input.value);
	}
}

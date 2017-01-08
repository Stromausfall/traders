package net.matthiasauer.traders.presenter.world.terrain;
import net.matthiasauer.traders.model.world.terrain.ITerrain;
import net.matthiasauer.traders.model.world.terrain.TerrainType;
import net.matthiasauer.utils.general.ArrayUtils;
import net.matthiasauer.utils.general.Pair;
import net.matthiasauer.utils.hexmap.Coordinate;
import net.matthiasauer.utils.hexmap.IOffsetCoordnate;

/**
 * ...
 * @author 
 */
class TerrainPresenter 
{
	private var terrain:ITerrain;
	
	public function new(terrain:ITerrain) 
	{
		this.terrain = terrain;
	}

	public function entries() : Array<Pair<IOffsetCoordnate, TerrainType>> {
		return ArrayUtils.transform(terrain.entries(), this.transform);
	}
	
	private function transform(input:Pair<Coordinate, TerrainType>) : Pair<IOffsetCoordnate, TerrainType> {
		return new Pair<IOffsetCoordnate, TerrainType>(input.key, input.value);
	}
}

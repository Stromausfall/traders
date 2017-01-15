package net.matthiasauer.traders.presenter.world.cities;

import net.matthiasauer.traders.model.world.cities.City;
import net.matthiasauer.traders.model.world.cities.ICities;
import net.matthiasauer.traders.model.world.cities.ICity;
import net.matthiasauer.utils.general.ArrayUtils;
import net.matthiasauer.utils.general.Pair;
import net.matthiasauer.utils.hexmap.Coordinate;
import net.matthiasauer.utils.hexmap.IOffsetCoordinate;

class CitiesPresenter 
{
	private var cities:ICities;
	
	public function new(cities:ICities) 
	{
		this.cities = cities;
	}

	public function entries() : Array<Pair<IOffsetCoordinate, ICity>> {
		return ArrayUtils.transform(this.cities.entries(), this.transform);
	}
	
	private function transform(input:Pair<Coordinate, City>) : Pair<IOffsetCoordinate, ICity> {
		return new Pair<IOffsetCoordinate, ICity>(input.key, input.value);
	}
}

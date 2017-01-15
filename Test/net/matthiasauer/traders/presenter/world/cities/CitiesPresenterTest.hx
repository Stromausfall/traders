package net.matthiasauer.traders.presenter.world.cities;

import haxe.unit.TestCase;
import mockatoo.Mockatoo;
import net.matthiasauer.traders.model.world.cities.ICities;
import net.matthiasauer.traders.model.world.cities.ICity;
import net.matthiasauer.traders.presenter.world.cities.CitiesPresenter;
import net.matthiasauer.utils.general.Pair;
import net.matthiasauer.utils.hexmap.Coordinate;
import net.matthiasauer.utils.hexmap.HexagonOrientation;
import net.matthiasauer.utils.hexmap.IOffsetCoordinate;
import org.hamcrest.Matchers;
using mockatoo.Mockatoo;

class CitiesPresenterTest extends TestCase
{
	public function testEntries() {
		// GIVEN:
		var citiesModel:ICities = Mockatoo.mock(ICities);
		var city1:ICity = Mockatoo.mock(ICity);
		var city2:ICity = Mockatoo.mock(ICity);
		var citiesModelEntries:Array<Pair<Coordinate, ICity>> = [
			new Pair(Coordinate.fromOffset(1, 2, HexagonOrientation.Horizontal), city1),
			new Pair(Coordinate.fromOffset(1, -2, HexagonOrientation.Horizontal), city2)
		];
		citiesModel.entries().returns(citiesModelEntries);
		var citiesPresenter:CitiesPresenter = new CitiesPresenter(citiesModel);
		
		// WHEN:
		var entries:Array<Pair<IOffsetCoordinate, ICity>> = citiesPresenter.entries();
		
		// THEN:
		assertEquals(2, entries.length);
	}
}
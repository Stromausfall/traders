package net.matthiasauer.traders.model.world.cities;
import net.matthiasauer.traders.persistence.data.CitiesElementData;

/**
 * ...
 * @author ...
 */
class City implements ICity
{
	public var name(default, null):String;

	public function new(data:CitiesElementData) 
	{
		this.name = data.name;
	}
}
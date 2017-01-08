package net.matthiasauer.traders.model.world;
import net.matthiasauer.traders.persistence.data.WorldData;
import net.matthiasauer.utils.hexmap.HexagonOrientation;

class World 
{
	public var orientation(default, null) : HexagonOrientation;
	
	public function new(data:WorldData)
	{
		this.orientation = HexagonOrientation.createByName(data.orientation);
	}	
}

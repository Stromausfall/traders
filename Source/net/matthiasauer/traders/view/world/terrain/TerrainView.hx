package net.matthiasauer.traders.view.world.terrain;
import format.SVG;
import net.matthiasauer.traders.model.world.terrain.TerrainType;
import net.matthiasauer.traders.persistence.IDataAccess;
import net.matthiasauer.traders.presenter.world.terrain.TerrainPresenter;
import net.matthiasauer.traders.view.world.WorldUtils;
import net.matthiasauer.utils.hexmap.CoordinateConverter;
import net.matthiasauer.utils.hexmap.IOffsetCoordinate;
import openfl.display.Shape;
import openfl.display.Sprite;

/**
 * ...
 * @author 
 */
class TerrainView extends Sprite
{
	private var presenter:TerrainPresenter;
	private var worldUtils:WorldUtils;
	
	public function new(presenter:TerrainPresenter, dataAccess:IDataAccess) 
	{
		super();
		
		this.presenter = presenter;
		this.worldUtils = new WorldUtils(dataAccess);
	}
	
	private function createTile(coordinate:IOffsetCoordinate, terrainType:TerrainType) : Sprite {
		var fileName:String = terrainType.getName() + ".svg";
		
		return this.worldUtils.createAndPosititonSVG(coordinate, fileName);
	}
	
	public function initialize() : Void {
		for (element in this.presenter.entries()) {
			
			var sprite:Sprite = createTile(element.key, element.value);
			
			this.addChild(sprite);
		}
	}
}
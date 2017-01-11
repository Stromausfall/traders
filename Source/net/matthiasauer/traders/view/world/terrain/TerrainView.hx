package net.matthiasauer.traders.view.world.terrain;
import net.matthiasauer.traders.persistence.IDataAccess;
import net.matthiasauer.traders.presenter.world.terrain.TerrainPresenter;
import net.matthiasauer.utils.hexmap.IOffsetCoordnate;
import openfl.display.Sprite;

/**
 * ...
 * @author 
 */
class TerrainView extends Sprite
{
	private var presenter:TerrainPresenter;
	private var dataAccess:IDataAccess;

	public function new(presenter:TerrainPresenter, dataAccess:IDataAccess) 
	{
		super();
		
		this.presenter = presenter;
		this.dataAccess = dataAccess;
	}
	
	public function initialize() : Void {
		for (element in this.presenter.entries()) {
			var coordiante:IOffsetCoordnate = element.key;
		}
	}
}
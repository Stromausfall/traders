package net.matthiasauer.traders.view.world.cities;

import format.SVG;
import net.matthiasauer.traders.model.world.cities.ICity;
import net.matthiasauer.traders.persistence.IDataAccess;
import net.matthiasauer.traders.presenter.world.cities.CitiesPresenter;
import net.matthiasauer.traders.view.world.WorldUtils;
import net.matthiasauer.utils.hexmap.CoordinateConverter;
import net.matthiasauer.utils.hexmap.IOffsetCoordinate;
import openfl.display.Shape;
import openfl.display.Sprite;

/**
 * ...
 * @author 
 */
class CitiesView extends Sprite
{
	private var presenter:CitiesPresenter;
	private var dataAccess:IDataAccess;
	private var worldUtils:WorldUtils;
	
	public function new(presenter:CitiesPresenter, dataAccess:IDataAccess) 
	{
		super();
		
		this.presenter = presenter;
		this.worldUtils = new WorldUtils(dataAccess);
	}
	
	private function createCity(coordinate:IOffsetCoordinate, city:ICity) : Sprite {
		var fileName:String = "City.svg";
		
		return this.worldUtils.createAndPosititonSVG(coordinate, fileName);
	}
	
	public function initialize() : Void {
		for (element in this.presenter.entries()) {
			var sprite:Sprite = createCity(element.key, element.value);
			
			this.addChild(sprite);
		}
	}
}

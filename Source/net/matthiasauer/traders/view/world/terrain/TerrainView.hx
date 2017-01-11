package net.matthiasauer.traders.view.world.terrain;
import format.SVG;
import net.matthiasauer.traders.persistence.IDataAccess;
import net.matthiasauer.traders.presenter.world.terrain.TerrainPresenter;
import net.matthiasauer.utils.hexmap.CoordinateConverter;
import net.matthiasauer.utils.hexmap.IOffsetCoordnate;
import openfl.display.Shape;
import openfl.display.Sprite;

/**
 * ...
 * @author 
 */
class TerrainView extends Sprite
{
	private static inline var TILE_SIZE_X = 50;
	private static inline var TILE_SIZE_Y = 75;
	private var presenter:TerrainPresenter;
	private var dataAccess:IDataAccess;
	
	public function new(presenter:TerrainPresenter, dataAccess:IDataAccess) 
	{
		super();
		
		this.presenter = presenter;
		this.dataAccess = dataAccess;
	}
	
	private function createTile(x:Int, y:Int) : Sprite {
		// create the SVG
		var svg:SVG = new SVG(dataAccess.getString("circle.svg"));
		var shape:Shape = new Shape();
		var sprite:Sprite = new Sprite();
		
		svg.render(shape.graphics);
		sprite.addChild(shape);
		
		sprite.x = x;
		sprite.y = y;
		
		// center the SVG
		//this.shape.y = -this.shape.height / 2;
		//this.shape.x = -this.shape.width / 2;
		
		return sprite;
	}
	
	public function initialize() : Void {
		for (element in this.presenter.entries()) {
			var coordinate:IOffsetCoordnate = element.key;
			var pixelCoordinates:Array<Int> = CoordinateConverter.offsetToPixel(coordinate.column, coordinate.row, coordinate.orientation, TILE_SIZE_X, TILE_SIZE_Y);
			
			var sprite:Sprite = createTile(pixelCoordinates[0], pixelCoordinates[1]);
			
			this.addChild(sprite);
		}
	}
}
package net.matthiasauer.traders.view.world.terrain;
import format.SVG;
import net.matthiasauer.traders.model.world.terrain.TerrainType;
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
	private static inline var TILE_SIZE_X = 55;
	private static inline var TILE_SIZE_Y = 55;
	private var presenter:TerrainPresenter;
	private var dataAccess:IDataAccess;
	
	public function new(presenter:TerrainPresenter, dataAccess:IDataAccess) 
	{
		super();
		
		this.presenter = presenter;
		this.dataAccess = dataAccess;
	}
	
	private function createSVG(fileName:String) : SVG {
		var rawData:String = this.dataAccess.getString(fileName);
		var svg:SVG = new SVG(rawData);
		
		return svg;
	}
	
	private function positionSprite(sprite:Sprite, coordinate:IOffsetCoordnate) : Void {	
		var pixelCoordinates:Array<Int> = CoordinateConverter.offsetToPixel(coordinate.column, coordinate.row, coordinate.orientation, TILE_SIZE_X, TILE_SIZE_Y);
		var x:Int = pixelCoordinates[0];
		var y:Int = pixelCoordinates[1];
		
		// set the position of the sprite
		sprite.x = x;
		sprite.y = y;
	}
	
	private function createSprite(svg:SVG) : Sprite {
		var shape:Shape = new Shape();
		var sprite:Sprite = new Sprite();
		
		svg.render(shape.graphics);
		sprite.addChild(shape);
		
		// center the shape in the sprite
		shape.y = -shape.height / 2;
		shape.x = -shape.width / 2;
		
		return sprite;
	}
	
	private function createAndPosititon(coordinate:IOffsetCoordnate, fileName:String) : Sprite {
		var svg:SVG = this.createSVG(fileName);
		var sprite:Sprite = this.createSprite(svg);		
		
		this.positionSprite(sprite, coordinate);
		
		return sprite;
	}
	
	private function createTile(coordinate:IOffsetCoordnate, terrainType:TerrainType) : Sprite {
		var fileName:String = terrainType.getName() + ".svg";
		
		return this.createAndPosititon(coordinate, fileName);
	}
	
	public function initialize() : Void {
		for (element in this.presenter.entries()) {
			
			var sprite:Sprite = createTile(element.key, element.value);
			
			this.addChild(sprite);
		}
	}
}
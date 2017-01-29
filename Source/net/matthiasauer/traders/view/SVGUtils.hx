package net.matthiasauer.traders.view;
import format.SVG;
import net.matthiasauer.traders.persistence.IDataAccess;
import net.matthiasauer.utils.hexmap.CoordinateConverter;
import net.matthiasauer.utils.hexmap.IOffsetCoordinate;
import openfl.display.Shape;
import openfl.display.Sprite;

/**
 * ...
 * @author 
 */
class SVGUtils 
{
	private static inline var TILE_SIZE_X = 55;
	private static inline var TILE_SIZE_Y = 55;
	private var dataAccess:IDataAccess;
	
	public function new(dataAccess:IDataAccess) {
		this.dataAccess = dataAccess;
	}
	
	private function createSVG(fileName:String) : SVG {
		var rawData:String = this.dataAccess.getString(fileName);
		var svg:SVG = new SVG(rawData);
		
		return svg;
	}
	
	private function positionSprite(sprite:Sprite, coordinate:IOffsetCoordinate) : Void {
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
	
	public function createAndPosititonSVG(coordinate:IOffsetCoordinate, fileName:String) : Sprite {
		var svg:SVG = this.createSVG(fileName);
		var sprite:Sprite = this.createSprite(svg);		
		
		this.positionSprite(sprite, coordinate);
		
		return sprite;
	}
}
package net.matthiasauer.utils.hexmap;
import openfl.Lib;

/**
 * ...
 * @author ...
 */
class CoordinateConverter 
{
	private function new() 
	{
	}
	
	public static function axialToCube(q:Int, r:Int) : Array<Int> {
		return [q, ( -q - r), r];
	}
	
	public static function cubeToAxial(x:Int, y:Int, z:Int) : Array<Int> {
		var q:Int = x;
		var r:Int = z;
		
		return [q, r];
	}
	
	public static function offsetToCube(col:Int, row:Int, orientation:HexagonOrientation) : Array<Int> {
		var x:Int = col - Std.int((row - (row & 1)) / 2);
		var z:Int = row;
		var y:Int = -x - z;
		
		return [x, y, z];
	}
	
	public static function cubeToOffset(x:Int, y:Int, z:Int, orientation:HexagonOrientation) : Array<Int> {
		var col:Int = x + Std.int((z - (z & 1)) / 2);
		var row:Int = z;
		
		return [col, row];
	}
	
	public static function offsetToPixel(column:Int, row:Int, orientation:HexagonOrientation, tileSizeX:Int, tileSizeY:Int) : Array<Int> {
		var x:Float;
		var y:Float;
		
		if (orientation == HexagonOrientation.Horizontal) {
			x = Math.sqrt(3) * (column + 0.5 * (row & 1));
			y = 3.0 / 2.0 * row;
		} else {
			x = 3.0 / 2.0 * column;
			y = Math.sqrt(3) * (row + 0.5 * (column & 1));			
		}
		
		// scale
		x = x * tileSizeX;
		y = y * tileSizeY;
		
		return [Std.int(x), Std.int(y)];
	}
}
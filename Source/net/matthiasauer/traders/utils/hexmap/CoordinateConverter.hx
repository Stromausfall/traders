package net.matthiasauer.traders.utils.hexmap;

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
}
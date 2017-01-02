package net.matthiasauer.utils.hexmap;
import flash.display.InterpolationMethod;
import haxe.ds.HashMap;

/**
 * for the explanation of the maths: http://www.redblobgames.com/grids/hexagons/
 */
class Coordinate 
{
	public var x(default, null) : Int;
	public var y(default, null) : Int;
	public var z(default, null) : Int;
	private static var neighborOffset : Array<Coordinate> = [
		new Coordinate(1, -1,  0), new Coordinate(1,  0, -1), new Coordinate( 0, 1, -1),
		new Coordinate(-1, 1,  0), new Coordinate(-1,  0, 1), new Coordinate( 0, -1, 1)
	];
	
	public function new(x:Int, y:Int, z:Int) 
	{
		this.x = x;
		this.y = y;
		this.z = z;
	}
	
    public function hashCode():Int
    {
		// use XOR to create a hashcode from three integers
        return this.x ^ this.y ^ this.z;
    }
	
	public function getNeighbors() : Array<Coordinate> {
		return neighborOffset.map(function(offset) return Coordinate.add(this, offset));
	}
	
	public function getDistance(lhs:Coordinate) : Int {
		return Std.int((Math.abs(this.x - lhs.x) + Math.abs(this.y - lhs.y) + Math.abs(this.z + lhs.z)) / 2);
	}
	
	public static function add(lhs:Coordinate, rhs:Coordinate) : Coordinate {
		var x:Int = lhs.x + rhs.x;
		var y:Int = lhs.y + rhs.y;
		var z:Int = lhs.z + rhs.z;
		
		return new Coordinate(x, y, z);
	}
	
	public static function equals(lhs:Coordinate, rhs:Coordinate) : Bool {
		return (lhs.x == rhs.x) && (lhs.y == rhs.y) && (lhs.z == rhs.z);
	}
}
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
	public var row(default, null) : Int;
	public var column(default, null) : Int;
	
	private var orientation : HexagonOrientation;
	
	private static var neighborOffset : Array<Coordinate> = [
		new Coordinate(1, -1,  0, 0, 0, null), new Coordinate(1,  0, -1, 0, 0, null), new Coordinate( 0, 1, -1, 0, 0, null),
		new Coordinate(-1, 1,  0, 0, 0, null), new Coordinate(-1,  0, 1, 0, 0, null), new Coordinate( 0, -1, 1, 0, 0, null)
	];
	
	private function new(x:Int, y:Int, z:Int, column:Int, row:Int, orientation:HexagonOrientation) {
		this.x = x;
		this.y = y;
		this.z = z;
		this.column = column;
		this.orientation = orientation;
		this.row = row;
	}
	
	public static function fromCube(x:Int, y:Int, z:Int, orientation:HexagonOrientation) : Coordinate {
		var offsetCoordinates:Array<Int> = CoordinateConverter.cubeToOffset(x, y, z, orientation);
		var column:Int = offsetCoordinates[0];
		var row:Int = offsetCoordinates[1];
		
		return new Coordinate(x, y, z, column, row, orientation);
	}
	
	public static function fromOffset(column:Int, row:Int, orientation:HexagonOrientation) : Coordinate {
		var cubeCoordinates:Array<Int> = CoordinateConverter.offsetToCube(column, row, orientation);
		var x:Int = cubeCoordinates[0];
		var y:Int = cubeCoordinates[1];
		var z:Int = cubeCoordinates[2];
		
		return new Coordinate(x, y, z, column, row, orientation);
	}
	
    public function hashCode() : Int {
		// use XOR to create a hashcode from three integers
		// - no need to add the orientation - as only one orientation should be used at any time
        return this.x ^ this.y ^ this.z;
    }
	
	public function getNeighbors() : Array<Coordinate> {
		return neighborOffset.map(function(offset) return this.add(offset));
	}
	
	public function getDistance(rhs:Coordinate) : Int {
		var lhs:Coordinate = this; 
		
		return Std.int((Math.abs(rhs.x - lhs.x) + Math.abs(rhs.y - lhs.y) + Math.abs(rhs.z + lhs.z)) / 2);
	}
	
	/**
	 * Returns the result of adding this coordiante + the instance provided as argument -> note that the orientation is used from THIS coordinate instance 
	 * @param	rhs
	 * @return
	 */
	public function add(rhs:Coordinate) : Coordinate {
		var lhs:Coordinate = this;
		
		var x:Int = lhs.x + rhs.x;
		var y:Int = lhs.y + rhs.y;
		var z:Int = lhs.z + rhs.z;
		
		return Coordinate.fromCube(x, y, z, lhs.orientation);
	}
	
	public function equals(rhs:Coordinate) : Bool {
		var lhs:Coordinate = this; 
		
		return (lhs.x == rhs.x) && (lhs.y == rhs.y) && (lhs.z == rhs.z) && (lhs.orientation == rhs.orientation);
	}
}
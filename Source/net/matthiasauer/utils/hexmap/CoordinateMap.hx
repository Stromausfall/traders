package net.matthiasauer.utils.hexmap;

import haxe.ds.IntMap;

class CoordinateMapPair<T>
{
	public var key(default, null) : Coordinate;
	public var value(default, null) : T;
	
	public function new(key:Coordinate, value:T) {
		this.key = key;
		this.value = value;
	}
}

class CoordinateMap<T>
{
	private var xMap:IntMap<IntMap<CoordinateMapPair<T>>>;
	private var entryArray:Array<CoordinateMapPair<T>>;
	
	public function new() 
	{
		this.xMap = new IntMap<IntMap<CoordinateMapPair<T>>>();
		this.entryArray = new Array<CoordinateMapPair<T>>();
	}
	
	public function get(coordinate:Coordinate) : T {
		// use X
		var yMap:IntMap<CoordinateMapPair<T>> = this.xMap.get(coordinate.x);
		
		if (yMap == null) {
			// no entry for the X coordinate !
			return null;
		}
		
		var entry:CoordinateMapPair<T> = yMap.get(coordinate.y);
			
		if (entry == null) {
			// no entry for the Y coordinate !
			return null;
		}
		
		return entry.value;
	}
	
	public function set(coordinate:Coordinate, value:T) : Void {
		// use X
		var yMap:IntMap<CoordinateMapPair<T>> = this.xMap.get(coordinate.x);
		
		if (yMap == null) {
			// no entry for the X coordinate - create one
			yMap = new IntMap<CoordinateMapPair<T>>();
			
			// and store it
			this.xMap.set(coordinate.x, yMap);
		}
		
		var entry:CoordinateMapPair<T> = new CoordinateMapPair(coordinate, value);
		
		yMap.set(coordinate.y, entry);
		this.entryArray.push(entry);
	}
	
	public function entries() : Array<CoordinateMapPair<T>> {
		// return a copy of the entries array
		return this.entryArray.copy();
	}
	
	private function removeEntryFromEntryArray(key:Coordinate) : Void {	
		for (element in this.entryArray) {
			if (element.key.equals(key)) {
				// remove from the entry Array
				this.entryArray.remove(element);
				
				return;
			}
		}
	}
	
	private function removeEntryFromXMap(key:Coordinate) : Void {
		var yMap:IntMap<CoordinateMapPair<T>> = this.xMap.get(key.x);
		
		if (yMap == null) {
			// no entry for the X coordinate !
			return;
		}
		
		// remove the entry from the yMap
		yMap.remove(key.y);
		
		// if now the yMap is empty - remove the yMap entry from the xMap
		if (!yMap.keys().hasNext()) {
			this.xMap.remove(key.x);
		}		
	}
	
	public function remove(key:Coordinate) : Void {
		
		this.removeEntryFromEntryArray(key);
		
		this.removeEntryFromXMap(key);
	}
}
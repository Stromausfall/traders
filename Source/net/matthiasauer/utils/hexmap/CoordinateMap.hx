package net.matthiasauer.utils.hexmap;

import haxe.ds.IntMap;
import net.matthiasauer.utils.general.Pair;

class CoordinateMap<T>
{
	private var xMap:IntMap<IntMap<Pair<Coordinate, T>>>;
	private var entryArray:Array<Pair<Coordinate, T>>;
	
	public function new() 
	{
		this.xMap = new IntMap<IntMap<Pair<Coordinate, T>>>();
		this.entryArray = new Array<Pair<Coordinate, T>>();
	}
	
	public function get(coordinate:Coordinate) : T {
		// use X
		var yMap:IntMap<Pair<Coordinate, T>> = this.xMap.get(coordinate.x);
		
		if (yMap == null) {
			// no entry for the X coordinate !
			return null;
		}
		
		var entry:Pair<Coordinate, T> = yMap.get(coordinate.y);
			
		if (entry == null) {
			// no entry for the Y coordinate !
			return null;
		}
		
		return entry.value;
	}
	
	public function set(coordinate:Coordinate, value:T) : Void {
		// use X
		var yMap:IntMap<Pair<Coordinate, T>> = this.xMap.get(coordinate.x);
		
		if (yMap == null) {
			// no entry for the X coordinate - create one
			yMap = new IntMap<Pair<Coordinate, T>>();
			
			// and store it
			this.xMap.set(coordinate.x, yMap);
		}
		
		var entry:Pair<Coordinate, T> = new Pair(coordinate, value);
		
		yMap.set(coordinate.y, entry);
		this.entryArray.push(entry);
	}
	
	public function entries() : Array<Pair<Coordinate, T>> {
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
		var yMap:IntMap<Pair<Coordinate, T>> = this.xMap.get(key.x);
		
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
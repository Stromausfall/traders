package net.matthiasauer.traders.view;
import haxe.Int64;

/**
 * ...
 * @author 
 */
class IDGenerator 
{
	private var current:Int64;
	private var incrementStep:Int64;
	
	public function new() {
		this.current = Int64.fromFloat(0);
		this.incrementStep = Int64.fromFloat(1);
	}
	
	public function getNext() : Int64 {
		// increment the current id
		this.current = Int64.add(this.current, incrementStep);
		
		// then return the 
		return this.current;
	}
}
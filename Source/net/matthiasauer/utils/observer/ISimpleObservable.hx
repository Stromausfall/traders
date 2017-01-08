package net.matthiasauer.utils.observer;

interface ISimpleObservable 
{
	function add(key:String, observer:Void->Void) : Void;
	
	function remove(key:String) : Void;
}
package net.matthiasauer.utils.observer;

interface IGenericObservable<T>
{
	function add(key:String, observer:T->Void) : Void;
	
	function remove(key:String) : Void;
}
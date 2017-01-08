package net.matthiasauer.traders.persistence;
import openfl.display.BitmapData;

interface IDataAccess 
{
	function getString(identifier:String) : String;
	
	function getBitmapData(identifier:String) : BitmapData;
}
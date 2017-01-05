package net.matthiasauer.traders.persistence;

interface IDataAccess 
{
	function getString(identifier:String) : String;
}
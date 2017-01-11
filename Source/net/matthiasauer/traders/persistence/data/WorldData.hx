package net.matthiasauer.traders.persistence.data;

typedef WorldData =
{
	var orientation:String;
	var terrain:Array<TerrainElementData>;
	var cities:Array<CitiesElementData>;
}
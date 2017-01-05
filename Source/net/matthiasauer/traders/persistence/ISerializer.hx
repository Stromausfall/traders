package net.matthiasauer.traders.persistence;

/**
 * @author 
 */
interface ISerializer 
{
	function deserialize(assetId:String) : MapData;
}
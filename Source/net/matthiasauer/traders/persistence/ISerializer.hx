package net.matthiasauer.traders.persistence;
import net.matthiasauer.traders.persistence.data.GameData;

/**
 * @author 
 */
interface ISerializer 
{
	function deserialize(assetId:String) : GameData;
}
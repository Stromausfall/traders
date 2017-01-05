package net.matthiasauer.traders.persistence;
import openfl.Assets;

class AssetDataAccess implements IDataAccess
{
	private static inline var ASSET_FOLDER:String = "assets/";
	
	public function getString(identifier:String) : String {
		return Assets.getText(ASSET_FOLDER + identifier);
	}
}
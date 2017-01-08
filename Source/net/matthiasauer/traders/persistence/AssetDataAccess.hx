package net.matthiasauer.traders.persistence;
import openfl.Assets;
import openfl.display.BitmapData;

class AssetDataAccess implements IDataAccess
{
	public function new() {
	}
	
	private static inline var ASSET_FOLDER:String = "assets/";
	
	public function getString(identifier:String) : String {
		return Assets.getText(ASSET_FOLDER + identifier);
	}
	
	public function getBitmapData(identifier:String) : BitmapData {
		return Assets.getBitmapData(ASSET_FOLDER + identifier);
	}
}
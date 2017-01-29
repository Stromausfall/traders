package net.matthiasauer.traders;


import haxe.CallStack;
import net.matthiasauer.traders.model.world.World;
import net.matthiasauer.traders.model.world.cities.Cities;
import net.matthiasauer.traders.model.world.terrain.Terrain;
import net.matthiasauer.traders.persistence.AssetDataAccess;
import net.matthiasauer.traders.persistence.IDataAccess;
import net.matthiasauer.traders.persistence.ISerializer;
import net.matthiasauer.traders.persistence.JSONSerializer;
import net.matthiasauer.traders.persistence.data.GameData;
import net.matthiasauer.traders.persistence.data.WorldData;
import net.matthiasauer.traders.view.GUIData;
import net.matthiasauer.traders.view.GuiImplementation;
import net.matthiasauer.traders.view.IGui;
import openfl.Lib;
import openfl.display.Sprite;

class Main extends Sprite {
	private var terrainModel:Terrain;
	private var citiesModel:Cities;
	
	private var gui:IGui;	
	private var data:GameData;
	
	
	public function new () {
		super ();
		
		try {
			// get data
			var dataAccess:IDataAccess = new AssetDataAccess();
			var json:ISerializer = new JSONSerializer(dataAccess);
			this.data = json.deserialize("map.json");		
			var worldData:World = new World(this.data.world);
			this.gui = new GuiImplementation(dataAccess, this);
			
			this.terrainModel = new Terrain(this.gui, this.data.world.terrain, worldData.orientation);
			this.citiesModel = new Cities(this.gui, this.data.world.cities, worldData.orientation);
			
			this.x = 200;
			this.y = 200;
		} catch (e:Dynamic) {
			trace("Error occurred: " + e);
			
			for (item in CallStack.exceptionStack()) {
				trace(item);
			}
		}
	}
}

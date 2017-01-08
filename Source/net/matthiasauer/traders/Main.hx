package net.matthiasauer.traders;


import net.matthiasauer.traders.model.world.World;
import net.matthiasauer.traders.model.world.terrain.Terrain;
import net.matthiasauer.traders.persistence.AssetDataAccess;
import net.matthiasauer.traders.persistence.IDataAccess;
import net.matthiasauer.traders.persistence.ISerializer;
import net.matthiasauer.traders.persistence.JSONSerializer;
import net.matthiasauer.traders.persistence.data.GameData;
import net.matthiasauer.traders.persistence.data.WorldData;
import net.matthiasauer.traders.presenter.world.terrain.TerrainPresenter;
import net.matthiasauer.traders.view.world.terrain.TerrainView;
import openfl.display.Sprite;

class Main extends Sprite {
	private var view:TerrainView;
	private var presenter:TerrainPresenter;
	private var model:Terrain;
	private var data:GameData;
	
	
	public function new () {
		super ();
		
		// get data
		var dataAccess:IDataAccess = new AssetDataAccess();
		var json:ISerializer = new JSONSerializer(dataAccess);
		this.data = json.deserialize("map.json");
		
		var worldData:World = new World(this.data.world);
		
		this.model = new Terrain(this.data.world.terrain, worldData.orientation);
		this.presenter = new TerrainPresenter(this.model);
		this.view = new TerrainView(this.presenter, dataAccess);
		
		this.view.initialize();		
	}
}

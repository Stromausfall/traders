package net.matthiasauer.traders;


import net.matthiasauer.traders.model.world.World;
import net.matthiasauer.traders.model.world.cities.Cities;
import net.matthiasauer.traders.model.world.terrain.Terrain;
import net.matthiasauer.traders.persistence.AssetDataAccess;
import net.matthiasauer.traders.persistence.IDataAccess;
import net.matthiasauer.traders.persistence.ISerializer;
import net.matthiasauer.traders.persistence.JSONSerializer;
import net.matthiasauer.traders.persistence.data.GameData;
import net.matthiasauer.traders.persistence.data.WorldData;
import net.matthiasauer.traders.presenter.world.cities.CitiesPresenter;
import net.matthiasauer.traders.presenter.world.terrain.TerrainPresenter;
import net.matthiasauer.traders.view.world.cities.CitiesView;
import net.matthiasauer.traders.view.world.terrain.TerrainView;
import openfl.Lib;
import openfl.display.Sprite;

class Main extends Sprite {
	private var terrainView:TerrainView;
	private var terrainPresenter:TerrainPresenter;
	private var terrainModel:Terrain;
	
	private var citiesView:CitiesView;
	private var citiesPresenter:CitiesPresenter;
	private var citiesModel:Cities;
	
	
	private var data:GameData;
	
	
	public function new () {
		super ();
		
		// get data
		var dataAccess:IDataAccess = new AssetDataAccess();
		var json:ISerializer = new JSONSerializer(dataAccess);
		this.data = json.deserialize("map.json");
		
		var worldData:World = new World(this.data.world);
		
		this.terrainModel = new Terrain(this.data.world.terrain, worldData.orientation);
		this.terrainPresenter = new TerrainPresenter(this.terrainModel);
		this.terrainView = new TerrainView(this.terrainPresenter, dataAccess);
		this.addChild(this.terrainView);
		this.terrainView.initialize();
		this.terrainView.x = 200;
		this.terrainView.y = 200;
		
		this.citiesModel = new Cities(this.data.world.cities, worldData.orientation);
		this.citiesPresenter = new CitiesPresenter(this.citiesModel);
		this.citiesView = new CitiesView(this.citiesPresenter, dataAccess);
		this.addChild(this.citiesView);
		this.citiesView.initialize();
		this.citiesView.x = 200;
		this.citiesView.y = 200;
	}
}

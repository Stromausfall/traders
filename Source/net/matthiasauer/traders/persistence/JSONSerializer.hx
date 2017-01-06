package net.matthiasauer.traders.persistence;
import haxe.Json;
import net.matthiasauer.traders.persistence.data.GameData;

/**
 * ...
 * @author 
 */
class JSONSerializer implements ISerializer
{
	private var dataAccess:IDataAccess;
	
	public function new(dataAccess:IDataAccess) 
	{
		this.dataAccess = dataAccess;
	}
	
	public function deserialize(assetId:String) : GameData
	{
		// first retireve the data
		var serializedData:String = this.dataAccess.getString(assetId);
		
		// then deserialize it
		var deserializedData:GameData = Json.parse(serializedData);
		
		return deserializedData;
	}
}
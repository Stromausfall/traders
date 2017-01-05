package net.matthiasauer.traders.persistence;
import haxe.Json;

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
	
	public function deserialize(assetId:String) : MapData
	{
		// first retireve the data
		var serializedData:String = this.dataAccess.getString(assetId);
		
		// then deserialize it
		var deserializedData:MapData = Json.parse(serializedData);
		
		return deserializedData;
	}
}
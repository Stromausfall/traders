package net.matthiasauer.traders.view;
import lime.utils.DataView;

/**
 * @author 
 */
class GUIData 
{
	public var data:String;
	
	private function new(data:String) {
		this.data = data;
	}
	
	public static var Mountain:GUIData = new GUIData("Mountain.svg");
	public static var Grass:GUIData = new GUIData("Grassland.svg");
	public static var City:GUIData = new GUIData("City.svg");
}
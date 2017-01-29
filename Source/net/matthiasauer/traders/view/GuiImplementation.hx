package net.matthiasauer.traders.view;

import haxe.Int64;
import haxe.Int64Helper;
import net.matthiasauer.traders.persistence.IDataAccess;
import net.matthiasauer.utils.hexmap.IOffsetCoordinate;
import openfl.Lib;
import openfl.display.Sprite;

class GuiImplementation extends Sprite implements IGui
{
	private var idGenerator:IDGenerator;
	private var svgUtils:SVGUtils;
	
	private var data:Map<Int64, Sprite>;

	public function new(dataAccess:IDataAccess, root:Sprite) 
	{
		super();
		
		this.idGenerator = new IDGenerator();
		this.svgUtils = new SVGUtils(dataAccess);
		this.data = new Map<Int64, Sprite>();
		
		// attach the gui to the root
		root.addChild(this);
	}
	
	
	public function createElement(data:GUIData, coordinate:IOffsetCoordinate) : Int64 {
		var id:Int64 = this.idGenerator.getNext();
		var element:Sprite = this.svgUtils.createAndPosititonSVG(coordinate, data.data);
		
		// store the newly created element
		this.data.set(id, element);
		
		// add the element to the gui
		this.addChild(element);
		
		return id;
	}
}
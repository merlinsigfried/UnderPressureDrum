package com.drum.game.worlds 
{
	import com.drum.game.entities.Concrete;
	import com.drum.game.entities.Azael;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author BTG
	 */
	public class Level 
	{
		
		[Embed(source='/com/drum/game/assets/fondo.png')]
		public static const BACKGROUND:Class;
		
		private var background_:Entity = new Entity(0,0,new Image(BACKGROUND))
		public var mundo:BaseWorld;
		public var player_:Azael = null;
		public var concrete_:Array = new Array();
		
		public function Level(xml:XML, m:BaseWorld) 
		{
			mundo = m;
			
			//xml nivel
			var dataElement:XML = null;
			
			//agregamos las paredes y el piso
			var dataList:XMLList = xml.piso_pared.tile;
			for each (dataElement in dataList)
			{
				var concrete:Concrete = new Concrete(int(dataElement.@x), int(dataElement.@y));
				this.concrete_.push(concrete);
			}
			
			//agregamos el jugador
			this.player_ = new Azael( this, int(xml.objetos.palyer.@x), int(xml.objetos.palyer.@y));
			
			addToWorld();
		}
		
		public function addToWorld():void {
			
			mundo.add(this.background_);
			
			var entity:Entity = null;
			
			for each(entity in this.concrete_)
			{
				mundo.add(entity);
			}
			mundo.add(player_);
			
		}
		
	}

}
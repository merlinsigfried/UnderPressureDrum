package com.drum.game.entities 
{
	
	import com.drum.base.entities.FPDrumEntity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.graphics.Image;
	
	public class Concrete extends FPDrumEntity
	{
		[Embed(source='/com/drum/game/assets/pared_piso.png')]
		public static const WALL_TEXTURE:Class;
		
		public static const TIPO:String = "CONCRETE";
		
		public var tile:Tilemap;
		
		public function Concrete(x:Number=0, y:Number=0)
		{
			var img:Image = new Image(WALL_TEXTURE);
			this.graphic = img;
			this.x = x;
			this.y = y;
			this.type = Concrete.TIPO;
			collidable = true;
			this.width = img.width;
			this.height = img.height;
		}
	}
}
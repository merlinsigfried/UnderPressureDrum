package com.drum.game.entities.weapons
{
	import com.drum.base.entities.IWeapon;
	import com.drum.base.entities.Prop;
	
	import flash.geom.Point;
	
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Canvas;
	
	public class DeathRay extends Prop implements IWeapon
	{
		/**
		 * Imagen del rayo
		 * */
		private var graphic_ray_:Canvas = new Canvas(800,600);
		
		public function DeathRay(x:Number=0, y:Number=0)
		{	
			super(x, y, this.graphic_ray_);
		}
		
		private function drawRay(from:Point,to:Point)
		{
			this.graphic_ray_
		}
		
		
		public function fire():void
		{
		}
	}
}
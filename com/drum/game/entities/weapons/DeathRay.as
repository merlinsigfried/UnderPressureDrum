package com.drum.game.entities.weapons
{
	import com.drum.base.entities.IWeapon;
	import com.drum.base.entities.Prop;
	import com.drum.game.entities.Concrete;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Canvas;
	
	public class DeathRay extends Prop implements IWeapon
	{
		/**
		 * Alcance del arma
		 * */
		public static const RANGE:uint = 800;
		/**
		 * Duracion del rayo (ms)
		 * */
		public static const RAY_DURATION:uint = 20;
		/**
		 * Tipo del rayo (colision)
		 * */
		public static const TYPE:String = "weapon";
		
		/**
		 * Imagen del rayo
		 * */
		private var graphic_ray_:Canvas = new Canvas(800,600);
		/**
		 * Direccion a la que apunta el arma
		 * */
		private var aim_:Point = new Point(0,0);
		/**
		 * Controla la duracion del rayo
		 * */
		private var gun_timer_:Timer = new Timer(RAY_DURATION,0);
		/**
		 * Verdadero si esta disparando
		 * */
		private var firing_:Boolean = false;
		
		
		public function DeathRay(x:Number=0, y:Number=0)
		{	
			super(x, y, this.graphic_ray_,null);
			this.type = "weapon";
			this.graphic_ray_.blend = BlendMode.LIGHTEN;
			this.gun_timer_.addEventListener(TimerEvent.TIMER,this.stopFire,false,0,true);
		}
		
		public function aim(direction:Point):void
		{
			this.aim_ = direction;
		}
		
		/**
		 * 
		 * @param from
		 * @param to
		 * @return 
		 * 
		 */
		private function drawRay(to:Point):void
		{
			this.visible = true;
			this.aim_.normalize(RANGE);
			var ray:Sprite = new Sprite();
			var bd:BitmapData = new BitmapData(800,600,true,0xFFFFFF);
			ray.graphics.lineStyle(3,0xFF0000);
			ray.graphics.moveTo(0,0);
			ray.graphics.lineTo(to.x,to.y);
			bd.draw(ray);
			if (this.aim_.x>=0)
			{
				this.graphic.x=0;
			}
			else
			{
				this.graphic.x = this.aim_.x;	
			}
			this.graphic_ray_.draw(0,0,bd);
		}
		
		private function stopFire(e:Event):void
		{
			this.visible = false;
			this.firing_ = false;
			this.gun_timer_.stop();
		}

		public function fire():void
		{
			this.drawRay(this.aim_);
			this.firing_ = true;
			this.gun_timer_.start();
		}
		
		public override function update():void
		{
			super.update();
			if (this.firing_)
			{
				var collidee:Entity = FP.world.collideLine(Concrete.TIPO,this.x,this.y,this.x+this.aim_.x,this.y+this.aim_.y,10);
				if (collidee != null)
				{
					FP.world.remove(collidee);
				}
			}
		}
	}
}
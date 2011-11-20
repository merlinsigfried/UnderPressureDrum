package com.drum.game.entities
{
	import com.drum.base.entities.Actor;
	import com.drum.base.entities.Player;
	
	import flash.geom.Point;
	
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class GuyBrush extends Player
	{
		public static const TYPE:String = "GUY";
		
		[Embed (source = '/assets/images/player.png')]
		private var PLAYER_SPRITE:Class;
		
		//Indica el numero minimo de pixeles/frame para considerar que hay movimiento
		//Cuando la velocidad baja de este valor, no actualizamos mas el movimiento de guy
		public static const FREEZE_SPEED:Number = 0.01;
		
		//Indice de rozamiento de Guy contra el piso, medida en porcentaje de conservacion/frame
		private var damping_:Number = 0.90;
		//Aceleracion de Guy cuando comienza a correr, medida en proporcion de maxima velocidad
		private var throttle_:Number = 0.2;
		//Maxima velocidad que guy puede alcanzar
		private var top_speed_:Number = 500;
		
		public function GuyBrush(x:Number, y:Number)
		{
			//Imagen del jugador
			var img:Image = new Image(PLAYER_SPRITE);
			super(x, y, img);
			this.height = 50;
			this.width = 50;
			//Acciones
			this.registerActions();
			//registrar controles
			this.registerKeyForControl("MOVE_LEFT",Key.LEFT);
			this.registerKeyForControl("MOVE_RIGHT",Key.RIGHT);
			this.registerKeyForControl("RESET",Key.M);
		}
		
		private function registerActions():void
		{
			this.registerAction("MOVE_LEFT",this.moveLeft);
			this.registerAction("MOVE_RIGHT",this.moveRight);
			this.registerAction("RESET",this.resetPlayer);
		}
		
		public override function update():void
		{
			super.update();
			this.applyDamping();
		}
		
		public override function get xml_label():String
		{
			return "GUY";
		}
		
		private function moveLeft():void
		{
			this.is_moving_ = true;
			this.velocity_.x += -1*this.top_speed_*this.throttle_;
			if (this.velocity_.x<-1*this.top_speed_)
			{
				this.velocity_.x = -1*this.top_speed_;
			}
		}
		
		private function moveRight():void
		{
			this.is_moving_ = true;
			this.velocity_.x += this.top_speed_*this.throttle_;
			if (this.velocity_.x>this.top_speed_)
			{
				this.velocity_.x = this.top_speed_;
			}
		}
		
		private function resetPlayer():void
		{
			this.x=this.y=0;
			this.velocity_ = new Point(0,0);
		}
		
		private function applyDamping():void
		{
			//RMultiplicamos la velocidad por el rozamiento
			this.velocity_.x = this.velocity_.x * this.damping_;
		}
		
		
	}
}
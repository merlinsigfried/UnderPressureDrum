package com.drum.game.entities 
{
	import com.drum.base.entities.Player;
	import flash.geom.Point;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import com.drum.game.worlds.Level
	/**
	 * ...
	 * @author BTG
	 */
	public class Azael extends Player 
	{
		public static const TYPE:String = "AZAEL";
		
		[Embed(source = '/com/drum/game/assets/player.png')] private const IMG_PLAYER:Class;
		
		//private var velocity_:Point;
		private var _moverse:Boolean;
		private var level:Level;
		private var img:Image;
		
		//Maxima velocidad que guy puede alcanzar
		private var top_speed_:Number = 2;
		//velocidad del salto
		private var jumpSpeed:uint = 7;
		//indica si el jugador esta cayendo
		private var falling:Boolean = false;
		//indica si el jugador esta esaltando
		private var jumping:Boolean = false;
		//valor de la gravedad
		private var gravity:Number = 0.20;
		
		public function Azael( l:Level, x:int, y:int) 
		{
			super(x, y);
			img = new Image(IMG_PLAYER);
			//img.centerOrigin();
			this.graphic = img;
			this.x = x;
			this.y = y;
			level = l;
			this.type = "PLAYER";
			collidable = true;
			this.width = img.width;
			this.height = img.height;
			velocity_ = new Point();
		}
		
		override public function update():void 
		{
			_moverse = false;
			
			if (Input.check(Key.W) && !jumping && !falling) {
				velocity_.y = -jumpSpeed;
				jumping = true;
			}
			if (Input.check(Key.A)) {
				this.velocity_.x = -top_speed_;
				this.img.flipped = true;
				_moverse = true;

			}
			if (Input.check(Key.D)) {
				this.velocity_.x = top_speed_;
				this.img.flipped = false;
				_moverse = true;
			}
			
			//aplicar gravedad
			if(jumping || falling){
				velocity_.y += gravity;
			}
			
			if(_moverse){
					
				if (! revisarColisionesX()) {
					this.x += velocity_.x;
				}
			}
			
			if (! revisarColisionesY()) {
				this.y += velocity_.y;
			}
			
			
		}
		
		public function revisarColisionesX():Boolean {
			
			if (collide(Concrete.TIPO, x+velocity_.x, y)) {
				return true;
			}
			return false;
		}
		
		public function revisarColisionesY():Boolean {
			
			if (collide(Concrete.TIPO, x, y + velocity_.y)) {
				
				if (jumping) {
					velocity_.y = 0;
					jumping = false;
					falling = true;
				}else if (falling) {
					falling = false;
					velocity_.y = 0;
				}
			
				return true;
			}
			falling = true;
			return false;
		}
		
	}

}
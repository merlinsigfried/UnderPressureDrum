package com.drum.game.entities 
{
	import com.drum.base.entities.Player;
	import com.drum.game.entities.weapons.DeathRay;
	import com.drum.game.worlds.Level;
	
	import flash.geom.Point;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

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
				this.my_weapon_.aim(new Point(-1,0));
				_moverse = true;

			}
			if (Input.check(Key.D)) {
				this.my_weapon_.aim(new Point(1,0));
				this.velocity_.x = top_speed_;
				this.img.flipped = false;
				_moverse = true;
			}
			//PRUEBA DE ARMAS
			if (Input.check(Key.CONTROL))
			{
				this.my_weapon_.fire();
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
		
		/**
		 * PRUEBA DE ARMAS
		 * */
		private var my_weapon_:DeathRay = null;
		public override function added():void
		{
			//Añadir el arma
			super.added();
			this.my_weapon_ = new DeathRay(this.x,this.y+this.height/2);
			FP.world.add(this.my_weapon_);
		}
		
		public override function removed():void
		{
			super.removed();
			FP.world.remove(this.my_weapon_);
		}
		
		public override function set x(val:Number):void
		{
			super.x = val;
			if (this.my_weapon_ != null)
			{
				this.my_weapon_.x = val + this.width/2;
			}
		}
		
		public override function set y(val:Number):void
		{
			super.y=val;
			if (this.my_weapon_!=null)
				this.my_weapon_.y=val+this.height/2;
		}
		
	}

}
package com.drum.base.entities
{
	
	import flash.errors.IllegalOperationError;
	import flash.geom.Point;
	
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	/**
	 * Representa un actor del juego, es decir, una entidad que se mueve
	 * por voluntad propia como el jugador y los enemigos. Define acciones,
	 * que son las cosas que hace este actor.
	 * @author Alvaro Martinez
	 * */
	public class Actor extends FPDrumEntity
	{
		/**
		 * Vector velocidad con la cual se esta moviendo esta entidad
		 * */
		protected var velocity_:Point = new Point(0,0);
		/**
		 * Vale verdadero si el actor esta en movimiento
		 * */
		protected var is_moving_:Boolean = false;
		/**
		 * Velocidad por debajo de la cual se considera que el actor esta
		 * quieto. Ojo, este valor aplica para cada dimension, no es la norma
		 * del vector velocidad
		 * */
		protected var freeze_speed_:Number = 0;
		
		/**
		 * Mapa de acciones, en donde la llave es un String identificador de
		 * la accion y el valor es un Functor hacia dicha accion.
		 * */
		protected var actions_:Object = new Object();
		
		public function Actor(x:Number,y:Number,graphic:Graphic = null, mask:Mask = null)
		{
			super(x,y,graphic,mask);
		}
		
		public override function get xml_label():String
		{
			throw new IllegalOperationError("Metodo abstracto, no debe instanciar esta clase");
		}
		
		/**
		 * Obtiene el vector velocidad con el cual este actor se esta moviendo
		 * actualmente 
		 * @return Vector velocidad del objeto
		 * 
		 */
		public function get velocity():Point
		{
			return new Point(this.velocity_.x,this.velocity_.y);
		}
		
		/**
		 * Registra una accion que lleva a cabo el actor en un mapa de acciones
		 * que puede ser usado por codigos genericos de IA o por el jugador mediante
		 * los controles
		 * @param name Nombre identificador de la accion
		 * @param functor Functor que se ejecutara cuando la accion sea invocada
		 * 
		 */
		protected function registerAction(name:String,functor:Function):void
		{
			this.actions_[name]=functor;
		}
		
		/**
		 * Ejecuta la accion de este actor
		 * */
		public function doAction(action:String):void
		{
			var f:Function = this.actions_[action];
			if (f==null)
			{
				throw new ArgumentError("Este actor no implementa la accion especificada");
			}
			f.apply();
		}
		
		/** 
		 * Actualiza la posicion dependiendo del valor de la velocidad X
		 */
		protected function applyMovementX():void
		{
			if (!this.is_moving_)
				return;
			this.x+=FP.elapsed*this.velocity_.x;
			if (Math.abs(this.velocity_.x)<=this.freeze_speed_)
			{
				this.velocity_.x=0;
				this.is_moving_=false;
			}
		}
		
		protected function applyMovementY():void
		{
			this.y+=FP.elapsed*this.velocity_.y;
		}
		
		/**
		 * Aplica gravedad a este actor, haciendolo caer 
		 * @param g Aceleracion de la gravedad pixeles/segundo cuadrado
		 * 
		 */
		public function applyGravity(g:Number):void
		{
			this.velocity_.y += g*FP.elapsed;
		}
		
		/**
		 * Actualizacion del actor
		 * */
		public override function update():void
		{
			super.update();
			this.applyMovementX();
			this.applyMovementY();
		}
	}
}
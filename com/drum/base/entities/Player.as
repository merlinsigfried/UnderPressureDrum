package com.drum.base.entities
{
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * Clase que representa el jugador, el cual tiene
	 * la facultad de enlazar controles a sus acciones.
	 * @author Alvaro Martinez
	 * 
	 */
	public class Player extends Actor
	{
		/**
		 * Mapa de controles, los cuales estan enlazados a las acciones que
		 * el jugador hace. La llave es un codigo de tecla, el valor es la
		 * accion que se debe ejecutar
		 * */
		protected var controls_:Object = new Object();
		
		public function Player(x:Number, y:Number, graphic:Graphic=null, mask:Mask=null)
		{
			//TODO: implement function
			super(x, y, graphic, mask);
		}
		
		public function registerKeyForControl(action:String,key_code:int):void
		{
			//Buscamos si la accion ha sido definida para este actor
			var f:Object = this.actions_[action];
			if (f==null)
			{
				throw new ArgumentError("Este actor no define una accion con ese nombre");
			}
			this.controls_[key_code] = action;
		}
		
		public function updateInput():void
		{
			for (var item:Object in this.controls_)
			{
				if (Input.check(item))
				{
					this.doAction(this.controls_[item]);
				}
			}
		}
		
		public override function update():void
		{
			this.updateInput();
			super.update();
		}
	}
}
package com.drum.game.worlds 
{
	import com.drum.base.worlds.DrumWorld;

	/**
	 * ...
	 * @author BTG
	 */
	public class BaseWorld extends DrumWorld 
	{
		
		public var manejadorLevels:ManejadorLevels;
		
		public function BaseWorld() 
		{
			super();
			manejadorLevels = new ManejadorLevels(this, 1);
			manejadorLevels.siguienteNivel();
		}
		
		override public function update():void 
		{
			super.update();
			
		}
		
	}

}
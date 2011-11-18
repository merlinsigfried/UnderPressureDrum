package com.drum.base.screens
{
	import com.drum.base.worlds.DrumWorld;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * Base para los mtores de juego 
	 * @author Alvaro Martinez
	 * 
	 */
	public class DrumEngine extends Engine
	{
		//Mundo actualmente dentro del motor
		private var world_:DrumWorld = null;
		
		public function DrumEngine(width:uint, height:uint, frameRate:Number=60, fixed:Boolean=false)
		{
			//TODO: implement function
			super(width, height, frameRate, fixed);
		}
		
		//Agrega un mundo al motor
		public function addWorld(world:DrumWorld):void
		{
			this.world_ = world;
			FP.world = this.world_;
		}
	}
}
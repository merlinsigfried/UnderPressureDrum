package com.drum.base.worlds
{
	import com.drum.base.entities.FPDrumEntity;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.Key;
	
	/**
	 * Base para definir los mundos de juego. 
	 * @author Alvaro Martinez
	 * 
	 */
	public class DrumWorld extends World implements IDrumWorld
	{
		public function DrumWorld()
		{
			super();
		}
		
		public function addDrumEntity(entity:FPDrumEntity):void
		{
			this.add(entity);
		}
		
		public function enableConsole():void
		{
			FP.console.toggleKey = Key.C;
			FP.console.enable();
		}
	}
}
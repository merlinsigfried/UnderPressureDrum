package com.drum.base.entities
{
	import flash.errors.IllegalOperationError;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
		
	public class FPDrumEntity extends Entity implements IDrumEntity
	{
		
		public function FPDrumEntity(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			super(x, y, graphic, mask);
		}
		
		public function get xml_label():String
		{
			throw new IllegalOperationError("Esta clase es abstracta");
		}
		
	}
}
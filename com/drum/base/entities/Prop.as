package com.drum.base.entities
{
	import flash.errors.IllegalOperationError;
	
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	/**
	 * Representa una entidad que se mueve, pero no por voluntad propia, como
	 * una caja, pullas, etc. Parte del escenario que influye en la logica del
	 * juego.
	 * */
	public class Prop extends FPDrumEntity
	{
		public function Prop(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			super(x, y, graphic, mask);
		}
		
		public override function get xml_label():String
		{
			throw new IllegalOperationError("Metodo abstracto, no debe instanciar esta clase");
		}
	}
}
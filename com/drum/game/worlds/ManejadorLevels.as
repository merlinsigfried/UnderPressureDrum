package com.drum.game.worlds 
{
	import flash.utils.ByteArray;
	import com.drum.game.worlds.BaseWorld;
	/**
	 * ...
	 * @author BTG
	 */
	public class ManejadorLevels 
	{
		
		[Embed(source = '/com/drum/game/levels/level1.oel', mimeType = 'application/octet-stream')] public const Level1:Class; 
		
		public var mundo:BaseWorld;
		public var totalNiveles:uint;
		public var numNivelActual:uint;
		
		public function ManejadorLevels(m:BaseWorld, tn:uint) 
		{
			mundo = m;
			totalNiveles = tn;
			numNivelActual = 0;
		}
		
		public function siguienteNivel():Boolean {
			
			numNivelActual++;
			if(numNivelActual <= totalNiveles){
				lanzarNivel();
			}else {
				//fin del juego
				//limpiarMundos();
				return true;
			}
			return false;
		}
		
		public function lanzarNivel():void {
				
				//limpiarMundos();
				
				var xml_file:ByteArray = null;
				xml_file = obtenerXML();
				
				var str:String = xml_file.readUTFBytes( xml_file.length );
				var xml:XML = new XML( str );
				var level:Level = new Level(xml, mundo);			
		}
		
		public function obtenerXML():ByteArray {
			
			switch(numNivelActual) {
				
				case 1: return new Level1();
			}
			
			return null;
		}
	}
}
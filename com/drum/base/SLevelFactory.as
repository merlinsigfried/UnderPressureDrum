package com.drum.base
{
	import com.drum.base.entities.FPDrumEntity;
	import com.drum.base.worlds.DrumWorld;

	/**
	 * Permite cargar un nivel en formato XML a un mundo
	 * utilizando la fabrica de entidades
	 * @author alvaro
	 * 
	 */
	public class SLevelFactory
	{
		public function SLevelFactory()
		{
			
		}
		
		/**
		 * Añade las entidades definidas en un XML al mundo.
		 * Tenga en cuenta que este xml considera que sus hijos
		 * son entidades registradas en la fabrica SLevelFactory 
		 * @param xml XML con la informacion de las entidades. Cada uno
		 * de los atributos del XML sera pasado en orden al constructor de
		 * la entidad. POR EJEMPLO
		 * <caja x="10" y="20"/> invocara Caja(10,20)
		 * @param world Mundo al cual seran cargadas las entidades
		 * @return 
		 * 
		 */
		public static function loadWorld(xml:XML, world:DrumWorld):void
		{
			//Sencillamente iteramos por todos los hijos
			for each (var node:XML in xml.children())
			{
				//Array con los atributos
				var attributes:Array = SLevelFactory.xmlListToArray(node.attributes());
				attributes.unshift(node.localName());
				//Crear la entidad en nuestra fabrica
				var entity:FPDrumEntity = SEntityFactory.Instance.createEntity.apply(null,attributes);
				//Meter la entidad al mundo
				world.addDrumEntity(entity);
			}
		}
		
		/**
		 * Convierte un XMLList en un array 
		 * @param x Lista 
		 * @return Arreglo con los elementos de la lista (cadenas)
		 * 
		 */
		private static function xmlListToArray(x:XMLList):Array 
		{               
			    var a:Array=[], i:String;
			    for (i in x) a[i] = x[i];
			    return a;
		}
	}
}
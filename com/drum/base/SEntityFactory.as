package com.drum.base
{
	import com.drum.base.entities.IDrumEntity;

	/**
	 * Este singleton se encarga de construir la entidad apropiada
	 * dependiendo de la etiqueta XML dada. Proporciona otros servicios
	 * como cast dependiendo de la etiqueta XML. 
	 * @author Alvaro Martinez Rev00
	 * DRUM TEAM
	 * 
	 */
	public class SEntityFactory
	{
		/**
		 * Instancia del singleton
		 * */
		private static var instance_:SEntityFactory = null;
		/**
		 * Diccionario que contiene las llaves de los objetos
		 * */
		private var class_map_:Object = new Object();
		
		public function SEntityFactory(d:dummyfactory)
		{
			
		}
		
		/**
		 * Obtiene la instancia del singleton
		 * */
		public static function get Instance():SEntityFactory
		{
			if (SEntityFactory.instance_ != null)
				return SEntityFactory.instance_;
			SEntityFactory.instance_ = new SEntityFactory(new dummyfactory()); 
			return SEntityFactory.instance_;
		}
		
		/**
		 * Retorna un nuevo objeto del tipo especificado 
		 * @param xml_label Etiqueta que identifica la clase que sera usada para
		 * crear el objeto
		 * @param args Argumentos que toma el constructor de la clase requerida
		 * @return Objeto creado
		 */
		public function create(xml_label:String,... args):IDrumEntity
		{
			args.unshift(xml_label);
			return this.createEntity.apply(null,args);
		}
		
		internal function createEntity(...args):IDrumEntity
		{
			var xml_label:String = args.shift();
			var chosen:Class = this.class_map_[xml_label];
			if (chosen==null)
				throw new ArgumentError("La clase con dicha etiqueta XML no fue encontrada");
			switch (args.length)
			{
				case 0:
					return new chosen();
					break;
				case 1:
					return new chosen(args[0]);
					break;
				case 2:
					return new chosen(args[0], args[1]);
					break;
				case 3:
					return new chosen(args[0], args[1], args[2]);
					break;
				case 4:
					return new chosen(args[0], args[1], args[2], args[3]);
					break;
				case 5:
					return new chosen(args[0], args[1], args[2], args[3], args[4]);
					break;
				case 6:
					return new chosen(args[0], args[1], args[2], args[3], args[4], args[5]);
					break;
				case 7:
					return new chosen(args[0], args[1], args[2], args[3], args[4], args[5], args[6]);
					break;
				case 8:
					return new chosen(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]);
					break;
				case 9:
					return new chosen(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]);
					break;
				case 10:
					return new chosen(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]);
					break;
				case 11:
					return new chosen(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10]);
					break;
				case 12:
			}
			return null;
		}
		
		
		/**
		 * Registra esta clase con la fabrica 
		 * @param xml_label Etiqueta con la que se va a registrar
		 * @param the_class Objeto clase que va a ser registrado
		 * 
		 */
		public function registerClass(xml_label:String,the_class:Class):void
		{
			this.class_map_[xml_label] = the_class;
		}
		
		/**
		 * Retorna verdadero o falso dependiendo de si un objeto fue creado
		 * con la etiqueta XML dada 
		 * @param xml_label Etiqueta identificadora de la clase
		 * @param subject Objeto que sera colocado a prueba
		 * @return Verdadero si subject es del tipo dado por la etiqueta
		 * 
		 */
		public function Is(xml_label:String, subject:Object):Boolean
		{
			var chosen:Class = this.class_map_[xml_label];
			if (chosen==null)
				throw new ArgumentError("La clase con dicha etiqueta XML no fue encontrada");
			var dummy:Object = subject as chosen;
			return dummy!=null;
		}
	}
}

class dummyfactory
{
}
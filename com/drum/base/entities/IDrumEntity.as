package com.drum.base.entities
{
	/**
	 * Interfaz que define una entidad del juego
	 * @author Alvaro Martinez
	 * */
	public interface IDrumEntity
	{
		/**
		 * Obtiene la etiqueta xml con la que esta entidad fue registrada
		 * en la fabrica de entidades
		 * */
		function get xml_label():String;
	}
}
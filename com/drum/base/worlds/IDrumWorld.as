package com.drum.base.worlds
{
	import com.drum.base.entities.FPDrumEntity;
	import com.drum.base.entities.IDrumEntity;

	/**
	 * Interfaz que define un mundo que reciba entidades de tipo
	 * IDrumEntity
	 * @author Alvaro Martinez
	 * 
	 */
	public interface IDrumWorld
	{
		/**
		 * Agrega la entidad al mundo al final del frame actual 
		 * @param entity Entidad que va a ser agregada
		 * 
		 */
		function addDrumEntity(entity:FPDrumEntity):void;
	}
}
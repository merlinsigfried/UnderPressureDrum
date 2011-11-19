package com.drum.base.entities
{
	/**
	 * Esta interfaz modela el comportamiento
	 * de las armas o weapons que posee el
	 * jugador o los enemigos 
	 * @author Alvaro Martinez - DRUM
	 * 
	 */
	public interface IWeapon
	{
		/**
		 * Ordena al arma que dispare o corte, o whatever
		 * */
		function fire():void;
	}
}
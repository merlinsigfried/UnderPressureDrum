package com.drum.game.worlds
{
	import com.drum.base.SEntityFactory;
	import com.drum.base.entities.Actor;
	import com.drum.base.entities.FPDrumEntity;
	import com.drum.base.worlds.DrumWorld;
	
	import mx.charts.chartClasses.NumericAxis;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	public class MainWorld extends DrumWorld
	{
		//Fabrica de entidades
		private var entity_factory_:SEntityFactory = SEntityFactory.Instance;
		//Almacena las entidades agregadas a este mundo
		private var my_entities_:Array = new Array();
		
		//Gravedad de este mundo
		public static const GRAVITY:Number = 100;
		
		//Coordenada Y del "piso"
		private var floor_pos_:Number = 500; 
		
		public function MainWorld()
		{
			super();
			this.addDrumEntity(this.entity_factory_.create("GUY",50,50) as FPDrumEntity);
		}
		
		public override function addDrumEntity(entity:FPDrumEntity):void
		{
			this.my_entities_.push(entity);
			super.addDrumEntity(entity);
		}
		
		public override function update():void
		{
			super.update();
			this.applyGravity();
		}
		
		/**
		 * Aplica gravedad a todas los actores del mundo
		 * */
		private function applyGravity():void
		{
			for each (var entity:FPDrumEntity in this.my_entities_)
			{
				var current_actor:Actor = entity as Actor;
				if (current_actor!=null)
				{
					current_actor.applyGravity(GRAVITY);
					if (current_actor.y >= this.floor_pos_)
						current_actor.y = this.floor_pos_;
				}
			}
		}
		
	}
}
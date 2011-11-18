package com.drum.game.screens
{
	import com.drum.base.SEntityFactory;
	import com.drum.base.screens.DrumEngine;
	import com.drum.game.entities.Azael;
	import com.drum.game.entities.Concrete;
	import com.drum.game.entities.GuyBrush;
	import com.drum.game.worlds.MainWorld;
	import com.drum.game.worlds.BaseWorld;
	
	import net.flashpunk.Engine;
	
	public class MainScreen extends DrumEngine
	{
		public function MainScreen(width:uint, height:uint, frameRate:Number=60, fixed:Boolean=false)
		{
			//TODO: implement function
			super(width, height, frameRate, fixed);
		}
		
		public override function init():void
		{
			super.init();
			this.registerEntities();
			var world:BaseWorld = new BaseWorld();
			world.enableConsole();
			this.addWorld(world);
		}
		
		private function registerEntities():void
		{
			var factory:SEntityFactory = SEntityFactory.Instance;
			factory.registerClass(Azael.TYPE, Azael);
			factory.registerClass(Concrete.TIPO, Concrete);
		}
	}
}
package 
{
	import com.drum.game.screens.MainScreen;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author BTG
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			this.addChild(new MainScreen(960, 640));
			trace("version Nitae");
		}
		
	}
	
}
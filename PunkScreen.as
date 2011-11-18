package 
{	
	import com.drum.game.screens.MainScreen;
	
	import spark.core.SpriteVisualElement;
	
	/**
	 * Superficie de proyeccion para conectar con flex.
	 * Agregará el sprite principal de la aplicacion
	 * */
	public class PunkScreen extends SpriteVisualElement
	{
		public function PunkScreen()
		{
			//TODO: implement function
			super();
			this.addChild(new MainScreen(800,600));
		}
	}
}
package
{
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Main extends MovieClip
	{
		public var player:Player;
		
		public function Main():void
		{
			player = new Player(stage, 320, 240);
			stage.addChild(player);
		} // end of Main function
	} // end of Main class
} // end of class
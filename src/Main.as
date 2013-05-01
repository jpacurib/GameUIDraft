package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	[SWF(width="640", height="480", frameRate="30", backgroundColor="#FFFFFF")]
	public class Main extends Sprite 
	{
		private var myStarling:Starling;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			myStarling = new Starling(GameUI, stage);
			myStarling.antiAliasing = 1;
			myStarling.start();
		}
		
	}
	
}
package  
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.EventDispatcher;
	import starling.events.TouchEvent;
	import flash.system.fscommand;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class GameUI extends Sprite
	{		
		private var btnStart:Button;
		private var btnSetting:Button;
		private var btnExit:Button;
		private var btnBack:Button;
		private var dok:Image;
		
		private var heightButton:Number = 50;
		private var widthButton:Number = 250;
		
		private var myGame:InGame;
		
		public function GameUI() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
		}
		
		private function onAddedtoStage(e:Event):void 
		{
			SetButtonSettings();
			MainMenuAdd();
		}
		
		private function MainMenuAdd():void 
		{
			this.addChild(dok);
			this.addChild(btnStart);
			this.addChild(btnSetting);
			this.addChild(btnExit);
		}
		
		private function MainMenuRemove():void
		{
			this.removeChild(dok);
			this.removeChild(btnStart);
			this.removeChild(btnSetting);
			this.removeChild(btnExit);
		}
		
		private function SetButtonSettings():void 
		{
			//MAIN
			//setting textures
			btnStart = new Button(UIAssets.getUITexture("btnBlue"));
			btnSetting = new Button(UIAssets.getUITexture("btnBrown"));
			btnExit = new Button(UIAssets.getUITexture("btnGreen"));
			btnBack = new Button(UIAssets.getUITexture("btnRed"));
			
			//texts
			btnStart.text = ("PLAY");
			btnSetting.text = ("SETTINGS");
			btnExit.text = ("EXIT");
			btnBack.text = ("BACK");
			
			//events
			btnStart.addEventListener(Event.TRIGGERED, onStartEvent);
			btnSetting.addEventListener(Event.TRIGGERED, onSettingEvent);
			btnExit.addEventListener(Event.TRIGGERED, onExitEvent);
			btnBack.addEventListener(Event.TRIGGERED, onBackEvent);
			
			//centered button X coordinate
			btnStart.x = (stage.stageWidth / 2) - (widthButton / 2);
			btnSetting.x = btnStart.x;
			btnExit.x = btnStart.x;
			btnBack.x = btnExit.x;
			
			//Y coordinate config
			btnStart.y = 150;
			btnSetting.y = btnStart.y + 75;
			btnExit.y = btnSetting.y + 75;
			btnBack.y = btnExit.y;
			
			dok = new Image(UIAssets.getUITexture("dok"));
			dok.x = (stage.stageWidth / 2) - (250);
			dok.y = btnStart.y - 75;
	
		}
		
		private function onBackEvent(e:Event):void 
		{
			this.removeChild(btnBack);
			MainMenuAdd();
		}
		
		private function onStartEvent(e:Event):void 
		{
			myGame = new InGame();
			this.addChild(myGame);
			MainMenuRemove();
		}
		
		private function onSettingEvent(e:Event):void 
		{
			MainMenuRemove();
			onSettingMenus();
			
		}
		
		private function onSettingMenus():void 
		{
			this.addChild(btnBack);
		}
		
		private function onExitEvent(e:Event):void 
		{
			fscommand("quit");	
		}
		
	}

}
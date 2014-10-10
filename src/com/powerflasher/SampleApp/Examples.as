package com.powerflasher.SampleApp {
	
	import flash.sensors.Accelerometer;
	import flash.text.*; 
	import flash.display.*;
 	import flash.events.*;
 	import flash.ui.*; 

	/**
	 * @author Alistair
	 */
	public class Examples extends Sprite {
		
		private var BOX:Sprite = new Sprite();
		private var myTextBox:TextField = new TextField();
		private var myButtonText:TextField = new TextField();
		private var deltaY:Number = 5;
			
		public function Examples() {
			
			myButtonText.text = "Click me!";
			
			BOX.graphics.beginFill(0xFF0000,1);
			BOX.addChild(myButtonText);
        	BOX.graphics.drawRect(0, 0, (myButtonText.textWidth + 2), myButtonText.textHeight);
			BOX.x = (stage.stageWidth/2);
			BOX.y = (stage.stageHeight/2);
        	BOX.graphics.endFill();
			BOX.addEventListener(MouseEvent.CLICK, myButtonAction);
			this.addChild(BOX);
			
			myTextBox.y = 0;
			myTextBox.width = 200; 
			myTextBox.height = 40;
			addChild(myTextBox); 
			myTextBox.text = "Hello";
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);

		}
		
		private function myButtonAction(eventObject:MouseEvent):void {
			stage.addEventListener(Event.ENTER_FRAME,updateBall);
		}
		
		private function updateBall(e:Event):void{
			if (myTextBox.y < (stage.stageHeight - myTextBox.textHeight))
				myTextBox.y += deltaY;
			else 
				stage.removeEventListener(Event.ENTER_FRAME, updateBall);
		}
		
		private function KeyDown(event:KeyboardEvent):void{
    		if (event.keyCode == Keyboard.RIGHT){
				stage.removeEventListener(Event.ENTER_FRAME, updateBall);
				myTextBox.y = 0;
			}
		} 

	}
}

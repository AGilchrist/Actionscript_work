package com.powerflasher.Tetris {
	
	import flash.text.*; 
	import flash.display.*;
 	import flash.events.*;
 	import flash.ui.*; 
	
	/**
	 * @author Alistair
	 */

	public class Tetris_Game extends Sprite {
		
		private var tetrominoArray:Array = ["line", "square", "t-block", "s-block", "reverse-s-block", "l-block", "reverse-l-block"];
		private var colourArray:Array = new Array(0xFFFF33, 0x79DCF4, 0xFF3333, 0xFFCC33, 0x99CC33, 0xCC3399);
		private var activeBlock:tetromino;
		private var fallSpeed:int = 5;
		private var windowWidth:int = 300;
		private var windowHeight:int = 500;
		private var windowBorder:Shape = new Shape();
		private var startButton:Sprite = new Sprite();
		private var myButtonText:TextField = new TextField();
		
		
		public function Tetris_Game()
		{
			
			startButton.graphics.beginFill(0xFF0000,1);
			//startButton.addChild(myButtonText);
        	startButton.graphics.drawRect(0, 0, 60, 40);
			startButton.x = (stage.stageWidth/2);
			startButton.y = (stage.stageHeight/2);
        	startButton.graphics.endFill();
			startButton.addEventListener(MouseEvent.CLICK, startGame);
			this.addChild(startButton);
		}
		
		private var colourID:int;
		private var blockID:int;
		private var i:int;
		
		private function startGame(eventObject:MouseEvent):void
		{
			removeChild(startButton);
			windowBorder.graphics.lineStyle(3, 0x000000);
			windowBorder.graphics.beginFill(0xFFFFFF);
			windowBorder.graphics.drawRect(0, 0, windowWidth, windowHeight);
			windowBorder.graphics.endFill();
			windowBorder.x = ((stage.stageWidth/2)-(windowWidth/2));
			windowBorder.y = (stage.stageHeight - windowHeight);
			this.addChild(windowBorder);
			myButtonText.width = 100;
			myButtonText.height = 80;
			this.addChild(myButtonText)
			selectBlock();
		}
				
		private function selectBlock():void
		{
			colourID = Math.random() * colourArray.length;
			blockID = Math.random() * tetrominoArray.length;
			switch(blockID){
				case 0: activeBlock = new line_piece(); break;
				case 1: activeBlock = new square(); break;
				case 2: activeBlock = new tBlock(); break;
				case 3: activeBlock = new sBlock(); break;
				case 4: activeBlock = new reverseSBlock(); break;
				case 5: activeBlock = new lBlock(); break;
				case 6: activeBlock = new reverseLBlock(); break;
				default: activeBlock = new line_piece(); break; 
			}
			activeBlock.drawShape(colourArray[colourID], stage);
			this.addChild(activeBlock);
			stage.addEventListener(Event.ENTER_FRAME, blockFall);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
		}
		
		private function blockFall(e:Event):void
		{
			myButtonText.text = "colourID x = " + colourID + ",\n" + "BlockID = " + blockID;
			
			if (activeBlock.y < stage.stageHeight)
				activeBlock.y += fallSpeed;
			else
			{
				activeBlock.y = stage.stageHeight;
				stage.removeEventListener(Event.ENTER_FRAME, blockFall);
				selectBlock();
			}
		}
		
		private function KeyDown(event:KeyboardEvent):void{
    		if (event.keyCode == Keyboard.RIGHT)
			{
				if(activeBlock.x < ((windowWidth/2)-activeBlock.getWidth()))
					activeBlock.x += activeBlock.getWidth();
			}
			if (event.keyCode == Keyboard.LEFT)
			{
				if(activeBlock.x > ((windowWidth/2)*-1))
					activeBlock.x -= activeBlock.getWidth();
			}
			if (event.keyCode == Keyboard.DOWN)
			{
				activeBlock.y += 5;
			}
		}
	}
	
}

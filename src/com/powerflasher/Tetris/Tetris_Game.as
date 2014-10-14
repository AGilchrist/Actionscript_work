package com.powerflasher.Tetris {
	
	import flash.text.*; 
	import flash.display.*;
 	import flash.events.*;
	import flash.ui.*;
	import flash.geom.Matrix;
	
	/**
	 * @author Alistair
	 */

	public class Tetris_Game extends Sprite {
		
		private var tetrominoArray:Array = ["line", "square", "t-block", "s-block", "reverse-s-block", "l-block", "reverse-l-block"];
		private var colourArray:Array = new Array(0xFFFF33, 0x79DCF4, 0xFF3333, 0xFFCC33, 0x99CC33, 0xCC3399);
		private var activeBlock:tetromino;
		private var blockarray:Array = new Array();
		private var fieldArray:Array;
		
		private var fallSpeed:int = 5;
		private var windowWidth:int = 300;
		private var windowHeight:int = 500;
		private var i:int;
		private var j:int;
		private var coloumnNum:int;
		
		private var rightBorder:Shape = new Shape();
		private var leftBorder:Shape = new Shape();
		private var bottomBorder:Shape = new Shape();
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
			
			fieldArray = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];
			
		}
		
		private var colourID:int;
		private var blockID:int;
		
		private function startGame(eventObject:MouseEvent):void
		{
			removeChild(startButton);
		
			rightBorder.graphics.beginFill(0x000000);
			rightBorder.graphics.drawRect(((stage.stageWidth/2)+(windowWidth/2)), 0, stage.stageWidth, windowHeight);
			rightBorder.graphics.endFill();
			this.addChild(rightBorder);
			
			leftBorder.graphics.beginFill(0x000000);
			leftBorder.graphics.drawRect(0, 0, ((stage.stageWidth/2)-(windowWidth/2)), windowHeight);
			leftBorder.graphics.endFill();
			this.addChild(leftBorder);
			
			bottomBorder.graphics.beginFill(0x000000);
			bottomBorder.graphics.drawRect(((stage.stageWidth/2)-(windowWidth/2)), stage.stageHeight, ((stage.stageWidth/2)+(windowWidth/2)), (stage.stageHeight + 5));
			bottomBorder.graphics.endFill();
			this.addChild(bottomBorder);
			
			myButtonText.textColor = 0xFFFFFF;
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
			coloumnNum = 5;
			stage.addEventListener(Event.ENTER_FRAME, blockFall);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
		}
		
		private function blockFall(e:Event):void
		{
			myButtonText.text = "" + fieldArray[0][5];
			
			activeBlock.y += fallSpeed;
			
			if (activeBlock.hitTestObject(bottomBorder))
			{
				activeBlock.y = activeBlock.y;
				stage.removeEventListener(Event.ENTER_FRAME, blockFall);
				fieldArray[0][coloumnNum] = 1;
				selectBlock();
			}
		}
		
		private function KeyDown(event:KeyboardEvent):void{
    		if (event.keyCode == Keyboard.RIGHT)
			{
				if(!activeBlock.hitTestObject(rightBorder)){
					activeBlock.x += activeBlock.getWidth();
					coloumnNum ++;
				}
			}
			if (event.keyCode == Keyboard.LEFT)
			{
				if(!activeBlock.hitTestObject(leftBorder)){
					activeBlock.x -= activeBlock.getWidth();
					coloumnNum --;
				}
			}
			if (event.keyCode == Keyboard.DOWN)
			{
				if(!activeBlock.hitTestObject(bottomBorder))
					activeBlock.y += 5;
			}
			if(event.keyCode == Keyboard.A)
			{
				
			}
			if(event.keyCode == Keyboard.D)
			{
				
			}			
		}
		
	}
	
}

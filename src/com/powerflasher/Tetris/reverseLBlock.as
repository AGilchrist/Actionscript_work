package com.powerflasher.Tetris {
	
	import com.powerflasher.Tetris.tetromino;
	import flash.display.*;

	/**
	 * @author Alistair
	 */
	public class reverseLBlock extends tetromino {
		
		public function reverseLBlock() {
			
		}
		
		override public function drawShape(colourID:int, screen:Stage):void
	{
		Sprite1.graphics.lineStyle(3, 0x000000);
		Sprite1.graphics.beginFill(colourID,1);
		Sprite1.graphics.drawRect(0, 0, BlockWidth, BlockHeight);
		Sprite1.x = screen.stageWidth/2;
		Sprite1.y = (0 - BlockHeight);
		Sprite1.graphics.endFill();
		addChild(Sprite1);
		
		Sprite2.graphics.lineStyle(3, 0x000000);
		Sprite2.graphics.beginFill(colourID,1);
		Sprite2.graphics.drawRect(0, 0, BlockWidth, BlockHeight);
		Sprite2.x = screen.stageWidth/2;
		Sprite2.y = (0 - (BlockHeight*2));
		Sprite2.graphics.endFill();
		addChild(Sprite2);
		
		Sprite3.graphics.lineStyle(3, 0x000000);
		Sprite3.graphics.beginFill(colourID,1);
		Sprite3.graphics.drawRect(0, 0, BlockWidth, BlockHeight);
		Sprite3.x = screen.stageWidth/2;
		Sprite3.y = (0 - (BlockHeight*3));
		Sprite3.graphics.endFill();
		addChild(Sprite3);
		
		Sprite4.graphics.lineStyle(3, 0x000000);
		Sprite4.graphics.beginFill(colourID,1);
		Sprite4.graphics.drawRect(0, 0, BlockWidth, BlockHeight);
		Sprite4.x = (screen.stageWidth/2 - BlockWidth);
		Sprite4.y = (0 - BlockHeight);
		Sprite4.graphics.endFill();
		addChild(Sprite4);
	}
	
		override public function getSprites():Array
		{
			SpriteArray[0] = 8;
			SpriteArray[1] = 8;
			SpriteArray[2] = 4;
			return SpriteArray;
		}
	
	}
}

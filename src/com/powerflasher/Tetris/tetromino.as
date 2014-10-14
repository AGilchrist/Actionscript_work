package com.powerflasher.Tetris {
	
	import flash.display.*;
	
	/**
	 * @author Alistair
	 */
	public class tetromino extends Sprite {
		
		protected var Sprite1:Sprite = new Sprite;
		protected var Sprite2:Sprite = new Sprite;
		protected var Sprite3:Sprite = new Sprite;
		protected var Sprite4:Sprite = new Sprite;
		protected var SpriteArray:Array = new Array;
		protected var BlockWidth:int = 30;
		protected var BlockHeight:int = 30;
		
		public function drawShape(colourID:int, screen:Stage):void {
			
		}
		
		public function getWidth():int
		{
			return BlockWidth; 
		}
		
		public function getSprites():Array
		{
		 	return SpriteArray;
		}
		
	}
	
}

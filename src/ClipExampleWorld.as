package  
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	
	/**
	 * An example of using image clipping to create a filling effect.
	 * @author Zachary Lewis (http://zacharylew.is)
	 */
	public class ClipExampleWorld extends World 
	{
		protected var heartBackground:Image;
		protected var heartFill:Image;
		
		protected var clippingMask:BitmapData;
		protected var clippingArea:Rectangle;
		
		[Embed(source = "crowned-heart.png")]
		protected var heart:Class;
		
		public function ClipExampleWorld() 
		{
			super();
			heartBackground = new Image(heart);
			heartBackground.alpha = 0.1;
			
			clippingMask = new BitmapData(200, 200, true, 0x00ffffff);
			
			clippingArea = new Rectangle(0, 0, 200, 200);
			
			heartFill = new Image(heart);
			heartFill.color = 0xff3333;
			heartFill.drawMask = clippingMask;
		}
		
		override public function begin():void 
		{
			super.begin();
			
			addGraphic(heartBackground, 0, 28, 22);
			addGraphic(heartFill, 1, 28, 22);
		}
		
		protected function updateFill(width:uint):void
		{
			clippingArea.width = width;
			
			// Clear the old rectangle.
			clippingMask.fillRect(clippingMask.rect, 0x00ffffff);
			
			// Apply the new fill.
			clippingMask.fillRect(clippingArea, 0xffffffff);
			
			heartFill.drawMask = clippingMask;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (mouseX > 28 && mouseX < 228)
			{
				var maskWidth:uint = Math.floor(mouseX - 28);
				updateFill(maskWidth);
			}
			
			
			
		}
		
	}

}
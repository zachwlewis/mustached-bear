package 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	[SWF(width="256", height="244", backgroundColor="#222222")]
	
	/**
	 * An example of using image clipping to create a filling effect.
	 * @author Zachary Lewis (http://zacharylew.is)
	 */
	public class ClipExample extends Engine
	{
		
		public function ClipExample():void 
		{
			super(256, 244);
			FP.screen.color = 0x222222;
		}
		
		override public function init():void 
		{
			trace("ClipExample started.");
			super.init();
			FP.world = new ClipExampleWorld();
		}
		
	}
	
}
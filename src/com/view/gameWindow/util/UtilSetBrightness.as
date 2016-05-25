package com.view.gameWindow.util
{
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;

	public class UtilSetBrightness
	{
		public function UtilSetBrightness()
		{
		}
		
		//value取值范围-1~1,对应Flash内容制作工具里的-100%-100%
		public static function setBrightness(obj:DisplayObject,value:Number):void {
			var colorTransformer:ColorTransform = obj.transform.colorTransform
			var backup_filters:* = obj.filters
			if (value >= 0) {
				colorTransformer.blueMultiplier = 1-value
				colorTransformer.redMultiplier = 1-value
				colorTransformer.greenMultiplier = 1-value
				colorTransformer.redOffset = 255*value
				colorTransformer.greenOffset = 255*value
				colorTransformer.blueOffset = 255*value
			}else {
				value=Math.abs(value)
				colorTransformer.blueMultiplier = 1-value
				colorTransformer.redMultiplier = 1-value
				colorTransformer.greenMultiplier = 1-value
				colorTransformer.redOffset = 0
				colorTransformer.greenOffset = 0
				colorTransformer.blueOffset = 0
			}
			　　obj.transform.colorTransform = colorTransformer
			　　obj.filters = backup_filters
		}
	}
}
package com.view.gameWindow.panel.panels.openGift.promote
{
	import com.model.business.fileService.constants.ResourcePathConstants;
	import com.model.gameWindow.rsr.RsrLoader;
	import com.view.gameWindow.panel.panels.openActivity.McOpenJourney;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class PromoteReward extends Sprite
	{
		private var _skin:McOpenJourney;
		private var _view:PromoteRewardViewHandler;
		private var _rsrLoader:RsrLoader;
		public function PromoteReward()
		{
			initSkin();
			initData();
			super();
		}
		
		public function get viewHandler():PromoteRewardViewHandler
		{
			return _view;
		}
		
		public function get skin():McOpenJourney
		{
			return _skin;
		}
		
		
		private function initSkin():void
		{
			// TODO Auto Generated method stub
			_skin = new McOpenJourney();
			addChild(_skin);
			_rsrLoader = new RsrLoader();
			addCallBack(_rsrLoader);
			_rsrLoader.load(_skin,ResourcePathConstants.IMAGE_PANEL_FOLDER_LOAD,true);
			
		}
		
		private function addCallBack(_rsrLoader:RsrLoader):void
		{
			// TODO Auto Generated method stub
			_rsrLoader.addCallBack(_skin.mcScrollBar,function (mc:MovieClip):void//滚动条资源加载完成后构造滚动条控制类
			{
				_view.addScroll(mc);
			});
		}
		private function initData():void
		{
			// TODO Auto Generated method stub
			_view = new PromoteRewardViewHandler(this);
		}
		
		public function destroy():void
		{
			// TODO Auto Generated method stub
			_view.destroy();
			_view = null;
			_rsrLoader.destroy();
			_rsrLoader = null;
			_skin.parent.removeChild(_skin);
			_skin = null;
		}
	}
}
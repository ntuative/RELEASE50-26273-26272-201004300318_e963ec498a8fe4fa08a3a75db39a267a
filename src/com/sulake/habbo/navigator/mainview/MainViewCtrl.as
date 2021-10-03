package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetOfficialRoomsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPopularRoomTagsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.LatestEventsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFavouriteRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFriendsRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomHistorySearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.PopularRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTagSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTextSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWhereMyFriendsAreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWithHighestScoreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.IViewCtrl;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tab;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MainViewCtrl implements IUpdateReceiver, IDisposable
   {
      
      public static const const_515:int = 2;
      
      public static const const_869:int = 4;
      
      private static const const_499:int = 2;
      
      private static const const_774:int = 1;
      
      public static const const_1614:int = 3;
      
      private static const const_1095:int = 4;
      
      private static const SCROLLBAR_WIDTH:int = 22;
      
      public static const const_413:int = 1;
      
      private static const const_773:int = 3;
       
      
      private var var_2024:int = 0;
      
      private var _disposed:Boolean = false;
      
      private var var_1279:IRegionWindow;
      
      private var var_425:int;
      
      private var var_1277:Boolean = true;
      
      private var var_719:GuestRoomListCtrl;
      
      private var var_14:IFrameWindow;
      
      private var var_390:Timer;
      
      private var var_265:IWindowContainer;
      
      private var var_201:IWindowContainer;
      
      private var var_230:IWindowContainer;
      
      private var var_1276:IWindow;
      
      private var var_1278:Boolean;
      
      private var var_872:OfficialRoomListCtrl;
      
      private var var_20:IWindowContainer;
      
      private var var_720:PopularTagsListCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_1280:int = 0;
      
      private var var_231:ITabContextWindow;
      
      public function MainViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_720 = new PopularTagsListCtrl(_navigator);
         var_719 = new GuestRoomListCtrl(_navigator);
         var_872 = new OfficialRoomListCtrl(_navigator);
         var_390 = new Timer(300,1);
         var_390.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      private function getSearchMsg(param1:int, param2:String) : IMessageComposer
      {
         if(param1 == Tabs.const_563)
         {
            return new MyFavouriteRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_683)
         {
            return new MyFriendsRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_532)
         {
            return new MyRoomHistorySearchMessageComposer();
         }
         if(param1 == Tabs.const_215)
         {
            return new MyRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_321)
         {
            return new PopularRoomsSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_535)
         {
            return new RoomsWhereMyFriendsAreSearchMessageComposer();
         }
         if(param1 == Tabs.const_558)
         {
            return new RoomsWithHighestScoreSearchMessageComposer();
         }
         if(param1 == Tabs.const_329)
         {
            return new RoomTagSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_211)
         {
            return new RoomTextSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_432)
         {
            return new LatestEventsSearchMessageComposer(param2);
         }
         Logger.log("No message for searchType: " + param1);
         return null;
      }
      
      private function prepare() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var_14 = IFrameWindow(_navigator.getXmlWindow("grs_main_window"));
         var_231 = ITabContextWindow(var_14.findChildByName("tab_context"));
         var_20 = IWindowContainer(var_14.findChildByName("tab_content"));
         var_230 = IWindowContainer(var_14.findChildByName("custom_content"));
         var_201 = IWindowContainer(var_14.findChildByName("list_content"));
         var_265 = IWindowContainer(var_14.findChildByName("custom_footer"));
         var_1276 = var_14.findChildByName("loading_text");
         var _loc1_:IWindow = var_14.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_1279 = IRegionWindow(var_14.findChildByName("to_hotel_view"));
         var_1279.procedure = onHotelView;
         refreshToHotelViewButton(false);
         var_14.procedure = onWindow;
         for each(_loc2_ in _navigator.tabs.tabs)
         {
            _loc3_ = var_231.getTabItemByID(_loc2_.id);
            _loc3_.setParamFlag(HabboWindowParam.const_44,true);
            _loc3_.procedure = onTabClick;
            _loc2_.button = _loc3_;
         }
         var_14.scaler.setParamFlag(HabboWindowParam.const_720,false);
         var_14.scaler.setParamFlag(HabboWindowParam.const_1224,true);
      }
      
      public function get mainWindow() : IFrameWindow
      {
         return var_14;
      }
      
      private function onTabClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_59)
         {
            return;
         }
         var _loc3_:int = param2.id;
         if(var_1278)
         {
            var_1278 = false;
            return;
         }
         var _loc4_:Tab = _navigator.tabs.getTab(_loc3_);
         _loc4_.sendSearchRequest();
         switch(_loc4_.id)
         {
            case Tabs.const_313:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS));
               break;
            case Tabs.const_277:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME));
               break;
            case Tabs.const_289:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL));
               break;
            case Tabs.const_241:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS));
               break;
            case Tabs.const_203:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH));
         }
      }
      
      private function refreshScrollbar(param1:IViewCtrl) : void
      {
         if(param1.content == null || !param1.content.visible)
         {
            return;
         }
         var _loc2_:IItemListWindow = IItemListWindow(param1.content.findChildByName("item_list"));
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         var _loc4_:* = _loc2_.scrollableRegion.height > _loc2_.height;
         if(_loc3_.visible)
         {
            if(_loc4_)
            {
               return;
            }
            _loc3_.visible = false;
            _loc2_.width += SCROLLBAR_WIDTH;
         }
         else
         {
            if(!_loc4_)
            {
               return;
            }
            _loc3_.visible = true;
            _loc2_.width -= SCROLLBAR_WIDTH;
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.close();
      }
      
      private function sendTrackingEvent(param1:int) : void
      {
         switch(param1)
         {
            case Tabs.const_432:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS));
               break;
            case Tabs.const_563:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES));
               break;
            case Tabs.const_683:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS));
               break;
            case Tabs.const_532:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY));
               break;
            case Tabs.const_215:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS));
               break;
            case Tabs.const_670:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS));
               break;
            case Tabs.const_321:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS));
               break;
            case Tabs.const_535:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE));
               break;
            case Tabs.const_558:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE));
               break;
            case Tabs.const_329:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH));
               break;
            case Tabs.const_211:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH));
         }
      }
      
      private function refreshList(param1:Boolean, param2:Boolean, param3:IViewCtrl, param4:String) : void
      {
         var _loc5_:* = null;
         if(!param2)
         {
            return;
         }
         if(param3.content == null)
         {
            _loc5_ = var_201.getChildByName(param4);
            param3.content = IWindowContainer(_loc5_);
         }
         if(param1)
         {
            param3.refresh();
         }
         param3.content.visible = true;
      }
      
      public function isOpen() : Boolean
      {
         return var_14 != null && false;
      }
      
      private function refreshListContent(param1:Boolean) : void
      {
         Util.hideChildren(var_201);
         refreshGuestRooms(param1,_navigator.data.guestRoomSearchArrived);
         refreshPopularTags(param1,_navigator.data.popularTagsArrived);
         refreshOfficialRooms(param1,_navigator.data.officialRoomsArrived);
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         refreshScrollbar(var_720);
         refreshScrollbar(var_719);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function stretchNewEntryIfNeeded(param1:IViewCtrl, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         if(_loc3_.visible)
         {
            return;
         }
         param2.width += SCROLLBAR_WIDTH;
      }
      
      public function startSearch(param1:int, param2:int, param3:String = "-1", param4:int = 1) : void
      {
         var _loc5_:Tab = _navigator.tabs.getSelected();
         _navigator.tabs.setSelectedTab(param1);
         var _loc6_:Tab = _navigator.tabs.getSelected();
         ErrorReportStorage.addDebugData("StartSearch","Start search " + _loc5_.id + " => " + _loc6_.id);
         this.var_1277 = _loc5_ != _loc6_;
         if(_loc5_ != _loc6_)
         {
            _loc6_.method_3.tabSelected();
         }
         _navigator.data.startLoading();
         if(param4 == const_413)
         {
            _navigator.send(getSearchMsg(param2,param3));
         }
         else if(param4 == const_515)
         {
            _navigator.send(new GetPopularRoomTagsMessageComposer());
         }
         else
         {
            _navigator.send(new GetOfficialRoomsMessageComposer());
         }
         if(!isOpen())
         {
            open();
            this.var_425 = const_499;
            this.var_201.blend = 0;
            if(this.var_230.visible)
            {
               this.var_230.blend = 0;
               this.var_265.blend = 0;
            }
         }
         else
         {
            this.var_425 = const_774;
         }
         this.var_1280 = 0;
         _navigator.registerUpdateReceiver(this,2);
         sendTrackingEvent(param2);
      }
      
      private function refreshCustomContent() : void
      {
         Util.hideChildren(var_230);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.method_3.refreshCustomContent(var_230);
         if(Util.hasVisibleChildren(var_230))
         {
            var_230.visible = true;
         }
         else
         {
            var_230.visible = false;
            var_230.blend = 1;
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            _navigator = null;
            if(var_14)
            {
               var_14.dispose();
               var_14 = null;
            }
            if(var_20)
            {
               var_20.dispose();
               var_20 = null;
            }
            if(var_390)
            {
               var_390.removeEventListener(TimerEvent.TIMER,onResizeTimer);
               var_390.reset();
               var_390 = null;
            }
            if(var_720)
            {
               var_720.dispose();
               var_720 = null;
            }
            if(var_719)
            {
               var_719.dispose();
               var_719 = null;
            }
            if(var_872)
            {
               var_872.dispose();
               var_872 = null;
            }
         }
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_47 || param2 != var_14)
         {
            return;
         }
         if(!this.var_390.running)
         {
            this.var_390.reset();
            this.var_390.start();
         }
      }
      
      private function refreshOfficialRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_872,"official_rooms");
      }
      
      private function refreshGuestRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_719,"guest_rooms");
      }
      
      private function refreshTab() : void
      {
         var _loc1_:Tab = _navigator.tabs.getSelected();
         var _loc2_:ISelectableWindow = var_231.selector.getSelected();
         if(_loc1_.button != _loc2_)
         {
            var_1278 = true;
            var_231.selector.setSelected(_loc1_.button);
         }
      }
      
      private function refreshPopularTags(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_720,"popular_tags");
      }
      
      public function onNavigatorToolBarIconClick() : Boolean
      {
         if(isOpen())
         {
            close();
            return false;
         }
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.method_3.navigatorOpenedWhileInTab();
         return true;
      }
      
      public function open() : void
      {
         var _loc1_:Boolean = false;
         if(this.var_14 == null)
         {
            prepare();
            _loc1_ = true;
         }
         refresh();
         var_14.visible = true;
         var_14.activate();
         if(_loc1_)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_51,HabboToolbarIconEnum.NAVIGATOR,var_14));
         }
      }
      
      private function refreshFooter() : void
      {
         Util.hideChildren(var_265);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.method_3.refreshFooter(var_265);
         if(Util.hasVisibleChildren(var_265))
         {
            var_265.visible = true;
         }
         else
         {
            var_265.visible = false;
         }
      }
      
      public function reloadRoomList(param1:int) : Boolean
      {
         ErrorReportStorage.addDebugData("MainViewCtrl","Reloading RoomList");
         if(this.isOpen() && this._navigator.data.guestRoomSearchResults != null && this._navigator.data.guestRoomSearchResults.searchType == param1)
         {
            startSearch(_navigator.tabs.getSelected().id,param1,"");
            return true;
         }
         return false;
      }
      
      private function onHotelView(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            refreshToHotelViewButton(true);
         }
         else if(param1.type == WindowMouseEvent.const_33)
         {
            refreshToHotelViewButton(false);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _navigator.send(new QuitMessageComposer());
         }
      }
      
      public function refresh() : void
      {
         if(var_14 == null)
         {
            return;
         }
         refreshTab();
         refreshCustomContent();
         refreshListContent(true);
         refreshFooter();
         var_230.height = Util.getLowestPoint(var_230);
         var_265.height = Util.getLowestPoint(var_265);
         var _loc1_:int = 0;
         Util.moveChildrenToColumn(var_20,["custom_content","list_content"],var_230.y,8);
         var_201.height = var_201.height + _loc1_ - 0 - 0 + var_2024;
         Util.moveChildrenToColumn(var_20,["list_content","custom_footer"],var_201.y,8);
         var_2024 = var_265.height;
         onResizeTimer(null);
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:Number = NaN;
         if(this.var_201 == null)
         {
            return;
         }
         var _loc2_:Number = param1 / 150;
         if(var_425 == const_774)
         {
            _loc3_ = Math.min(1,Math.max(0,this.var_201.blend - _loc2_));
            this.var_201.blend = _loc3_;
            this.var_230.blend = !!var_1277 ? Number(_loc3_) : Number(1);
            this.var_265.blend = !!var_1277 ? Number(_loc3_) : Number(1);
            if(_loc3_ == 0)
            {
               var_425 = const_499;
            }
         }
         else if(var_425 == const_499)
         {
            if(var_1280 % 10 == 1)
            {
               var_1276.visible = true;
            }
            ++var_1280;
            if(!_navigator.data.isLoading())
            {
               var_425 = const_773;
            }
         }
         else if(var_425 == const_773)
         {
            this.refresh();
            var_425 = const_1095;
         }
         else
         {
            var_1276.visible = false;
            _loc3_ = Math.min(1,Math.max(0,this.var_201.blend + _loc2_));
            this.var_201.blend = _loc3_;
            this.var_230.blend = !!var_1277 ? Number(_loc3_) : Number(1);
            this.var_265.blend = !!var_1277 ? Number(_loc3_) : Number(1);
            if(false)
            {
               _navigator.removeUpdateReceiver(this);
            }
         }
      }
      
      private function refreshToHotelViewButton(param1:Boolean) : void
      {
         _navigator.refreshButton(var_1279,"icon_hotelview",!param1,null,0);
         _navigator.refreshButton(var_1279,"icon_hotelview_reactive",param1,null,0);
      }
      
      public function close() : void
      {
         if(var_14 != null)
         {
            var_14.visible = false;
         }
      }
   }
}

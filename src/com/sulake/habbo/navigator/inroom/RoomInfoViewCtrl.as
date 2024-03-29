package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_711:IWindowContainer;
      
      private var var_1040:ITextWindow;
      
      private var var_199:RoomSettingsCtrl;
      
      private var var_1252:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var _hideInfoTimer:Timer;
      
      private var var_1255:ITextWindow;
      
      private var var_354:IWindowContainer;
      
      private var var_1995:IWindowContainer;
      
      private var var_1998:ITextWindow;
      
      private var var_864:IWindowContainer;
      
      private var var_1529:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_717:ITextWindow;
      
      private var var_1530:IWindowContainer;
      
      private var var_1254:IWindowContainer;
      
      private var var_865:ITextWindow;
      
      private var var_1038:ITextFieldWindow;
      
      private var var_311:IWindowContainer;
      
      private var var_866:ITextWindow;
      
      private var var_1531:IButtonWindow;
      
      private var var_1039:ITextWindow;
      
      private var var_2331:int;
      
      private var var_1253:IContainerButtonWindow;
      
      private var var_863:IWindowContainer;
      
      private var var_1258:ITextWindow;
      
      private var var_1256:IContainerButtonWindow;
      
      private var var_1532:ITextWindow;
      
      private var var_1533:IButtonWindow;
      
      private var var_798:TagRenderer;
      
      private var var_1997:ITextWindow;
      
      private var var_353:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_712:ITextWindow;
      
      private var var_264:RoomThumbnailCtrl;
      
      private var var_1257:IContainerButtonWindow;
      
      private var var_1996:IWindowContainer;
      
      private var var_263:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_353 = new RoomEventViewCtrl(_navigator);
         var_199 = new RoomSettingsCtrl(_navigator,this,true);
         var_264 = new RoomThumbnailCtrl(_navigator);
         var_798 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_199);
         _hideInfoTimer = new Timer(6000,1);
         _hideInfoTimer.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_199.active = true;
         this.var_353.active = false;
         this.var_264.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1529.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1533.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1530.visible = Util.hasVisibleChildren(var_1530);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_717.text = param1.roomName;
         var_717.height = NaN;
         _ownerName.text = param1.ownerName;
         var_865.text = param1.description;
         var_798.refreshTags(var_354,param1.tags);
         var_865.visible = false;
         if(param1.description != "")
         {
            var_865.height = NaN;
            var_865.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_354,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_354,"thumb_down",_loc3_,onThumbDown,0);
         var_1998.visible = _loc3_;
         var_866.visible = !_loc3_;
         var_1532.visible = !_loc3_;
         var_1532.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_354,"home",param2,null,0);
         _navigator.refreshButton(var_354,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_354,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_717.y,0);
         var_354.visible = true;
         var_354.height = Util.getLowestPoint(var_354);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(_hideInfoTimer)
         {
            _hideInfoTimer.removeEventListener(TimerEvent.TIMER,hideInfo);
            _hideInfoTimer.reset();
            _hideInfoTimer = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_422,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1531.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1252.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1257.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1253.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1256.visible = _navigator.data.canEditRoomSettings && param1;
         var_1254.visible = Util.hasVisibleChildren(var_1254);
      }
      
      public function open(param1:Boolean) : void
      {
         this._hideInfoTimer.reset();
         this.var_353.active = false;
         this.var_199.active = false;
         this.var_264.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_51,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this._hideInfoTimer.start();
         }
      }
      
      public function toggle() : void
      {
         this._hideInfoTimer.reset();
         this.var_353.active = false;
         this.var_199.active = false;
         this.var_264.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_51,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_422,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_311);
         var_311.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_199.refresh(var_311);
         this.var_264.refresh(var_311);
         Util.moveChildrenToColumn(var_311,["room_details","room_buttons"],0,2);
         var_311.height = Util.getLowestPoint(var_311);
         var_311.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1038.setSelection(0,var_1038.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_263);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_353.refresh(var_263);
         if(Util.hasVisibleChildren(var_263) && !this.var_264.active)
         {
            Util.moveChildrenToColumn(var_263,["event_details","event_buttons"],0,2);
            var_263.height = Util.getLowestPoint(var_263);
            var_263.visible = true;
         }
         else
         {
            var_263.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_353.active = true;
         this.var_199.active = false;
         this.var_264.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         _hideInfoTimer.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_1040.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1040.height = NaN;
         var_1255.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1255.height = NaN;
         Util.moveChildrenToColumn(var_711,["public_space_name","public_space_desc"],var_1040.y,0);
         var_711.visible = true;
         var_711.height = Math.max(86,Util.getLowestPoint(var_711));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "HabboHelpCom_back_hi_png";
         if(_loc1_ && true && true && true)
         {
            var_863.visible = true;
            var_1038.text = this.getEmbedData();
         }
         else
         {
            var_863.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this._hideInfoTimer.reset();
         this.var_199.load(param1);
         this.var_199.active = true;
         this.var_353.active = false;
         this.var_264.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_199.active = false;
         this.var_353.active = false;
         this.var_264.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_72,false);
         _window.setParamFlag(HabboWindowParam.const_1214,true);
         _window.visible = false;
         var_311 = IWindowContainer(find("room_info"));
         var_354 = IWindowContainer(find("room_details"));
         var_711 = IWindowContainer(find("public_space_details"));
         var_1996 = IWindowContainer(find("owner_name_cont"));
         var_1995 = IWindowContainer(find("rating_cont"));
         var_1254 = IWindowContainer(find("room_buttons"));
         var_717 = ITextWindow(find("room_name"));
         var_1040 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_865 = ITextWindow(find("room_desc"));
         var_1255 = ITextWindow(find("public_space_desc"));
         var_1039 = ITextWindow(find("owner_caption"));
         var_866 = ITextWindow(find("rating_caption"));
         var_1998 = ITextWindow(find("rate_caption"));
         var_1532 = ITextWindow(find("rating_txt"));
         var_263 = IWindowContainer(find("event_info"));
         var_864 = IWindowContainer(find("event_details"));
         var_1530 = IWindowContainer(find("event_buttons"));
         var_1997 = ITextWindow(find("event_name"));
         var_712 = ITextWindow(find("event_desc"));
         var_1252 = IContainerButtonWindow(find("add_favourite_button"));
         var_1257 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1253 = IContainerButtonWindow(find("make_home_button"));
         var_1256 = IContainerButtonWindow(find("unmake_home_button"));
         var_1531 = IButtonWindow(find("room_settings_button"));
         var_1529 = IButtonWindow(find("create_event_button"));
         var_1533 = IButtonWindow(find("edit_event_button"));
         var_863 = IWindowContainer(find("embed_info"));
         var_1258 = ITextWindow(find("embed_info_txt"));
         var_1038 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1252,onAddFavouriteClick);
         Util.setProcDirectly(var_1257,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1531,onRoomSettingsClick);
         Util.setProcDirectly(var_1253,onMakeHomeClick);
         Util.setProcDirectly(var_1256,onUnmakeHomeClick);
         Util.setProcDirectly(var_1529,onEventSettingsClick);
         Util.setProcDirectly(var_1533,onEventSettingsClick);
         Util.setProcDirectly(var_1038,onEmbedSrcClick);
         _navigator.refreshButton(var_1252,"favourite",true,null,0);
         _navigator.refreshButton(var_1257,"favourite",true,null,0);
         _navigator.refreshButton(var_1253,"home",true,null,0);
         _navigator.refreshButton(var_1256,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_311,onHover);
         Util.setProcDirectly(var_263,onHover);
         var_1039.width = var_1039.textWidth;
         Util.moveChildrenToRow(var_1996,["owner_caption","owner_name"],var_1039.x,var_1039.y,3);
         var_866.width = var_866.textWidth;
         Util.moveChildrenToRow(var_1995,["rating_caption","rating_txt"],var_866.x,var_866.y,3);
         var_1258.height = NaN;
         Util.moveChildrenToColumn(var_863,["embed_info_txt","embed_src_txt"],var_1258.y,2);
         var_863.height = Util.getLowestPoint(var_863) + 5;
         var_2331 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1997.text = param1.eventName;
         var_712.text = param1.eventDescription;
         var_798.refreshTags(var_864,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_712.visible = false;
         if(param1.eventDescription != "")
         {
            var_712.height = NaN;
            var_712.y = Util.getLowestPoint(var_864) + 2;
            var_712.visible = true;
         }
         var_864.visible = true;
         var_864.height = Util.getLowestPoint(var_864);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_947,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}

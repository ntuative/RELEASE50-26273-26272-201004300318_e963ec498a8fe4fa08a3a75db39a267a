package com.sulake.habbo.widget.chatinput
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.runtime.exceptions.CrashMeError;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetChatInputContentUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetChatInputDisplayEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatInputWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetChatMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class RoomChatInputWidget extends RoomWidgetBase implements IUpdateReceiver
   {
      
      private static const const_1104:int = 2;
      
      private static const const_1437:int = 150;
      
      private static const const_1105:int = 3000;
      
      private static const const_1106:int = 30000;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1324:int;
      
      private var var_1323:Boolean = false;
      
      private var var_1322:String = "";
      
      private var var_436:int = -1;
      
      private var var_903:Timer = null;
      
      private var _visualization:RoomChatInputView;
      
      private var var_2163:Boolean = false;
      
      private var var_904:Boolean = false;
      
      private var var_739:int = 0;
      
      private var var_23:Component = null;
      
      public function RoomChatInputWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:Component)
      {
         var_1324 = getTimer();
         super(param1,param2,param3);
         var_23 = param4;
         var_23.registerUpdateReceiver(this,9);
      }
      
      public function sendChat(param1:String, param2:int, param3:String = "") : void
      {
         if(var_904)
         {
            return;
         }
         checkForFlooding();
         var _loc4_:RoomWidgetChatMessage = new RoomWidgetChatMessage(RoomWidgetChatMessage.const_550,param1,param2,param3);
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc4_);
         }
      }
      
      private function onReleaseTimerTick(param1:TimerEvent) : void
      {
         if(_visualization != null)
         {
            var_739 = var_739 - 1;
            _visualization.showFloodBlocking(var_739);
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_330,onRoomObjectSelected);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_234,onRoomObjectDeselected);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_255,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetChatInputContentUpdateEvent.const_646,onChatInputUpdate);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_200,onUserInfo);
         param1.addEventListener(RoomWidgetChatInputDisplayEvent.const_675,onSettings);
         super.registerUpdateEvents(param1);
      }
      
      public function update(param1:uint) : void
      {
         if(var_1323)
         {
            var_1323 = false;
            throw new CrashMeError();
         }
      }
      
      public function get allowPaste() : Boolean
      {
         return var_2163;
      }
      
      public function get floodBlocked() : Boolean
      {
         return var_904;
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         if(_visualization == null)
         {
            _visualization = new RoomChatInputView(this,windowManager,assets,localizations);
         }
         refreshWindowPosition();
      }
      
      private function onReleaseTimerComplete(param1:TimerEvent) : void
      {
         Logger.log("Releasing flood blocking");
         var_904 = false;
         var_436 = -1;
         if(_visualization != null)
         {
            _visualization.hideFloodBlocking();
         }
         var_903 = null;
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var_1322 = param1.name;
      }
      
      private function onSettings(param1:RoomWidgetChatInputDisplayEvent) : void
      {
         var_2163 = param1.allowPaste;
      }
      
      private function onChatInputUpdate(param1:RoomWidgetChatInputContentUpdateEvent) : void
      {
         var _loc2_:String = "";
         switch(param1.messageType)
         {
            case RoomWidgetChatInputContentUpdateEvent.const_1021:
               _loc2_ = localizations.getKey("widgets.chatinput.mode.whisper",":tell");
               _visualization.displaySpecialChatMessage(_loc2_,param1.userName);
               break;
            case RoomWidgetChatInputContentUpdateEvent.const_1233:
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_330,onRoomObjectSelected);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_234,onRoomObjectDeselected);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_255,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetChatInputContentUpdateEvent.const_646,onChatInputUpdate);
         param1.removeEventListener(RoomWidgetChatInputDisplayEvent.const_675,onSettings);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_200,onUserInfo);
      }
      
      private function onRoomObjectDeselected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var_1322 = "";
      }
      
      override public function dispose() : void
      {
         if(_visualization != null)
         {
            _visualization.dispose();
            _visualization = null;
         }
         var_23.removeUpdateReceiver(this);
         _disposed = true;
         super.dispose();
      }
      
      private function checkForFlooding() : Boolean
      {
         if(var_904)
         {
            return true;
         }
         var _loc1_:int = getTimer();
         if(var_436 == -1)
         {
            var_436 = 0;
            var_1324 = _loc1_;
         }
         else
         {
            ++var_436;
         }
         if(var_436 > const_1104)
         {
            if(_loc1_ < var_1324 + const_1105)
            {
               var_904 = true;
               var_739 = const_1106 / 1000;
               Logger.log("Enabling flood blocking");
               var_903 = new Timer(1000,var_739);
               var_903.addEventListener(TimerEvent.TIMER,onReleaseTimerTick);
               var_903.addEventListener(TimerEvent.TIMER_COMPLETE,onReleaseTimerComplete);
               var_903.start();
               if(_visualization != null)
               {
                  _visualization.showFloodBlocking(var_739);
               }
               return true;
            }
            var_436 = -1;
         }
         return false;
      }
      
      public function triggerManualCrash() : void
      {
         var_1323 = true;
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_344,param1.id,param1.category);
      }
      
      public function get selectedUserName() : String
      {
         return var_1322;
      }
      
      private function refreshWindowPosition() : void
      {
         if(_visualization == null)
         {
            return;
         }
         var _loc1_:RoomWidgetChatInputWidgetMessage = new RoomWidgetChatInputWidgetMessage(RoomWidgetChatInputWidgetMessage.const_651,_visualization.window);
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
   }
}

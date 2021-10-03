package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_200:String = "RWUIUE_PEER";
      
      public static const const_225:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1356:String = "BOT";
      
      public static const const_899:int = 2;
      
      public static const const_1374:int = 0;
      
      public static const const_1027:int = 3;
       
      
      private var var_316:String = "";
      
      private var var_1166:String = "";
      
      private var var_2058:Boolean = false;
      
      private var var_1779:int = 0;
      
      private var var_2053:int = 0;
      
      private var var_2062:Boolean = false;
      
      private var var_1169:String = "";
      
      private var var_2056:Boolean = false;
      
      private var var_820:int = 0;
      
      private var var_2052:Boolean = true;
      
      private var var_1071:int = 0;
      
      private var var_2055:Boolean = false;
      
      private var var_1187:Boolean = false;
      
      private var var_2054:Boolean = false;
      
      private var var_2051:int = 0;
      
      private var var_2061:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_254:Array;
      
      private var var_1189:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1780:int = 0;
      
      private var var_2059:Boolean = false;
      
      private var var_2057:int = 0;
      
      private var var_2060:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_254 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_2053;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_2053 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2058;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2052;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2052 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2056 = param1;
      }
      
      public function get motto() : String
      {
         return var_1166;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2055 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1187;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1166 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2059;
      }
      
      public function get groupBadgeId() : String
      {
         return var_2060;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1187 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2061;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_2051 = param1;
      }
      
      public function get badges() : Array
      {
         return var_254;
      }
      
      public function get amIController() : Boolean
      {
         return var_2062;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2062 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2059 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2057 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_2060 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1169 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2056;
      }
      
      public function set figure(param1:String) : void
      {
         var_316 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_2051;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1189;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2055;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_820 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2057;
      }
      
      public function get realName() : String
      {
         return var_1169;
      }
      
      public function get figure() : String
      {
         return var_316;
      }
      
      public function set webID(param1:int) : void
      {
         var_1780 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_254 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2054 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2061 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_820;
      }
      
      public function get webID() : int
      {
         return var_1780;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1071 = param1;
      }
      
      public function get xp() : int
      {
         return var_1779;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2058 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1071;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2054;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1189 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         var_1779 = param1;
      }
   }
}

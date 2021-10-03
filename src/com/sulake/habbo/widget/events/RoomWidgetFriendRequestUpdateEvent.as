package com.sulake.habbo.widget.events
{
   public class RoomWidgetFriendRequestUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_488:String = "RWFRUE_SHOW_FRIEND_REQUEST";
      
      public static const const_426:String = "RWFRUE_HIDE_FRIEND_REQUEST";
       
      
      private var _userName:String;
      
      private var var_1035:int;
      
      private var _userId:int;
      
      public function RoomWidgetFriendRequestUpdateEvent(param1:String, param2:int, param3:int = 0, param4:String = null, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1035 = param2;
         _userId = param3;
         _userName = param4;
      }
      
      public function get requestId() : int
      {
         return var_1035;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}

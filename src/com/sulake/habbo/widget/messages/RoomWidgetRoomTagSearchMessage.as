package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_693:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1808:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_693);
         var_1808 = param1;
      }
      
      public function get tag() : String
      {
         return var_1808;
      }
   }
}

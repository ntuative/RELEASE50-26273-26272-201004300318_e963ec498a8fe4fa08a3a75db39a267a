package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarTypingUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_465:Boolean;
      
      public function RoomObjectAvatarTypingUpdateMessage(param1:Boolean = false)
      {
         super();
         var_465 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_465;
      }
   }
}

package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarWaveUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1719:Boolean = false;
      
      public function RoomObjectAvatarWaveUpdateMessage(param1:Boolean = false)
      {
         super();
         var_1719 = param1;
      }
      
      public function get isWaving() : Boolean
      {
         return var_1719;
      }
   }
}

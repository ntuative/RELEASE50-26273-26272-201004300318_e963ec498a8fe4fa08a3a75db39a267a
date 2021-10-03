package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1087:int;
      
      private var var_1339:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1087 = param1;
         var_1339 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1087;
      }
      
      public function get itemName() : String
      {
         return var_1339;
      }
   }
}

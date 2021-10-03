package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1734:String;
      
      private var var_782:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_1734 = param1;
         var_782 = param2;
      }
      
      public function get postureType() : String
      {
         return var_1734;
      }
      
      public function get parameter() : String
      {
         return var_782;
      }
   }
}

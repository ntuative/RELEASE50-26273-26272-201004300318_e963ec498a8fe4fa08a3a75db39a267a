package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1753:String;
      
      private var var_316:String;
      
      private var var_579:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         var_316 = param1;
         var_579 = param2;
         var_1753 = param3;
      }
      
      public function get race() : String
      {
         return var_1753;
      }
      
      public function get figure() : String
      {
         return var_316;
      }
      
      public function get gender() : String
      {
         return var_579;
      }
   }
}

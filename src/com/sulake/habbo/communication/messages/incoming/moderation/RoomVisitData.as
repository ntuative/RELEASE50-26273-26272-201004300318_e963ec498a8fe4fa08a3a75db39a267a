package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_717:String;
      
      private var var_1646:int;
      
      private var var_1444:Boolean;
      
      private var _roomId:int;
      
      private var var_1645:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1444 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_717 = param1.readString();
         var_1645 = param1.readInteger();
         var_1646 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1444;
      }
      
      public function get roomName() : String
      {
         return var_717;
      }
      
      public function get enterMinute() : int
      {
         return var_1646;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1645;
      }
   }
}

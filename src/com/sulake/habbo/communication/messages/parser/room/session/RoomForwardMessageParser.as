package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomForwardMessageParser implements IMessageParser
   {
       
      
      private var var_2172:Boolean;
      
      private var _roomId:int;
      
      public function RoomForwardMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_2172 = param1.readBoolean();
         _roomId = param1.readInteger();
         return true;
      }
      
      public function get publicRoom() : Boolean
      {
         return var_2172;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}

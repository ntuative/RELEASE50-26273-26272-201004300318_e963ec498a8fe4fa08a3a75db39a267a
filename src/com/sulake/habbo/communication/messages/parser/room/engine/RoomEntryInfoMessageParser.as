package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2160:int;
      
      private var var_389:Boolean;
      
      private var var_2161:Boolean;
      
      private var var_901:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2161 = param1.readBoolean();
         if(var_2161)
         {
            var_2160 = param1.readInteger();
            var_389 = param1.readBoolean();
         }
         else
         {
            var_901 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_901 != null)
         {
            var_901.dispose();
            var_901 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2160;
      }
      
      public function get owner() : Boolean
      {
         return var_389;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2161;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_901;
      }
   }
}

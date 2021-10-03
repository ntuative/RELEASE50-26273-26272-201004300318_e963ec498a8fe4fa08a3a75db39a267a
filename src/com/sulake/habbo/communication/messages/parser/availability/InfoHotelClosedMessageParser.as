package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class InfoHotelClosedMessageParser implements IMessageParser
   {
       
      
      private var var_1379:Boolean;
      
      private var _openHour:int;
      
      private var var_1289:int;
      
      public function InfoHotelClosedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _openHour = param1.readInteger();
         var_1289 = param1.readInteger();
         var_1379 = param1.readInteger() > 0;
         return true;
      }
      
      public function get userThrownOutAtClose() : Boolean
      {
         return var_1379;
      }
      
      public function flush() : Boolean
      {
         _openHour = 0;
         var_1289 = 0;
         var_1379 = false;
         return true;
      }
      
      public function get openHour() : int
      {
         return _openHour;
      }
      
      public function get openMinute() : int
      {
         return var_1289;
      }
   }
}

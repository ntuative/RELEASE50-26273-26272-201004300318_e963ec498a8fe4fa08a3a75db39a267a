package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1054:Boolean;
      
      private var var_1210:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1054 = param1.readInteger() > 0;
         var_1210 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_1054;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1210;
      }
      
      public function flush() : Boolean
      {
         var_1054 = false;
         var_1210 = false;
         return true;
      }
   }
}

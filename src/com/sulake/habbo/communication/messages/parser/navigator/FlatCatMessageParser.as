package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_388:int;
      
      private var var_1288:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function get flatId() : int
      {
         return var_388;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_388 = param1.readInteger();
         var_1288 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_388 = 0;
         var_1288 = 0;
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1288;
      }
   }
}

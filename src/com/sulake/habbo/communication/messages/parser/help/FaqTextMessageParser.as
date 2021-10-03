package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FaqTextMessageParser implements IMessageParser
   {
       
      
      private var var_1284:int;
      
      private var var_1283:String;
      
      public function FaqTextMessageParser()
      {
         super();
      }
      
      public function get questionId() : int
      {
         return var_1284;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1284 = param1.readInteger();
         var_1283 = param1.readString();
         return true;
      }
      
      public function get answerText() : String
      {
         return var_1283;
      }
      
      public function flush() : Boolean
      {
         var_1284 = -1;
         var_1283 = null;
         return true;
      }
   }
}

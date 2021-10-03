package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1232:int;
      
      private var var_1130:int;
      
      private var var_1233:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1232;
      }
      
      public function flush() : Boolean
      {
         var_1130 = 0;
         var_1232 = 0;
         var_1233 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1130;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1232 = param1.readInteger();
         var_1130 = param1.readInteger();
         var_1233 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1233;
      }
   }
}

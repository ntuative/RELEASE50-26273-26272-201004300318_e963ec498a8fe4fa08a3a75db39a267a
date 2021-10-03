package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1630:int = 2;
      
      public static const const_1366:int = 4;
      
      public static const const_1232:int = 1;
      
      public static const const_1361:int = 3;
       
      
      private var var_960:int = 0;
      
      private var var_782:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_960;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_960 = param1.readInteger();
         if(var_960 == 3)
         {
            var_782 = param1.readString();
         }
         else
         {
            var_782 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_960 = 0;
         var_782 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_782;
      }
   }
}

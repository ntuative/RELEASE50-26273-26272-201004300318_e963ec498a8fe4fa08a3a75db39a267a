package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCreatedMessageParser implements IMessageParser
   {
       
      
      private var var_1830:String;
      
      private var var_388:int;
      
      public function FlatCreatedMessageParser()
      {
         super();
      }
      
      public function get flatName() : String
      {
         return var_1830;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_388 = param1.readInteger();
         this.var_1830 = param1.readString();
         Logger.log("FLAT CREATED: " + this.var_388 + ", " + this.var_1830);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get flatId() : int
      {
         return var_388;
      }
   }
}

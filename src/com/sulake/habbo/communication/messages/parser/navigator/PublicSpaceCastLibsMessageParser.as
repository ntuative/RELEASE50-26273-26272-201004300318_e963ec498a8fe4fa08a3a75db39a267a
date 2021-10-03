package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PublicSpaceCastLibsMessageParser implements IMessageParser
   {
       
      
      private var var_1695:int;
      
      private var var_1768:String;
      
      private var var_1288:int;
      
      public function PublicSpaceCastLibsMessageParser()
      {
         super();
      }
      
      public function get unitPort() : int
      {
         return var_1695;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get castLibs() : String
      {
         return var_1768;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1288 = param1.readInteger();
         this.var_1768 = param1.readString();
         this.var_1695 = param1.readInteger();
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1288;
      }
   }
}

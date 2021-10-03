package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1869:int;
      
      private var var_1249:PetData;
      
      private var var_1979:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1869;
      }
      
      public function get petData() : PetData
      {
         return var_1249;
      }
      
      public function flush() : Boolean
      {
         var_1249 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1979;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1869 = param1.readInteger();
         var_1979 = param1.readInteger();
         var_1249 = new PetData(param1);
         return true;
      }
   }
}

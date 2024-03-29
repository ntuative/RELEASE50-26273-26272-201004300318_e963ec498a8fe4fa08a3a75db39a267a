package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetRespectFailedParser implements IMessageParser
   {
       
      
      private var var_1718:int;
      
      private var _requiredDays:int;
      
      public function PetRespectFailedParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _requiredDays = param1.readInteger();
         var_1718 = param1.readInteger();
         return true;
      }
      
      public function get avatarAgeInDays() : int
      {
         return var_1718;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get requiredDays() : int
      {
         return _requiredDays;
      }
   }
}

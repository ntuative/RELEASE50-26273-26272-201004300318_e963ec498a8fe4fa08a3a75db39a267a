package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_316:String;
      
      private var var_1667:int;
      
      private var var_2076:String;
      
      private var var_1082:int;
      
      private var var_1198:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1198;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1198 = param1.readInteger();
         var_2076 = param1.readString();
         var_1667 = param1.readInteger();
         var_316 = param1.readString();
         var_1082 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2076;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_316;
      }
      
      public function get petType() : int
      {
         return var_1082;
      }
      
      public function get level() : int
      {
         return var_1667;
      }
   }
}

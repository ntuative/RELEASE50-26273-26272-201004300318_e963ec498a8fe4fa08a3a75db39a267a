package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1752:int;
      
      private var var_316:String;
      
      private var var_1667:int;
      
      private var var_1869:int;
      
      private var var_1755:int;
      
      private var var_1900:int;
      
      private var _nutrition:int;
      
      private var var_1198:int;
      
      private var var_1901:int;
      
      private var var_1899:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1649:int;
      
      private var var_1902:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1667;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1900;
      }
      
      public function flush() : Boolean
      {
         var_1198 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1901;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1899;
      }
      
      public function get maxNutrition() : int
      {
         return var_1902;
      }
      
      public function get figure() : String
      {
         return var_316;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1869;
      }
      
      public function get petId() : int
      {
         return var_1198;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1198 = param1.readInteger();
         _name = param1.readString();
         var_1667 = param1.readInteger();
         var_1901 = param1.readInteger();
         var_1755 = param1.readInteger();
         var_1899 = param1.readInteger();
         _energy = param1.readInteger();
         var_1900 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1902 = param1.readInteger();
         var_316 = param1.readString();
         var_1869 = param1.readInteger();
         var_1649 = param1.readInteger();
         var_1752 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1755;
      }
      
      public function get ownerId() : int
      {
         return var_1649;
      }
      
      public function get age() : int
      {
         return var_1752;
      }
   }
}

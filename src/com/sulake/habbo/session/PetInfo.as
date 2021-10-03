package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1667:int;
      
      private var var_1869:int;
      
      private var var_1755:int;
      
      private var var_1751:int;
      
      private var _nutrition:int;
      
      private var var_1198:int;
      
      private var var_1757:int;
      
      private var var_1756:int;
      
      private var _energy:int;
      
      private var var_1752:int;
      
      private var var_1750:int;
      
      private var _ownerName:String;
      
      private var var_1649:int;
      
      public function PetInfo()
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
      
      public function set respect(param1:int) : void
      {
         var_1869 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1667 = param1;
      }
      
      public function get petId() : int
      {
         return var_1198;
      }
      
      public function get experienceMax() : int
      {
         return var_1756;
      }
      
      public function get nutritionMax() : int
      {
         return var_1751;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1757 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1649;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1198 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1750;
      }
      
      public function get respect() : int
      {
         return var_1869;
      }
      
      public function get levelMax() : int
      {
         return var_1757;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1756 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1755 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1751 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1649 = param1;
      }
      
      public function get experience() : int
      {
         return var_1755;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1750 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1752 = param1;
      }
      
      public function get age() : int
      {
         return var_1752;
      }
   }
}

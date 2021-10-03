package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_579:String;
      
      private var _id:int;
      
      private var var_2073:String = "";
      
      private var var_2072:int;
      
      private var var_2074:String;
      
      private var var_1992:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_2072 = parseInt(param1.@pattern);
         var_579 = String(param1.@gender);
         var_1992 = Boolean(parseInt(param1.@colorable));
         var_2073 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_2073;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1992;
      }
      
      public function get gender() : String
      {
         return var_579;
      }
      
      public function get patternId() : int
      {
         return var_2072;
      }
      
      public function get avatarFigureString() : String
      {
         return var_2074;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_2074 = param1;
      }
   }
}

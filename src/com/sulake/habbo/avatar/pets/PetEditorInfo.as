package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1740:Boolean;
      
      private var var_1741:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1740 = Boolean(parseInt(param1.@club));
         var_1741 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1740;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1741;
      }
   }
}

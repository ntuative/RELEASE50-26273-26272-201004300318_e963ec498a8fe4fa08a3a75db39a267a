package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1598:String;
      
      private var var_1474:String;
      
      private var var_1103:String;
      
      private var var_402:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1598 = String(param1.@align);
         var_1103 = String(param1.@base);
         var_1474 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_402 = Number(_loc2_);
            if(var_402 > 1)
            {
               var_402 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1598;
      }
      
      public function get ink() : String
      {
         return var_1474;
      }
      
      public function get base() : String
      {
         return var_1103;
      }
      
      public function get isBlended() : Boolean
      {
         return var_402 != 1;
      }
      
      public function get blend() : Number
      {
         return var_402;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}

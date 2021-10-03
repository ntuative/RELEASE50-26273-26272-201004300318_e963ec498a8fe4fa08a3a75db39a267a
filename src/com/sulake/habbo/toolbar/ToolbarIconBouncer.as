package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1968:Number;
      
      private var var_584:Number = 0;
      
      private var var_1967:Number;
      
      private var var_583:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1968 = param1;
         var_1967 = param2;
      }
      
      public function update() : void
      {
         var_583 += var_1967;
         var_584 += var_583;
         if(var_584 > 0)
         {
            var_584 = 0;
            var_583 = var_1968 * -1 * var_583;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_583 = param1;
         var_584 = 0;
      }
      
      public function get location() : Number
      {
         return var_584;
      }
   }
}

package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2206:Boolean = false;
      
      private var var_2205:int = 0;
      
      private var var_1559:int = 0;
      
      private var var_2204:int = 0;
      
      private var var_1962:Boolean = false;
      
      private var var_1547:int = 0;
      
      private var var_1560:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1547 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2205;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2206;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2206 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1962;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2205 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1559 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1547;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1962 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2204 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1559;
      }
      
      public function get pixelBalance() : int
      {
         return var_2204;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1560 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1560;
      }
   }
}

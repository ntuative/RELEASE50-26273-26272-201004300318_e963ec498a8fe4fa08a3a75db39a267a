package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_2078:int = 0;
      
      private var var_1559:int = 0;
      
      private var var_1962:Boolean = false;
      
      private var var_1788:int = 0;
      
      private var var_1957:int = 0;
      
      private var var_1560:int = 0;
      
      private var var_1961:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubDays() : int
      {
         return var_1559;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1559 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1962 = param1;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         var_1961 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1559 > 0 || var_1560 > 0;
      }
      
      public function get credits() : int
      {
         return var_1788;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         var_1957 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1560;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1962;
      }
      
      public function get pastClubDays() : int
      {
         return var_1961;
      }
      
      public function get pastVipDays() : int
      {
         return var_1957;
      }
      
      public function set pixels(param1:int) : void
      {
         var_2078 = param1;
      }
      
      public function get pixels() : int
      {
         return var_2078;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1560 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1788 = param1;
      }
   }
}

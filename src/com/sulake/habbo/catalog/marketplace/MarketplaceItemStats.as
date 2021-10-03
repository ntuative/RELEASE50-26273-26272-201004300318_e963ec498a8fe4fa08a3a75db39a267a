package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1534:Array;
      
      private var var_1928:int;
      
      private var var_1999:int;
      
      private var var_2000:int;
      
      private var var_2002:int;
      
      private var _dayOffsets:Array;
      
      private var var_2001:int;
      
      private var var_1535:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1534;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1534 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1999;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1535 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1928 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_2000;
      }
      
      public function get furniCategoryId() : int
      {
         return var_2002;
      }
      
      public function get offerCount() : int
      {
         return var_2001;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_2001 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1535;
      }
      
      public function get averagePrice() : int
      {
         return var_1928;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_2002 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_2000 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1999 = param1;
      }
   }
}

package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1534:Array;
      
      private var var_1928:int;
      
      private var var_1999:int;
      
      private var var_2002:int;
      
      private var var_2000:int;
      
      private var _dayOffsets:Array;
      
      private var var_2001:int;
      
      private var var_1535:Array;
      
      public function MarketplaceItemStatsParser()
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
      
      public function get furniTypeId() : int
      {
         return var_1999;
      }
      
      public function get historyLength() : int
      {
         return var_2000;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_2002;
      }
      
      public function get offerCount() : int
      {
         return var_2001;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1535;
      }
      
      public function get averagePrice() : int
      {
         return var_1928;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1928 = param1.readInteger();
         var_2001 = param1.readInteger();
         var_2000 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1534 = [];
         var_1535 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1534.push(param1.readInteger());
            var_1535.push(param1.readInteger());
            _loc3_++;
         }
         var_2002 = param1.readInteger();
         var_1999 = param1.readInteger();
         return true;
      }
   }
}

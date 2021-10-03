package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1637:int;
      
      private var var_1409:int;
      
      private var var_1641:int;
      
      private var var_1639:int;
      
      private var var_1636:int;
      
      private var var_1410:int;
      
      private var var_1640:int;
      
      private var var_1226:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1637;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1409;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1640;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1639;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1636;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1410;
      }
      
      public function get commission() : int
      {
         return var_1641;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1226 = param1.readBoolean();
         var_1641 = param1.readInteger();
         var_1409 = param1.readInteger();
         var_1410 = param1.readInteger();
         var_1639 = param1.readInteger();
         var_1637 = param1.readInteger();
         var_1636 = param1.readInteger();
         var_1640 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1226;
      }
   }
}

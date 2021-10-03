package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_624:Array;
      
      private var var_1290:int;
      
      private var var_1436:Array;
      
      private var var_623:Array;
      
      private var var_1226:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1226 = _loc2_.isWrappingEnabled;
         var_1290 = _loc2_.wrappingPrice;
         var_1436 = _loc2_.stuffTypes;
         var_623 = _loc2_.boxTypes;
         var_624 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_624;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1436;
      }
      
      public function get price() : int
      {
         return var_1290;
      }
      
      public function get boxTypes() : Array
      {
         return var_623;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1226;
      }
   }
}

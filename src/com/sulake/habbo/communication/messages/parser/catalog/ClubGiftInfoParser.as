package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.ClubGiftData;
   
   public class ClubGiftInfoParser implements IMessageParser
   {
       
      
      private var var_2220:int;
      
      private var var_1094:int;
      
      private var var_576:Array;
      
      private var var_1595:Map;
      
      public function ClubGiftInfoParser()
      {
         super();
      }
      
      public function get giftData() : Map
      {
         return var_1595;
      }
      
      public function get giftsAvailable() : int
      {
         return var_1094;
      }
      
      public function flush() : Boolean
      {
         var_576 = [];
         return true;
      }
      
      public function get daysUntilNextGift() : int
      {
         return var_2220;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var_2220 = param1.readInteger();
         var_1094 = param1.readInteger();
         var_576 = new Array();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_576.push(new CatalogPageMessageOfferData(param1));
            _loc3_++;
         }
         var_1595 = new Map();
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new ClubGiftData(param1);
            var_1595.add(_loc4_.offerId,_loc4_);
            _loc3_++;
         }
         return true;
      }
      
      public function get offers() : Array
      {
         return var_576;
      }
   }
}

package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffer;
   
   public class MarketPlaceOwnOffersParser implements IMessageParser
   {
       
      
      private const const_1648:int = 500;
      
      private var var_1714:int;
      
      private var var_576:Array;
      
      public function MarketPlaceOwnOffersParser()
      {
         super();
      }
      
      public function get creditsWaiting() : int
      {
         return var_1714;
      }
      
      public function get offers() : Array
      {
         return var_576;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc11_:* = null;
         var_576 = new Array();
         var_1714 = param1.readInteger();
         var _loc9_:int = param1.readInteger();
         var _loc10_:int = 0;
         while(_loc10_ < _loc9_)
         {
            _loc2_ = param1.readInteger();
            _loc3_ = param1.readInteger();
            _loc4_ = param1.readInteger();
            _loc5_ = param1.readInteger();
            _loc6_ = param1.readInteger();
            _loc7_ = param1.readInteger();
            _loc8_ = param1.readInteger();
            _loc11_ = new MarketPlaceOffer(_loc2_,_loc5_,_loc4_,_loc6_,_loc3_,_loc7_,_loc8_);
            if(_loc10_ < const_1648)
            {
               var_576.push(_loc11_);
            }
            _loc10_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_576 = null;
         return true;
      }
   }
}

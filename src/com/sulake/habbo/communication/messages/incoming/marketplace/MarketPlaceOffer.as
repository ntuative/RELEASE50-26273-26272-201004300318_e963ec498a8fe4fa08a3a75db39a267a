package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1290:int;
      
      private var var_1927:int = -1;
      
      private var var_162:int;
      
      private var var_1928:int;
      
      private var var_1929:int;
      
      private var _offerId:int;
      
      private var var_1291:int;
      
      private var var_1789:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_1789 = param2;
         var_1929 = param3;
         var_1290 = param4;
         var_162 = param5;
         var_1927 = param6;
         var_1928 = param7;
         var_1291 = param8;
      }
      
      public function get status() : int
      {
         return var_162;
      }
      
      public function get price() : int
      {
         return var_1290;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1927;
      }
      
      public function get offerCount() : int
      {
         return var_1291;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1929;
      }
      
      public function get averagePrice() : int
      {
         return var_1928;
      }
      
      public function get furniId() : int
      {
         return var_1789;
      }
   }
}

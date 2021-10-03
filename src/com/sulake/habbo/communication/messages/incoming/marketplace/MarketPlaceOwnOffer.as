package com.sulake.habbo.communication.messages.incoming.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOwnOffer
   {
      
      public static const const_1545:int = 2;
      
      public static const const_1452:int = 1;
      
      public static const const_1576:int = 0;
       
      
      private var var_1290:int;
      
      private var var_162:int;
      
      private var var_2406:int;
      
      private var _offerId:int;
      
      private var var_1929:int;
      
      private var var_1789:int;
      
      private var _image:BitmapData;
      
      public function MarketPlaceOwnOffer(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         _offerId = param1;
         var_1789 = param2;
         var_1929 = param3;
         var_1290 = param4;
      }
      
      public function get furniId() : int
      {
         return var_1789;
      }
      
      public function get furniType() : int
      {
         return var_1929;
      }
      
      public function get price() : int
      {
         return var_1290;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
   }
}

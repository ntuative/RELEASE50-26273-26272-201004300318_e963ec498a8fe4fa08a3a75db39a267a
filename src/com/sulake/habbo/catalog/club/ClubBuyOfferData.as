package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_1629:int;
      
      private var var_1622:Boolean = false;
      
      private var var_1624:int;
      
      private var var_1623:int;
      
      private var var_1627:int;
      
      private var var_1268:String;
      
      private var var_1290:int;
      
      private var _offerId:int;
      
      private var var_1625:int;
      
      private var var_1626:Boolean;
      
      private var var_1628:Boolean;
      
      private var var_386:ICatalogPage;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         _offerId = param1;
         var_1268 = param2;
         var_1290 = param3;
         var_1628 = param4;
         var_1626 = param5;
         var_1624 = param6;
         var_1627 = param7;
         var_1623 = param8;
         var_1629 = param9;
         var_1625 = param10;
      }
      
      public function get month() : int
      {
         return var_1629;
      }
      
      public function get page() : ICatalogPage
      {
         return var_386;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get vip() : Boolean
      {
         return var_1626;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         var_386 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get priceInPixels() : int
      {
         return 0;
      }
      
      public function get priceType() : String
      {
         return Offer.const_319;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1628;
      }
      
      public function get localizationId() : String
      {
         return var_1268;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1627;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return var_1622;
      }
      
      public function get day() : int
      {
         return var_1625;
      }
      
      public function get year() : int
      {
         return var_1623;
      }
      
      public function get price() : int
      {
         return var_1290;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         var_1622 = param1;
      }
      
      public function get periods() : int
      {
         return var_1624;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get priceInCredits() : int
      {
         return var_1290;
      }
      
      public function get productCode() : String
      {
         return var_1268;
      }
   }
}

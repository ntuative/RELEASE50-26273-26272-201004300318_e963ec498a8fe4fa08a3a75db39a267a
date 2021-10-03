package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_895:String = "price_type_none";
      
      public static const const_392:String = "pricing_model_multi";
      
      public static const const_319:String = "price_type_credits";
      
      public static const const_415:String = "price_type_credits_and_pixels";
      
      public static const const_428:String = "pricing_model_bundle";
      
      public static const const_440:String = "pricing_model_single";
      
      public static const const_593:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1196:String = "pricing_model_unknown";
      
      public static const const_486:String = "price_type_pixels";
       
      
      private var var_2066:int;
      
      private var var_879:int;
      
      private var _offerId:int;
      
      private var var_878:int;
      
      private var var_427:String;
      
      private var var_597:String;
      
      private var var_386:ICatalogPage;
      
      private var var_428:IProductContainer;
      
      private var var_1292:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1292 = param1.localizationId;
         var_879 = param1.priceInCredits;
         var_878 = param1.priceInPixels;
         var_386 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_427;
      }
      
      public function get page() : ICatalogPage
      {
         return var_386;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2066 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_428;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_878;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1292 = "";
         var_879 = 0;
         var_878 = 0;
         var_386 = null;
         if(var_428 != null)
         {
            var_428.dispose();
            var_428 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return var_2066;
      }
      
      public function get priceInCredits() : int
      {
         return var_879;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_427 = const_440;
            }
            else
            {
               var_427 = const_392;
            }
         }
         else if(param1.length > 1)
         {
            var_427 = const_428;
         }
         else
         {
            var_427 = const_1196;
         }
      }
      
      public function get priceType() : String
      {
         return var_597;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_427)
         {
            case const_440:
               var_428 = new SingleProductContainer(this,param1);
               break;
            case const_392:
               var_428 = new MultiProductContainer(this,param1);
               break;
            case const_428:
               var_428 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_427);
         }
      }
      
      public function get localizationId() : String
      {
         return var_1292;
      }
      
      private function analyzePriceType() : void
      {
         if(var_879 > 0 && var_878 > 0)
         {
            var_597 = const_415;
         }
         else if(var_879 > 0)
         {
            var_597 = const_319;
         }
         else if(var_878 > 0)
         {
            var_597 = const_486;
         }
         else
         {
            var_597 = const_895;
         }
      }
   }
}

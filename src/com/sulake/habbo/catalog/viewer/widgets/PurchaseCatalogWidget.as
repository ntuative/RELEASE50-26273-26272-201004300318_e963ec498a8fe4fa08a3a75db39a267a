package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2080:XML;
      
      private var var_1563:ITextWindow;
      
      private var var_1564:ITextWindow;
      
      private var var_2081:XML;
      
      private var var_887:IWindowContainer;
      
      private var var_2342:ITextWindow;
      
      private var var_2079:String = "";
      
      private var var_2398:IButtonWindow;
      
      private var var_2082:XML;
      
      private var var_1562:ITextWindow;
      
      private var var_2083:XML;
      
      private var var_886:IButtonWindow;
      
      private var var_79:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_319:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2081) as IWindowContainer;
               break;
            case Offer.const_486:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2083) as IWindowContainer;
               break;
            case Offer.const_415:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2080) as IWindowContainer;
               break;
            case Offer.const_593:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2082) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_887 != null)
            {
               _window.removeChild(var_887);
               var_887.dispose();
            }
            var_887 = _loc2_;
            _window.addChild(_loc2_);
            var_887.x = 0;
            var_887.y = 0;
         }
         var_1562 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1564 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1563 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2342 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_886 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_886 != null)
         {
            var_886.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_886.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_79 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_79,page,var_2079);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2081 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2083 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2080 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2082 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_916,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2079 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_79 = param1.offer;
         attachStub(var_79.priceType);
         if(var_1562 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_79.priceInCredits));
            var_1562.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1564 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_79.priceInPixels));
            var_1564.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1563 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_79.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_79.priceInPixels));
            var_1563.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_886 != null)
         {
            var_886.enable();
         }
      }
   }
}

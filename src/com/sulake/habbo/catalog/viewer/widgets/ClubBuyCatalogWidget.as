package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.club.ClubBuyController;
   import com.sulake.habbo.catalog.club.ClubBuyItem;
   import com.sulake.habbo.catalog.club.ClubBuyOfferData;
   import com.sulake.habbo.catalog.purse.IPurse;
   import com.sulake.habbo.catalog.viewer.CatalogPage;
   import com.sulake.habbo.catalog.viewer.ICatalogViewer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class ClubBuyCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_576:Array;
      
      private var var_29:ClubBuyController;
      
      public function ClubBuyCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      public function displayMainView() : void
      {
         var _loc1_:XML = getAssetXML("clubBuyWidget");
         if(!_loc1_ || !window)
         {
            return;
         }
         window.removeChildAt(0);
         if(!page || true || !page.viewer.catalog || !page.viewer.catalog.windowManager)
         {
            return;
         }
         window.addChild(page.viewer.catalog.windowManager.buildFromXML(_loc1_));
      }
      
      private function showClubInfo() : void
      {
         var _loc3_:* = null;
         var _loc1_:IItemListWindow = _window.findChildByName("item_list_hc") as IItemListWindow;
         var _loc2_:XML = getAssetXML("club_buy_info_item");
         if(_loc1_ != null)
         {
            _loc3_ = page.viewer.catalog.windowManager.buildFromXML(_loc2_);
            _loc1_.addListItem(_loc3_);
         }
      }
      
      private function onClickLink(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:String = IWindow(param1.target).name;
         _loc3_ = (page.viewer.catalog as HabboCatalog).configuration;
         switch(_loc2_)
         {
            case "club_link":
               _loc4_ = _loc3_.getKey("link.format.club","credits/habboclub");
               openExternalLink(_loc4_);
         }
      }
      
      private function onExternalLink(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         reset();
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_576)
         {
            _loc1_.dispose();
         }
         var_576 = [];
      }
      
      override public function init() : void
      {
         super.init();
         var_576 = [];
         var_29 = (page.viewer.catalog as HabboCatalog).getClubBuyController();
         var_29.registerVisualization(this);
         displayMainView();
         var_29.requestOffers();
      }
      
      private function initLinks() : void
      {
         var _loc1_:* = null;
         if(_window)
         {
            _loc1_ = _window.findChildByName("club_link");
            if(_loc1_)
            {
               _loc1_.setParamFlag(WindowParam.const_50);
               _loc1_.mouseTreshold = 0;
               _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onClickLink);
            }
         }
      }
      
      public function showOffer(param1:ClubBuyOfferData) : void
      {
         var _loc2_:* = null;
         Logger.log("Offer: " + [param1.offerId,param1.productCode,param1.price,param1.upgrade,param1.vip,param1.periods,param1.daysLeftAfterPurchase,param1.year,param1.month,param1.day,param1.upgradeHcPeriodToVip]);
         param1.page = page;
         var _loc3_:ClubBuyItem = new ClubBuyItem(param1,page as CatalogPage);
         if(param1.vip)
         {
            _loc2_ = _window.findChildByName("item_list_vip") as IItemListWindow;
         }
         else
         {
            _loc2_ = _window.findChildByName("item_list_hc") as IItemListWindow;
         }
         if(_loc2_ != null)
         {
            _loc2_.addListItem(_loc3_.window);
         }
         var_576.push(_loc3_);
      }
      
      private function openExternalLink(param1:String) : void
      {
         var _loc2_:IHabboConfigurationManager = (page.viewer.catalog as HabboCatalog).configuration;
         if(param1 != "")
         {
            page.viewer.catalog.windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,onExternalLink);
            HabboWebTools.navigateToURL(param1,"habboMain");
         }
      }
      
      private function getAssetXML(param1:String) : XML
      {
         if(!page || true || !page.viewer.catalog || !page.viewer.catalog.assets)
         {
            return null;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.content as XML;
      }
      
      public function initClubType(param1:int) : void
      {
         var catalog:HabboCatalog = null;
         var localization:ICoreLocalizationManager = null;
         var purse:IPurse = null;
         var clubDays:int = 0;
         var clubPeriods:int = 0;
         var clubDaysTotal:int = 0;
         var clubType:int = param1;
         var viewer:ICatalogViewer = page.viewer;
         if(viewer)
         {
            catalog = viewer.catalog as HabboCatalog;
            if(catalog)
            {
               localization = catalog.localization;
               purse = catalog.getPurse();
               if(purse && localization)
               {
                  clubDays = purse.clubDays;
                  clubPeriods = purse.clubPeriods;
                  clubDaysTotal = clubPeriods * 31 + clubDays;
                  localization.registerParameter("catalog.club.buy.remaining.hc","days",String(clubDaysTotal));
                  localization.registerParameter("catalog.club.buy.remaining.vip","days",String(clubDaysTotal));
               }
            }
         }
         try
         {
            if(_window)
            {
               switch(clubType)
               {
                  case HabboClubLevelEnum.const_55:
                     _window.findChildByName("club_header").caption = "${catalog.club.buy.header.none}";
                     _window.findChildByName("club_info").caption = "${catalog.club.buy.info.none}";
                     _window.findChildByName("club_remaining").visible = false;
                     _window.findChildByName("club_remaining_bg").visible = false;
                     break;
                  case HabboClubLevelEnum.const_62:
                     _window.findChildByName("club_header").caption = "${catalog.club.buy.header.hc}";
                     _window.findChildByName("club_info").caption = "${catalog.club.buy.info.hc}";
                     _window.findChildByName("club_remaining").caption = "${catalog.club.buy.remaining.hc}";
                     break;
                  case HabboClubLevelEnum.const_52:
                     _window.findChildByName("club_header").caption = "${catalog.club.buy.header.vip}";
                     _window.findChildByName("club_info").caption = "${catalog.club.buy.info.vip}";
                     _window.findChildByName("club_remaining").caption = "${catalog.club.buy.remaining.vip}";
                     showClubInfo();
               }
            }
         }
         catch(e:Error)
         {
            ErrorReportStorage.addDebugData("ClubBuyCatalogWidget","initClubType - Window not properly constructed!");
         }
         initLinks();
      }
   }
}

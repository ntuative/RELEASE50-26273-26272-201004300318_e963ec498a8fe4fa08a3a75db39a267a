package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_563:int = 6;
      
      public static const const_215:int = 5;
      
      public static const const_558:int = 2;
      
      public static const const_329:int = 9;
      
      public static const const_289:int = 4;
      
      public static const const_241:int = 2;
      
      public static const const_535:int = 4;
      
      public static const const_211:int = 8;
      
      public static const const_532:int = 7;
      
      public static const const_277:int = 3;
      
      public static const const_313:int = 1;
      
      public static const const_203:int = 5;
      
      public static const const_432:int = 12;
      
      public static const const_321:int = 1;
      
      public static const const_670:int = 11;
      
      public static const const_683:int = 3;
      
      public static const const_1483:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_411:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_411 = new Array();
         var_411.push(new Tab(_navigator,const_313,const_432,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_413));
         var_411.push(new Tab(_navigator,const_241,const_321,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_413));
         var_411.push(new Tab(_navigator,const_289,const_670,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_869));
         var_411.push(new Tab(_navigator,const_277,const_215,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_413));
         var_411.push(new Tab(_navigator,const_203,const_211,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_515));
         setSelectedTab(const_313);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_411)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_411)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_411)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_289;
      }
      
      public function get tabs() : Array
      {
         return var_411;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}

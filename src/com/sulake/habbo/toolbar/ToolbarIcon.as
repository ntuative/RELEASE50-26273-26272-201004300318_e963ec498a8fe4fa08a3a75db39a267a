package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_482:ToolbarIconGroup;
      
      private var var_1002:Boolean = false;
      
      private var var_1862:String;
      
      private var var_854:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1003:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var var_34:String = "-1";
      
      private var var_97:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_690:String;
      
      private var var_1738:int;
      
      private var var_689:Timer;
      
      private var var_1487:Array;
      
      private var var_1001:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2319:Array;
      
      private var var_256:ToolbarBarMenuAnimator;
      
      private var var_399:ToolbarIconAnimator;
      
      private var var_574:Array;
      
      private var var_822:Array;
      
      private var var_821:String = "-1";
      
      private var var_2390:Boolean = true;
      
      private var var_1000:Array;
      
      private var var_1204:Timer;
      
      private var var_1861:int;
      
      private var var_83:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_574 = new Array();
         var_822 = new Array();
         var_2319 = new Array();
         var_1001 = new ToolbarIconBouncer(0.8,1);
         super();
         var_482 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_690 = param4;
         _events = param5;
         var_256 = param6;
         var_1204 = new Timer(40,40);
         var_1204.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_97 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_393,HabboWindowStyle.const_42,HabboWindowParam.const_44,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_97.background = true;
         var_97.mouseTreshold = 0;
         var_97.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_42,HabboWindowParam.const_42,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_97.addChild(_window);
         _window.addEventListener(WindowEvent.const_47,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1487[var_1000.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_1861;
      }
      
      public function get iconId() : String
      {
         return var_690;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_854 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         var_34 = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_97 == null || _window == null)
         {
            return;
         }
         var_97.width = _window.width;
         var_97.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_83 = (0 - 0) / 2;
            _y = var_854 + (0 - 0) / 2;
         }
         else
         {
            var_83 = var_854 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_97.x = var_83;
         var_97.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_97 != null)
         {
            var_97.dispose();
            var_97 = null;
         }
         var_574 = null;
         var_822 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_256 = null;
         var_399 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_574.indexOf(param1) < 0)
         {
            var_574.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_822.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_1002)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_256)
               {
                  var_256.repositionWindow(var_690,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_63);
                  _loc4_.iconId = var_690;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_1003;
                  }
               }
               break;
            case WindowMouseEvent.const_33:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_821;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_574.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_822[var_574.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_1002 = param1;
         if(var_97 != null)
         {
            var_97.visible = var_1002;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_97 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_97.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_97.toolTipCaption = "${toolbar.icon.tooltip." + var_1862.toLowerCase() + "}";
         }
         var_97.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_256 != null)
         {
            var_256.animateWindowIn(this,param1,param2,var_690,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_399 != null && _window != null)
         {
            var_399.update(_window);
            if(var_399.hasNextState())
            {
               state = var_399.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1487 = new Array();
         var_1000 = new Array();
         var_1862 = param1.@id;
         var_1861 = int(param1.@window_offset_from_icon);
         var_1738 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_1003 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_821 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_1000.push(_loc5_.id);
               var_1487.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_1003 == "-1")
                  {
                     var_1003 = _loc5_.id;
                  }
                  if(var_821 == "-1")
                  {
                     var_821 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         var_34 = var_821;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_256 != null)
         {
            var_256.hideWindow(param1,param2,var_690,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_256 != null)
         {
            var_256.positionWindow(this,param1,param2,var_690,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_256 != null)
         {
            var_256.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_1002;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_1001 != null && _window != null)
         {
            var_1001.update();
            _window.y = var_1001.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_689 != null)
         {
            var_689.stop();
            var_689 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_1002)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_399 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_83,_y,_bitmapData);
            if(false)
            {
               var_689 = new Timer(_loc1_.timer);
               var_689.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_689.start();
            }
            if(_loc1_.bounce)
            {
               var_1001.reset(-7);
               var_1204.reset();
               var_1204.start();
            }
         }
         else
         {
            var_399 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_1738 + var_482.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(var_34);
      }
      
      public function get window() : IWindow
      {
         return var_97;
      }
      
      public function get x() : Number
      {
         return var_83;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_822[var_574.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_482;
      }
   }
}

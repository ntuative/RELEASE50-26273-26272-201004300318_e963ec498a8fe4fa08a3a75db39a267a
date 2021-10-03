package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_252:String = "WE_CHILD_RESIZED";
      
      public static const const_1378:String = "WE_CLOSE";
      
      public static const const_1144:String = "WE_DESTROY";
      
      public static const const_123:String = "WE_CHANGE";
      
      public static const const_1285:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1536:String = "WE_PARENT_RESIZE";
      
      public static const const_98:String = "WE_UPDATE";
      
      public static const const_1172:String = "WE_MAXIMIZE";
      
      public static const const_461:String = "WE_DESTROYED";
      
      public static const const_977:String = "WE_UNSELECT";
      
      public static const const_1218:String = "WE_MAXIMIZED";
      
      public static const const_1584:String = "WE_UNLOCKED";
      
      public static const const_485:String = "WE_CHILD_REMOVED";
      
      public static const const_166:String = "WE_OK";
      
      public static const const_47:String = "WE_RESIZED";
      
      public static const const_1216:String = "WE_ACTIVATE";
      
      public static const const_253:String = "WE_ENABLED";
      
      public static const const_372:String = "WE_CHILD_RELOCATED";
      
      public static const const_1262:String = "WE_CREATE";
      
      public static const const_604:String = "WE_SELECT";
      
      public static const const_185:String = "";
      
      public static const const_1509:String = "WE_LOCKED";
      
      public static const const_1494:String = "WE_PARENT_RELOCATE";
      
      public static const const_1571:String = "WE_CHILD_REMOVE";
      
      public static const const_1451:String = "WE_CHILD_RELOCATE";
      
      public static const const_1537:String = "WE_LOCK";
      
      public static const const_233:String = "WE_FOCUSED";
      
      public static const const_594:String = "WE_UNSELECTED";
      
      public static const const_829:String = "WE_DEACTIVATED";
      
      public static const const_1376:String = "WE_MINIMIZED";
      
      public static const const_1489:String = "WE_ARRANGED";
      
      public static const const_1522:String = "WE_UNLOCK";
      
      public static const const_1625:String = "WE_ATTACH";
      
      public static const const_1300:String = "WE_OPEN";
      
      public static const const_1143:String = "WE_RESTORE";
      
      public static const const_1578:String = "WE_PARENT_RELOCATED";
      
      public static const const_1207:String = "WE_RELOCATE";
      
      public static const const_1540:String = "WE_CHILD_RESIZE";
      
      public static const const_1528:String = "WE_ARRANGE";
      
      public static const const_1223:String = "WE_OPENED";
      
      public static const const_1182:String = "WE_CLOSED";
      
      public static const const_1559:String = "WE_DETACHED";
      
      public static const const_1620:String = "WE_UPDATED";
      
      public static const const_1339:String = "WE_UNFOCUSED";
      
      public static const const_442:String = "WE_RELOCATED";
      
      public static const const_1140:String = "WE_DEACTIVATE";
      
      public static const const_201:String = "WE_DISABLED";
      
      public static const const_573:String = "WE_CANCEL";
      
      public static const const_587:String = "WE_ENABLE";
      
      public static const const_1152:String = "WE_ACTIVATED";
      
      public static const const_1195:String = "WE_FOCUS";
      
      public static const const_1538:String = "WE_DETACH";
      
      public static const const_1359:String = "WE_RESTORED";
      
      public static const const_1331:String = "WE_UNFOCUS";
      
      public static const const_59:String = "WE_SELECTED";
      
      public static const const_1185:String = "WE_PARENT_RESIZED";
      
      public static const const_1286:String = "WE_CREATED";
      
      public static const const_1487:String = "WE_ATTACHED";
      
      public static const const_1364:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1619:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1396:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1619 = param3;
         var_1396 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1396;
      }
      
      public function get related() : IWindow
      {
         return var_1619;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1396 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}

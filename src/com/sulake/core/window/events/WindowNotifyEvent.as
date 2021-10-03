package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1354:String = "WN_CREATED";
      
      public static const const_880:String = "WN_DISABLE";
      
      public static const const_933:String = "WN_DEACTIVATED";
      
      public static const const_994:String = "WN_OPENED";
      
      public static const const_1016:String = "WN_CLOSED";
      
      public static const const_989:String = "WN_DESTROY";
      
      public static const const_1564:String = "WN_ARRANGED";
      
      public static const const_383:String = "WN_PARENT_RESIZED";
      
      public static const const_957:String = "WN_ENABLE";
      
      public static const const_1011:String = "WN_RELOCATE";
      
      public static const const_834:String = "WN_FOCUS";
      
      public static const const_875:String = "WN_PARENT_RELOCATED";
      
      public static const const_466:String = "WN_PARAM_UPDATED";
      
      public static const const_697:String = "WN_PARENT_ACTIVATED";
      
      public static const const_167:String = "WN_RESIZED";
      
      public static const const_945:String = "WN_CLOSE";
      
      public static const const_967:String = "WN_PARENT_REMOVED";
      
      public static const const_267:String = "WN_CHILD_RELOCATED";
      
      public static const const_641:String = "WN_ENABLED";
      
      public static const const_248:String = "WN_CHILD_RESIZED";
      
      public static const const_827:String = "WN_MINIMIZED";
      
      public static const const_740:String = "WN_DISABLED";
      
      public static const const_209:String = "WN_CHILD_ACTIVATED";
      
      public static const const_454:String = "WN_STATE_UPDATED";
      
      public static const const_704:String = "WN_UNSELECTED";
      
      public static const const_482:String = "WN_STYLE_UPDATED";
      
      public static const const_1616:String = "WN_UPDATE";
      
      public static const const_391:String = "WN_PARENT_ADDED";
      
      public static const const_709:String = "WN_RESIZE";
      
      public static const const_560:String = "WN_CHILD_REMOVED";
      
      public static const const_1533:String = "";
      
      public static const const_851:String = "WN_RESTORED";
      
      public static const const_335:String = "WN_SELECTED";
      
      public static const const_842:String = "WN_MINIMIZE";
      
      public static const const_1018:String = "WN_FOCUSED";
      
      public static const const_1367:String = "WN_LOCK";
      
      public static const const_340:String = "WN_CHILD_ADDED";
      
      public static const const_946:String = "WN_UNFOCUSED";
      
      public static const const_387:String = "WN_RELOCATED";
      
      public static const const_922:String = "WN_DEACTIVATE";
      
      public static const const_1273:String = "WN_CRETAE";
      
      public static const const_978:String = "WN_RESTORE";
      
      public static const const_332:String = "WN_ACTVATED";
      
      public static const const_1222:String = "WN_LOCKED";
      
      public static const const_444:String = "WN_SELECT";
      
      public static const const_878:String = "WN_MAXIMIZE";
      
      public static const const_900:String = "WN_OPEN";
      
      public static const const_575:String = "WN_UNSELECT";
      
      public static const const_1448:String = "WN_ARRANGE";
      
      public static const const_1308:String = "WN_UNLOCKED";
      
      public static const const_1567:String = "WN_UPDATED";
      
      public static const const_966:String = "WN_ACTIVATE";
      
      public static const const_1239:String = "WN_UNLOCK";
      
      public static const const_874:String = "WN_MAXIMIZED";
      
      public static const const_811:String = "WN_DESTROYED";
      
      public static const const_877:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1619,cancelable);
      }
   }
}

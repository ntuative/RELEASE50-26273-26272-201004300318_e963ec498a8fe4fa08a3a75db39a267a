package com.sulake.habbo.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_510:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_253:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_510,param2,param3);
         var_253 = param1;
      }
      
      public function get effects() : Array
      {
         return var_253;
      }
   }
}

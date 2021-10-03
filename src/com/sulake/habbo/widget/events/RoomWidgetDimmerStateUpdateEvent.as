package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_68:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_1100:int;
      
      private var _color:uint;
      
      private var var_1101:int;
      
      private var var_1720:int;
      
      private var var_34:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_68,param6,param7);
         var_34 = param1;
         var_1720 = param2;
         var_1100 = param3;
         _color = param4;
         var_1101 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_1101;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_1100;
      }
      
      public function get state() : int
      {
         return var_34;
      }
      
      public function get presetId() : int
      {
         return var_1720;
      }
   }
}

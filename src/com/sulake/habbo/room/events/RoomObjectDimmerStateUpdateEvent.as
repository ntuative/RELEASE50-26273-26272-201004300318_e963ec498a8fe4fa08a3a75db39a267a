package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectDimmerStateUpdateEvent extends RoomObjectEvent
   {
      
      public static const const_68:String = "RODSUE_DIMMER_STATE";
       
      
      private var var_1100:int;
      
      private var _color:uint;
      
      private var var_1101:int;
      
      private var var_1720:int;
      
      private var var_34:int;
      
      public function RoomObjectDimmerStateUpdateEvent(param1:int, param2:String, param3:int, param4:int, param5:int, param6:uint, param7:int, param8:Boolean = false, param9:Boolean = false)
      {
         super(const_68,param1,param2,param8,param9);
         var_34 = param3;
         var_1720 = param4;
         var_1100 = param5;
         _color = param6;
         var_1101 = param7;
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

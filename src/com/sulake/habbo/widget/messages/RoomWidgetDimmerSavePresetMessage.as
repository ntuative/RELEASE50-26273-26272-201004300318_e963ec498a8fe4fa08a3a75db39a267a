package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_633:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1965:int;
      
      private var var_1966:int;
      
      private var var_1964:Boolean;
      
      private var var_1101:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_633);
         var_1966 = param1;
         var_1965 = param2;
         _color = param3;
         var_1101 = param4;
         var_1964 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1965;
      }
      
      public function get presetNumber() : int
      {
         return var_1966;
      }
      
      public function get brightness() : int
      {
         return var_1101;
      }
      
      public function get apply() : Boolean
      {
         return var_1964;
      }
   }
}

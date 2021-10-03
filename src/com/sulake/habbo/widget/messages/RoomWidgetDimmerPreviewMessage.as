package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerPreviewMessage extends RoomWidgetMessage
   {
      
      public static const const_637:String = "RWDPM_PREVIEW_DIMMER_PRESET";
       
      
      private var var_1101:int;
      
      private var _color:uint;
      
      private var var_2193:Boolean;
      
      public function RoomWidgetDimmerPreviewMessage(param1:uint, param2:int, param3:Boolean)
      {
         super(const_637);
         _color = param1;
         var_1101 = param2;
         var_2193 = param3;
      }
      
      public function get brightness() : int
      {
         return var_1101;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get bgOnly() : Boolean
      {
         return var_2193;
      }
   }
}

package com.sulake.habbo.widget.messages
{
   import flash.display.BitmapData;
   
   public class RoomWidgetSetToolbarIconMessage extends RoomWidgetMessage
   {
      
      public static const const_1181:String = "me_menu";
      
      public static const const_903:String = "RWCM_MESSAGE_SET_TOOLBAR_ICON";
       
      
      private var _icon:BitmapData;
      
      private var var_1704:String;
      
      public function RoomWidgetSetToolbarIconMessage(param1:String, param2:BitmapData)
      {
         super(const_903);
         var_1704 = param1;
         _icon = param2;
      }
      
      public function get icon() : BitmapData
      {
         return _icon;
      }
      
      public function get widgetType() : String
      {
         return var_1704;
      }
   }
}

package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_1019:String = "RWOCM_CLUB_MAIN";
      
      public static const const_533:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1954:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_533);
         var_1954 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1954;
      }
   }
}

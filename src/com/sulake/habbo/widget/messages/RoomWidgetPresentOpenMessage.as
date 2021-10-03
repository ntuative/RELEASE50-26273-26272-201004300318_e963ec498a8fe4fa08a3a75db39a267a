package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPresentOpenMessage extends RoomWidgetMessage
   {
      
      public static const const_700:String = "RWPOM_OPEN_PRESENT";
       
      
      private var var_161:int;
      
      public function RoomWidgetPresentOpenMessage(param1:String, param2:int)
      {
         super(param1);
         var_161 = param2;
      }
      
      public function get objectId() : int
      {
         return var_161;
      }
   }
}

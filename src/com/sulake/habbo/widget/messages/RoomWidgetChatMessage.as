package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_136:int = 0;
      
      public static const const_132:int = 1;
      
      public static const const_106:int = 2;
      
      public static const const_550:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1358:int = 0;
      
      private var var_1731:String = "";
      
      private var var_211:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_211 = param2;
         var_1358 = param3;
         var_1731 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1731;
      }
      
      public function get chatType() : int
      {
         return var_1358;
      }
      
      public function get text() : String
      {
         return var_211;
      }
   }
}

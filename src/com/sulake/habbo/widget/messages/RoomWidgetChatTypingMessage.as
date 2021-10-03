package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_523:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_465:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_523);
         var_465 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_465;
      }
   }
}

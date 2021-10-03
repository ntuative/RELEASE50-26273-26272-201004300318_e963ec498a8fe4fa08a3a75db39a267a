package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1230:int = 1;
      
      public static const const_1382:int = 10;
      
      public static const const_1149:int = 2;
      
      public static const const_1344:int = 0;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_7 as DisconnectReasonParser).reason;
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1466:String;
      
      private var var_2260:int;
      
      private var var_2263:int;
      
      private var var_2262:int;
      
      private var var_2261:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_2260 = param1.readInteger();
         var_2262 = param1.readInteger();
         var_2263 = param1.readInteger();
         var_2261 = param1.readString();
         var_1466 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1466;
      }
      
      public function get hour() : int
      {
         return var_2260;
      }
      
      public function get minute() : int
      {
         return var_2262;
      }
      
      public function get chatterName() : String
      {
         return var_2261;
      }
      
      public function get chatterId() : int
      {
         return var_2263;
      }
   }
}

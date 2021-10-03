package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1697:int;
      
      private var var_977:int;
      
      private var var_1978:int;
      
      private var var_1523:int;
      
      private var var_111:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1523 = param1.readInteger();
         var_1978 = param1.readInteger();
         var_977 = param1.readInteger();
         var_1697 = param1.readInteger();
         var_111 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1523);
      }
      
      public function get chatRecordId() : int
      {
         return var_1697;
      }
      
      public function get reportedUserId() : int
      {
         return var_977;
      }
      
      public function get method_9() : int
      {
         return var_1978;
      }
      
      public function get callId() : int
      {
         return var_1523;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_111;
      }
   }
}

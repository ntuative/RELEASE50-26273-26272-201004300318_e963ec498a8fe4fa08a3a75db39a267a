package com.sulake.habbo.messenger.domain
{
   import com.sulake.habbo.messenger.HabboMessenger;
   
   public class ConversationsDeps implements IConversationsDeps
   {
       
      
      private var var_137:HabboMessenger;
      
      public function ConversationsDeps(param1:HabboMessenger)
      {
         super();
         var_137 = param1;
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         var_137.messengerView.addMsgToView(param1,param2);
      }
      
      public function createConversation(param1:int) : Conversation
      {
         return var_137.createConversation(param1);
      }
      
      public function getText(param1:String) : String
      {
         return var_137.getText(param1);
      }
      
      public function getTabCount() : int
      {
         return var_137.messengerView.getTabCount();
      }
      
      public function refresh(param1:Boolean) : void
      {
         var_137.messengerView.refresh(param1);
      }
   }
}

package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_115:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1319:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_115);
         var_1319 = param1;
      }
      
      public function get vote() : int
      {
         return var_1319;
      }
   }
}

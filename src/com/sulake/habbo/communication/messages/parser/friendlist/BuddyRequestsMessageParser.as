package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
   
   public class BuddyRequestsMessageParser implements IMessageParser
   {
       
      
      private var var_2248:int;
      
      private var var_2249:Array;
      
      public function BuddyRequestsMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_2249 = new Array();
         return true;
      }
      
      public function get totalReqCount() : int
      {
         return this.var_2248;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2248 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         Logger.log("Received buddy requests: " + var_2248 + ", " + _loc2_);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_2249.push(new FriendRequestData(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get reqs() : Array
      {
         return this.var_2249;
      }
   }
}

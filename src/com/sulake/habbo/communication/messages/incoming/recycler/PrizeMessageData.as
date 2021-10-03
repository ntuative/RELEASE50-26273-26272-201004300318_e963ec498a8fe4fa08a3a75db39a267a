package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_1435:int;
      
      private var var_1774:String;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1774 = param1.readString();
         var_1435 = param1.readInteger();
      }
      
      public function get productItemTypeId() : int
      {
         return var_1435;
      }
      
      public function get productItemType() : String
      {
         return var_1774;
      }
   }
}

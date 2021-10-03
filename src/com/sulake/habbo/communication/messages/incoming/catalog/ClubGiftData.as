package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_2097:int;
      
      private var var_2098:Boolean;
      
      private var _offerId:int;
      
      private var var_1741:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_2098 = param1.readBoolean();
         var_2097 = param1.readInteger();
         var_1741 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1741;
      }
      
      public function get monthsRequired() : int
      {
         return var_2097;
      }
      
      public function get isVip() : Boolean
      {
         return var_2098;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}

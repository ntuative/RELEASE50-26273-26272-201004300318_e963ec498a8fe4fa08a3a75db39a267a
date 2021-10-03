package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1629:int;
      
      private var var_1290:int;
      
      private var var_1624:int;
      
      private var _offerId:int;
      
      private var var_1623:int;
      
      private var var_1625:int;
      
      private var var_1626:Boolean;
      
      private var var_1627:int;
      
      private var var_1628:Boolean;
      
      private var var_1268:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1268 = param1.readString();
         var_1290 = param1.readInteger();
         var_1628 = param1.readBoolean();
         var_1626 = param1.readBoolean();
         var_1624 = param1.readInteger();
         var_1627 = param1.readInteger();
         var_1623 = param1.readInteger();
         var_1629 = param1.readInteger();
         var_1625 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_1623;
      }
      
      public function get month() : int
      {
         return var_1629;
      }
      
      public function get price() : int
      {
         return var_1290;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_1624;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1627;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1628;
      }
      
      public function get day() : int
      {
         return var_1625;
      }
      
      public function get vip() : Boolean
      {
         return var_1626;
      }
      
      public function get productCode() : String
      {
         return var_1268;
      }
   }
}

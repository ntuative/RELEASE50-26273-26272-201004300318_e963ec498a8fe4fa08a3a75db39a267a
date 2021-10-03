package com.sulake.habbo.widget.events
{
   public class RoomWidgetCreditBalanceUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_184:String = "RWCBUE_CREDIT_BALANCE";
       
      
      private var var_2069:int;
      
      public function RoomWidgetCreditBalanceUpdateEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_184,param2,param3);
         var_2069 = param1;
      }
      
      public function get balance() : int
      {
         return var_2069;
      }
   }
}

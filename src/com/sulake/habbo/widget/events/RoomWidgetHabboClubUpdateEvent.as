package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_239:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1823:Boolean = false;
      
      private var var_1822:int = 0;
      
      private var var_1824:int = 0;
      
      private var var_1826:int;
      
      private var var_1825:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_239,param6,param7);
         var_1825 = param1;
         var_1824 = param2;
         var_1822 = param3;
         var_1823 = param4;
         var_1826 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_1826;
      }
      
      public function get pastPeriods() : int
      {
         return var_1822;
      }
      
      public function get periodsLeft() : int
      {
         return var_1824;
      }
      
      public function get daysLeft() : int
      {
         return var_1825;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1823;
      }
   }
}

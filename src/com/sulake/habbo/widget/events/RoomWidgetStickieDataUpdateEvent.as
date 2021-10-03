package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_650:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_211:String;
      
      private var var_698:String;
      
      private var var_1510:String;
      
      private var var_161:int = -1;
      
      private var var_29:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_161 = param2;
         var_1510 = param3;
         var_211 = param4;
         var_698 = param5;
         var_29 = param6;
      }
      
      public function get objectType() : String
      {
         return var_1510;
      }
      
      public function get colorHex() : String
      {
         return var_698;
      }
      
      public function get text() : String
      {
         return var_211;
      }
      
      public function get objectId() : int
      {
         return var_161;
      }
      
      public function get controller() : Boolean
      {
         return var_29;
      }
   }
}

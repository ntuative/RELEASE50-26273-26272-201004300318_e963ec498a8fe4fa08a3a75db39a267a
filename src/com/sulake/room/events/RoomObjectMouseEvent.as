package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1570:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1520:String = "ROE_MOUSE_ENTER";
      
      public static const const_377:String = "ROE_MOUSE_MOVE";
      
      public static const const_1465:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_219:String = "ROE_MOUSE_CLICK";
      
      public static const ROOM_OBJECT_MOUSE_DOWN:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2169:Boolean;
      
      private var var_2167:Boolean;
      
      private var var_2168:Boolean;
      
      private var var_2166:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_2168 = param4;
         var_2166 = param5;
         var_2169 = param6;
         var_2167 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2167;
      }
      
      public function get altKey() : Boolean
      {
         return var_2168;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2166;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2169;
      }
   }
}

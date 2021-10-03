package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_513:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_698:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_255:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1526:Point;
      
      private var var_1527:Rectangle;
      
      private var var_207:Number = 0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1527 = param2;
         var_1526 = param3;
         var_207 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1527 != null)
         {
            return var_1527.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_207;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1526 != null)
         {
            return var_1526.clone();
         }
         return null;
      }
   }
}

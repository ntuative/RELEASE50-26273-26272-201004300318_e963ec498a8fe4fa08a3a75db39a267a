package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_2167:Boolean = false;
      
      private var var_2168:Boolean = false;
      
      private var var_1671:String = "";
      
      private var _type:String = "";
      
      private var var_2169:Boolean = false;
      
      private var var_1762:Number = 0;
      
      private var var_2170:Number = 0;
      
      private var var_2165:Number = 0;
      
      private var var_2171:String = "";
      
      private var var_1765:Number = 0;
      
      private var var_2166:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2171 = param2;
         var_1671 = param3;
         var_2170 = param4;
         var_2165 = param5;
         var_1762 = param6;
         var_1765 = param7;
         var_2166 = param8;
         var_2168 = param9;
         var_2169 = param10;
         var_2167 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2166;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2167;
      }
      
      public function get localX() : Number
      {
         return var_1762;
      }
      
      public function get localY() : Number
      {
         return var_1765;
      }
      
      public function get canvasId() : String
      {
         return var_2171;
      }
      
      public function get altKey() : Boolean
      {
         return var_2168;
      }
      
      public function get spriteTag() : String
      {
         return var_1671;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2170;
      }
      
      public function get screenY() : Number
      {
         return var_2165;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2169;
      }
   }
}

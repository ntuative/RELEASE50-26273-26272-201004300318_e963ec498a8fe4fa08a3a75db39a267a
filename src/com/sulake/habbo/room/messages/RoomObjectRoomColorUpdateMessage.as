package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomColorUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1176:String = "RORCUM_BACKGROUND_COLOR";
       
      
      private var _color:uint = 0;
      
      private var var_2193:Boolean = true;
      
      private var var_1374:int = 0;
      
      private var _type:String = "";
      
      public function RoomObjectRoomColorUpdateMessage(param1:String, param2:uint, param3:int, param4:Boolean)
      {
         super(null,null);
         _type = param1;
         _color = param2;
         var_1374 = param3;
         var_2193 = param4;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get bgOnly() : Boolean
      {
         return var_2193;
      }
      
      public function get light() : uint
      {
         return var_1374;
      }
      
      public function get type() : String
      {
         return _type;
      }
   }
}

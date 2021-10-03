package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1560:int = 9;
      
      public static const const_1476:int = 4;
      
      public static const const_1547:int = 1;
      
      public static const const_1256:int = 10;
      
      public static const const_1475:int = 2;
      
      public static const const_1321:int = 7;
      
      public static const const_1240:int = 11;
      
      public static const const_1599:int = 3;
      
      public static const const_1320:int = 8;
      
      public static const const_1343:int = 5;
      
      public static const const_1575:int = 6;
      
      public static const const_1180:int = 12;
       
      
      private var var_2153:String;
      
      private var _roomId:int;
      
      private var var_1130:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2153;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1130 = param1.readInteger();
         var_2153 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1130;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}

package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_228:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_228 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_228;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_228 = new RoomSettingsFlatInfo();
         var_228.allowFurniMoving = param1.readInteger() == 1;
         var_228.doorMode = param1.readInteger();
         var_228.id = param1.readInteger();
         var_228.ownerName = param1.readString();
         var_228.type = param1.readString();
         var_228.name = param1.readString();
         var_228.description = param1.readString();
         var_228.showOwnerName = param1.readInteger() == 1;
         var_228.allowTrading = param1.readInteger() == 1;
         var_228.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}

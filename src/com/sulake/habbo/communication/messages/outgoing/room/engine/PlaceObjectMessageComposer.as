package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_161:int;
      
      private var var_223:int = 0;
      
      private var _roomId:int;
      
      private var var_83:int = 0;
      
      private var _y:int = 0;
      
      private var var_1933:int;
      
      private var var_2192:String;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         var_161 = param1;
         var_1933 = param2;
         var_2192 = param3;
         var_83 = param4;
         _y = param5;
         var_223 = param6;
         _roomId = param7;
         _roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(var_1933)
         {
            case RoomObjectCategoryEnum.const_34:
               return [var_161 + " " + var_83 + " " + _y + " " + var_223];
            case RoomObjectCategoryEnum.const_32:
               return [var_161 + " " + var_2192];
            default:
               return [];
         }
      }
   }
}

package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1965:int;
      
      private var var_1966:int;
      
      private var var_2181:Boolean;
      
      private var var_2180:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2182:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1966 = param1;
         var_1965 = param2;
         var_2180 = param3;
         var_2182 = param4;
         var_2181 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1966,var_1965,var_2180,var_2182,int(var_2181)];
      }
      
      public function dispose() : void
      {
      }
   }
}

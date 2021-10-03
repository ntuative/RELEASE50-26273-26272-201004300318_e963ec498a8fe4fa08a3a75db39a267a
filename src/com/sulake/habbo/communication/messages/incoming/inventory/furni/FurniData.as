package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1388:String;
      
      private var var_1087:String;
      
      private var var_2030:Boolean;
      
      private var var_1501:int;
      
      private var var_2029:int;
      
      private var var_2028:Boolean;
      
      private var var_1502:String = "";
      
      private var var_2025:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1184:int;
      
      private var var_2027:Boolean;
      
      private var var_1708:int = -1;
      
      private var var_2026:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_2029 = param1;
         var_1087 = param2;
         _objId = param3;
         var_1184 = param4;
         _category = param5;
         var_1388 = param6;
         var_2030 = param7;
         var_2025 = param8;
         var_2027 = param9;
         var_2028 = param10;
         var_2026 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1502;
      }
      
      public function get extra() : int
      {
         return var_1501;
      }
      
      public function get classId() : int
      {
         return var_1184;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2028;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2030;
      }
      
      public function get stripId() : int
      {
         return var_2029;
      }
      
      public function get stuffData() : String
      {
         return var_1388;
      }
      
      public function get songId() : int
      {
         return var_1708;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1502 = param1;
         var_1501 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1087;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_2026;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2027;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2025;
      }
   }
}

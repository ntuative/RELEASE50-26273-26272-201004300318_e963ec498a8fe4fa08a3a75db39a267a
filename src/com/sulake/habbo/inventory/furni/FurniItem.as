package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2029:int;
      
      private var var_2025:Boolean;
      
      private var var_1708:int;
      
      private var var_1388:String;
      
      private var var_2183:Boolean = false;
      
      private var var_2026:int;
      
      private var var_458:int;
      
      private var var_1087:String;
      
      private var var_1502:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1184:int;
      
      private var var_2027:Boolean;
      
      private var var_2184:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_2029 = param1;
         var_1087 = param2;
         _objId = param3;
         var_1184 = param4;
         var_1388 = param5;
         var_2025 = param6;
         var_2027 = param7;
         var_2026 = param8;
         var_1502 = param9;
         var_1708 = param10;
         var_458 = -1;
      }
      
      public function get songId() : int
      {
         return var_1708;
      }
      
      public function get iconCallbackId() : int
      {
         return var_458;
      }
      
      public function get expiryTime() : int
      {
         return var_2026;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2184 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2183 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_458 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2027;
      }
      
      public function get slotId() : String
      {
         return var_1502;
      }
      
      public function get classId() : int
      {
         return var_1184;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2025;
      }
      
      public function get stuffData() : String
      {
         return var_1388;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_2029;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2183;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2184;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1087;
      }
   }
}

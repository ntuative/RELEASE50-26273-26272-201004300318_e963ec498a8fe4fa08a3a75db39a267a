package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_2283:Boolean;
      
      protected var var_1501:Number;
      
      protected var var_2285:Boolean;
      
      protected var _type:int;
      
      protected var var_2284:Boolean;
      
      protected var var_1708:int;
      
      protected var var_2282:Boolean;
      
      protected var var_1388:String;
      
      protected var var_1920:int;
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var var_1502:String;
      
      protected var var_1921:Boolean;
      
      protected var _category:int;
      
      protected var var_1918:int;
      
      protected var var_2294:int;
      
      protected var var_1922:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         _id = param1;
         _type = param2;
         _ref = param3;
         _category = param4;
         var_1921 = param5;
         var_2282 = param6;
         var_2283 = param7;
         var_2285 = param8;
         var_1388 = param9;
         var_1501 = param10;
         var_2294 = param11;
         var_1922 = param12;
         var_1918 = param13;
         var_1920 = param14;
         var_1502 = param15;
         var_1708 = param16;
      }
      
      public function get locked() : Boolean
      {
         return var_2284;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get extra() : Number
      {
         return var_1501;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2284 = param1;
      }
      
      public function get ref() : int
      {
         return _ref;
      }
      
      public function get songId() : int
      {
         return var_1708;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2285;
      }
      
      public function get slotId() : String
      {
         return var_1502;
      }
      
      public function get expires() : int
      {
         return var_2294;
      }
      
      public function get creationYear() : int
      {
         return var_1920;
      }
      
      public function get creationDay() : int
      {
         return var_1922;
      }
      
      public function get stuffData() : String
      {
         return var_1388;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2282;
      }
      
      public function get groupable() : Boolean
      {
         return var_1921;
      }
      
      public function get creationMonth() : int
      {
         return var_1918;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2283;
      }
   }
}

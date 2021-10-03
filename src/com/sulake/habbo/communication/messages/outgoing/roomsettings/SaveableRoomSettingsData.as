package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _password:String;
      
      private var var_2176:int;
      
      private var var_1814:int;
      
      private var var_2178:Boolean;
      
      private var var_2173:Boolean;
      
      private var var_2175:Array;
      
      private var var_1817:Boolean;
      
      private var var_1165:int;
      
      private var _name:String;
      
      private var _roomId:int;
      
      private var var_646:Array;
      
      private var var_1206:String;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get doorMode() : int
      {
         return var_1814;
      }
      
      public function get description() : String
      {
         return var_1206;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_2173;
      }
      
      public function get maximumVisitors() : int
      {
         return var_2176;
      }
      
      public function set description(param1:String) : void
      {
         var_1206 = param1;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1817 = param1;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_2176 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get categoryId() : int
      {
         return var_1165;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_2175;
      }
      
      public function get tags() : Array
      {
         return var_646;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1817;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1814 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_2178 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_646 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_2175 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1165 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_2178;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_2173 = param1;
      }
   }
}

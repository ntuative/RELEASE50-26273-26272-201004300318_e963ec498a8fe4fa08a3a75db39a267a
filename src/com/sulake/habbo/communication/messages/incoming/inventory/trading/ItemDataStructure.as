package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1087:String;
      
      private var var_1893:int;
      
      private var var_1924:int;
      
      private var var_1501:int;
      
      private var var_1920:int;
      
      private var _category:int;
      
      private var var_2391:int;
      
      private var var_1922:int;
      
      private var var_1923:int;
      
      private var var_1919:int;
      
      private var var_1918:int;
      
      private var var_1921:Boolean;
      
      private var var_1388:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1893 = param1;
         var_1087 = param2;
         var_1924 = param3;
         var_1919 = param4;
         _category = param5;
         var_1388 = param6;
         var_1501 = param7;
         var_1923 = param8;
         var_1922 = param9;
         var_1918 = param10;
         var_1920 = param11;
         var_1921 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1919;
      }
      
      public function get extra() : int
      {
         return var_1501;
      }
      
      public function get stuffData() : String
      {
         return var_1388;
      }
      
      public function get groupable() : Boolean
      {
         return var_1921;
      }
      
      public function get creationMonth() : int
      {
         return var_1918;
      }
      
      public function get roomItemID() : int
      {
         return var_1924;
      }
      
      public function get itemType() : String
      {
         return var_1087;
      }
      
      public function get itemID() : int
      {
         return var_1893;
      }
      
      public function get songID() : int
      {
         return var_1501;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1923;
      }
      
      public function get creationYear() : int
      {
         return var_1920;
      }
      
      public function get creationDay() : int
      {
         return var_1922;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}

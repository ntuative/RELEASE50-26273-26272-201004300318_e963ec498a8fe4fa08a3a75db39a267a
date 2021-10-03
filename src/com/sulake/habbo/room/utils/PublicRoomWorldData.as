package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1916:Number = 1;
      
      private var var_207:Number = 1;
      
      private var var_2179:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_2179 = param1;
         var_207 = param2;
         var_1916 = param3;
      }
      
      public function get scale() : Number
      {
         return var_207;
      }
      
      public function get heightScale() : Number
      {
         return var_1916;
      }
   }
}

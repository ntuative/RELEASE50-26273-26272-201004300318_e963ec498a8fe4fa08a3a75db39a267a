package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_1746:Number = 0;
      
      private var var_1745:Number = 0;
      
      private var var_1747:Number = 0;
      
      private var var_1744:Number = 0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1745 = param1;
         var_1747 = param2;
         var_1746 = param3;
         var_1744 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1745;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1746;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1747;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1744;
      }
   }
}

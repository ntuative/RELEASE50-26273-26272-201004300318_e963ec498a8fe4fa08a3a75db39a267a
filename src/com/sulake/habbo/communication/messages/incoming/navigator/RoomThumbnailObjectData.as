package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1451:int;
      
      private var var_1452:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1451;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1451 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1451 = this.var_1451;
         _loc1_.var_1452 = this.var_1452;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1452 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1452;
      }
   }
}

package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_912:LegacyWallGeometry = null;
      
      private var var_612:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_614:TileHeightMap = null;
      
      private var var_2179:String = null;
      
      private var _roomId:int = 0;
      
      private var var_613:SelectedRoomObjectData = null;
      
      private var var_911:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_912 = new LegacyWallGeometry();
         var_911 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_612 != null)
         {
            var_612.dispose();
         }
         var_612 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_614 != null)
         {
            var_614.dispose();
         }
         var_614 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2179 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_912;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_613;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_911;
      }
      
      public function dispose() : void
      {
         if(var_614 != null)
         {
            var_614.dispose();
            var_614 = null;
         }
         if(var_912 != null)
         {
            var_912.dispose();
            var_912 = null;
         }
         if(var_911 != null)
         {
            var_911.dispose();
            var_911 = null;
         }
         if(var_612 != null)
         {
            var_612.dispose();
            var_612 = null;
         }
         if(var_613 != null)
         {
            var_613.dispose();
            var_613 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_614;
      }
      
      public function get worldType() : String
      {
         return var_2179;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_613 != null)
         {
            var_613.dispose();
         }
         var_613 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_612;
      }
   }
}

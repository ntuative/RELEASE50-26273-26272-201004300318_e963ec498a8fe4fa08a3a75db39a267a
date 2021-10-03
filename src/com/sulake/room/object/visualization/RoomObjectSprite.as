package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1179:int = 0;
       
      
      private var _updateID:int = 0;
      
      private var var_1809:Boolean = false;
      
      private var var_2067:String = "normal";
      
      private var var_1267:String = "";
      
      private var _instanceId:int = 0;
      
      private var var_338:Boolean = true;
      
      private var _height:int = 0;
      
      private var var_1866:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_1063:Boolean = false;
      
      private var var_1064:Boolean = false;
      
      private var var_1807:Boolean = false;
      
      private var _offset:Point;
      
      private var var_2068:Boolean = true;
      
      private var var_1013:Number = 0;
      
      private var _width:int = 0;
      
      private var var_1808:String = "";
      
      private var var_877:BitmapData = null;
      
      public function RoomObjectSprite()
      {
         _offset = new Point(0,0);
         super();
         _instanceId = var_1179++;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         var_1064 = param1;
         ++_updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         var_1807 = param1;
         ++_updateID;
      }
      
      public function dispose() : void
      {
         var_877 = null;
         _width = 0;
         _height = 0;
      }
      
      public function get offsetX() : int
      {
         return _offset.x;
      }
      
      public function get offsetY() : int
      {
         return _offset.y;
      }
      
      public function get height() : int
      {
         return _height;
      }
      
      public function set blendMode(param1:String) : void
      {
         var_2067 = param1;
         ++_updateID;
      }
      
      public function set tag(param1:String) : void
      {
         var_1808 = param1;
         ++_updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         var_1267 = param1;
         ++_updateID;
      }
      
      public function get varyingDepth() : Boolean
      {
         return var_1809;
      }
      
      public function set offsetX(param1:int) : void
      {
         _offset.x = param1;
         ++_updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         _offset.y = param1;
         ++_updateID;
      }
      
      public function get relativeDepth() : Number
      {
         return var_1013;
      }
      
      public function get color() : int
      {
         return _color;
      }
      
      public function get alpha() : int
      {
         return var_1866;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         var_2068 = param1;
         ++_updateID;
      }
      
      public function get visible() : Boolean
      {
         return var_338;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         var_1809 = param1;
         ++_updateID;
      }
      
      public function get flipH() : Boolean
      {
         return var_1063;
      }
      
      public function get flipV() : Boolean
      {
         return var_1064;
      }
      
      public function get clickHandling() : Boolean
      {
         return var_1807;
      }
      
      public function get blendMode() : String
      {
         return var_2067;
      }
      
      public function get instanceId() : int
      {
         return _instanceId;
      }
      
      public function get tag() : String
      {
         return var_1808;
      }
      
      public function get assetName() : String
      {
         return var_1267;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         var_1013 = param1;
         ++_updateID;
      }
      
      public function get capturesMouse() : Boolean
      {
         return var_2068;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         var_1866 = param1;
         ++_updateID;
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get updateId() : int
      {
         return _updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         _color = param1;
         ++_updateID;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            _width = param1.width;
            _height = param1.height;
         }
         var_877 = param1;
         ++_updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_338 = param1;
         ++_updateID;
      }
      
      public function get asset() : BitmapData
      {
         return var_877;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         var_1063 = param1;
         ++_updateID;
      }
   }
}

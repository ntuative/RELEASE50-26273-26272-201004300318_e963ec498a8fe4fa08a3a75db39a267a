package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class FurniturePlane
   {
       
      
      private var var_70:Vector3d = null;
      
      private var var_631:Vector3d = null;
      
      private var var_515:Vector3d = null;
      
      private var var_287:Vector3d = null;
      
      private var var_180:Map = null;
      
      private var _bitmapData:BitmapData = null;
      
      private var var_2264:Boolean = false;
      
      private var _offset:Point = null;
      
      private var var_1371:int = -1;
      
      private var _id:String = null;
      
      private var var_891:Vector3d = null;
      
      private var _height:Number = 0;
      
      private var _width:Number = 0;
      
      private var var_138:Vector3d = null;
      
      private var var_630:Vector3d = null;
      
      private var var_77:Vector3d = null;
      
      private var var_104:Vector3d = null;
      
      private var var_103:Vector3d = null;
      
      private var var_2117:Number = 0;
      
      private var var_1104:Number = 0;
      
      private var var_286:Vector3d = null;
      
      private var var_2215:Number = 0;
      
      private var var_2213:Number = 0;
      
      private var _isVisible:Boolean = true;
      
      private var _color:uint = 0;
      
      private var var_2216:Number = 0;
      
      public function FurniturePlane(param1:IVector3d, param2:IVector3d, param3:IVector3d)
      {
         super();
         var_891 = new Vector3d();
         var_70 = new Vector3d();
         var_70.assign(param1);
         var_286 = new Vector3d();
         var_286.assign(param2);
         var_287 = new Vector3d();
         var_287.assign(param3);
         var_630 = new Vector3d();
         var_630.assign(param2);
         var_631 = new Vector3d();
         var_631.assign(param3);
         var_515 = Vector3d.crossProduct(var_286,var_287);
         if(false)
         {
            var_515.mul(Infinity);
         }
         _offset = new Point();
         var_138 = new Vector3d();
         var_103 = new Vector3d();
         var_77 = new Vector3d();
         var_104 = new Vector3d();
         var_180 = new Map();
      }
      
      public function get bitmapData() : BitmapData
      {
         if(_isVisible)
         {
            if(_bitmapData != null)
            {
               return _bitmapData.clone();
            }
         }
         return null;
      }
      
      public function setRotation(param1:Boolean) : void
      {
         if(param1 != var_2264)
         {
            if(!param1)
            {
               var_286.assign(var_630);
               var_287.assign(var_631);
            }
            else
            {
               var_286.assign(var_630);
               var_286.mul(0 / 0);
               var_287.assign(var_631);
               var_287.mul(0 / 0);
            }
            var_1371 = -1;
            var_1104 = var_1104 - 1;
            var_2264 = param1;
            resetTextureCache();
         }
      }
      
      private function resetTextureCache() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_180 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_180.length)
            {
               _loc2_ = var_180.getWithIndex(_loc1_) as BitmapData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_180.reset();
         }
      }
      
      public function get visible() : Boolean
      {
         return _isVisible;
      }
      
      public function get offset() : Point
      {
         return _offset;
      }
      
      private function renderTexture(param1:IRoomGeometry, param2:BitmapData) : void
      {
         if(var_138 == null || var_103 == null || var_77 == null || var_104 == null || param2 == null || _bitmapData == null)
         {
            return;
         }
         var _loc3_:Number = 0 - 0;
         var _loc4_:Number = 0 - 0;
         var _loc5_:Number = 0 - 0;
         var _loc6_:Number = 0 - 0;
         if(Math.abs(_loc5_ - param2.width) <= 1)
         {
            _loc5_ = param2.width;
         }
         if(Math.abs(_loc6_ - param2.width) <= 1)
         {
            _loc6_ = param2.width;
         }
         if(Math.abs(_loc3_ - param2.height) <= 1)
         {
            _loc3_ = param2.height;
         }
         if(Math.abs(_loc4_ - param2.height) <= 1)
         {
            _loc4_ = param2.height;
         }
         var _loc7_:Number = _loc5_ / param2.width;
         var _loc8_:Number = _loc6_ / param2.width;
         var _loc9_:Number = _loc3_ / param2.height;
         var _loc10_:Number = _loc4_ / param2.height;
         var _loc11_:Matrix = new Matrix();
         _loc11_.a = _loc7_;
         _loc11_.b = _loc8_;
         _loc11_.c = _loc9_;
         _loc11_.d = _loc10_;
         _loc11_.translate(var_77.x,var_77.y);
         draw(param2,_loc11_);
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(_bitmapData != null)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
         if(var_180 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_180.length)
            {
               _loc2_ = var_180.getWithIndex(_loc1_) as BitmapData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_180.dispose();
            var_180 = null;
         }
         var_891 = null;
         var_70 = null;
         var_286 = null;
         var_287 = null;
         var_630 = null;
         var_631 = null;
         var_515 = null;
         var_138 = null;
         var_103 = null;
         var_77 = null;
         var_104 = null;
      }
      
      public function get rightSide() : IVector3d
      {
         return var_287;
      }
      
      private function cacheTexture(param1:String, param2:BitmapData) : Boolean
      {
         var _loc3_:BitmapData = var_180.remove(param1) as BitmapData;
         if(_loc3_ != null && param2 != _loc3_)
         {
            _loc3_.dispose();
         }
         var_180.add(param1,param2);
         return true;
      }
      
      public function get location() : IVector3d
      {
         return var_70;
      }
      
      private function draw(param1:BitmapData, param2:Matrix) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(_bitmapData != null)
         {
            if(param2.a == 1 && param2.d == 1 && param2.c == 0 && param2.b != 0 && Math.abs(param2.b) <= 1)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               _loc5_ = 0;
               _loc6_ = 0;
               if(param2.b > 0)
               {
                  ++param2.ty;
               }
               _loc7_ = 0;
               while(_loc3_ < param1.width)
               {
                  _loc3_++;
                  _loc5_ += Math.abs(param2.b);
                  if(_loc5_ >= 1)
                  {
                     _bitmapData.copyPixels(param1,new Rectangle(_loc4_ + _loc6_,0,_loc3_ - _loc4_,param1.height),new Point(param2.tx + _loc4_,param2.ty + _loc7_),null,null,true);
                     _loc4_ = _loc3_;
                     if(param2.b > 0)
                     {
                        _loc7_++;
                     }
                     else
                     {
                        _loc7_--;
                     }
                     _loc5_ = 0;
                  }
               }
               if(_loc5_ > 0)
               {
                  _bitmapData.copyPixels(param1,new Rectangle(_loc4_,0,_loc3_ - _loc4_,param1.height),new Point(param2.tx + _loc4_,param2.ty + _loc7_),null,null,true);
               }
               return;
            }
            _bitmapData.draw(param1,param2,null,null,null,false);
         }
      }
      
      public function get relativeDepth() : Number
      {
         return var_2117;
      }
      
      private function needsNewTexture(param1:IRoomGeometry) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:String = getTextureIdentifier(param1);
         var _loc3_:BitmapData = var_180.getValue(_loc2_) as BitmapData;
         if(_width > 0 && _height > 0)
         {
            if(_loc3_ == null)
            {
               return true;
            }
         }
         return false;
      }
      
      public function update(param1:IRoomGeometry, param2:int) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = NaN;
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:* = null;
         if(param1 == null || var_70 == null && var_891 != null || var_286 == null || var_287 == null || var_515 == null)
         {
            return false;
         }
         var _loc3_:Boolean = false;
         if(param1.updateId != var_1371)
         {
            var_1371 = param1.updateId;
            _loc4_ = param1.direction;
            if(_loc4_ != null && (_loc4_.x != var_1104 || _loc4_.y != var_2213 || _loc4_.z != var_2215 || param1.scale != var_2216))
            {
               var_1104 = _loc4_.x;
               var_2213 = _loc4_.y;
               var_2215 = _loc4_.z;
               var_2216 = param1.scale;
               _loc3_ = true;
               _loc5_ = 0;
               _loc5_ = Number(Vector3d.cosAngle(param1.directionAxis,normal));
               if(_loc5_ > -0.001)
               {
                  if(_isVisible)
                  {
                     _isVisible = false;
                     return true;
                  }
                  return false;
               }
               updateCorners(param1);
               _loc6_ = param1.getScreenPosition(var_891);
               _loc7_ = _loc6_.z;
               _loc8_ = Math.max(0 - _loc7_,0 - _loc7_,0 - _loc7_,0 - _loc7_);
               var_2117 = _loc8_;
               _isVisible = true;
            }
         }
         if(needsNewTexture(param1) || _loc3_)
         {
            if(_bitmapData == null || _width != _bitmapData.width || _height != _bitmapData.height)
            {
               if(_bitmapData != null)
               {
                  _bitmapData.dispose();
                  _bitmapData = null;
                  if(_width < 1 || _height < 1)
                  {
                     return true;
                  }
               }
               else if(_width < 1 || _height < 1)
               {
                  return false;
               }
               _bitmapData = new BitmapData(_width,_height,true,16777215);
               _bitmapData.lock();
            }
            else
            {
               _bitmapData.lock();
               _bitmapData.fillRect(_bitmapData.rect,16777215);
            }
            _loc9_ = getTexture(param1,param2);
            if(_loc9_ != null)
            {
               renderTexture(param1,_loc9_);
            }
            _bitmapData.unlock();
            return true;
         }
         return false;
      }
      
      private function updateCorners(param1:IRoomGeometry) : void
      {
         var_138.assign(param1.getScreenPosition(var_70));
         var_103.assign(param1.getScreenPosition(Vector3d.sum(var_70,var_287)));
         var_77.assign(param1.getScreenPosition(Vector3d.sum(Vector3d.sum(var_70,var_286),var_287)));
         var_104.assign(param1.getScreenPosition(Vector3d.sum(var_70,var_286)));
         _offset = param1.getScreenPoint(var_891);
         var_138.x = Math.round(var_138.x);
         var_138.y = Math.round(var_138.y);
         var_103.x = Math.round(var_103.x);
         var_103.y = Math.round(var_103.y);
         var_77.x = Math.round(var_77.x);
         var_77.y = Math.round(var_77.y);
         var_104.x = Math.round(var_104.x);
         var_104.y = Math.round(var_104.y);
         _offset.x = Math.round(_offset.x);
         _offset.y = Math.round(_offset.y);
         var _loc2_:Number = Math.min(var_138.x,var_103.x,var_77.x,var_104.x);
         var _loc3_:Number = Math.max(var_138.x,var_103.x,var_77.x,var_104.x);
         var _loc4_:Number = Math.min(var_138.y,var_103.y,var_77.y,var_104.y);
         var _loc5_:Number = Math.max(var_138.y,var_103.y,var_77.y,var_104.y);
         _loc3_ -= _loc2_;
         _offset.x = 0 - _loc2_;
         var_138.x = 0 - _loc2_;
         var_103.x = 0 - _loc2_;
         var_77.x = 0 - _loc2_;
         var_104.x = 0 - _loc2_;
         _loc5_ -= _loc4_;
         _offset.y = 0 - _loc4_;
         var_138.y = 0 - _loc4_;
         var_103.y = 0 - _loc4_;
         var_77.y = 0 - _loc4_;
         var_104.y = 0 - _loc4_;
         _width = _loc3_;
         _height = _loc5_;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      private function getTexture(param1:IRoomGeometry, param2:int) : BitmapData
      {
         var _loc5_:* = NaN;
         var _loc6_:* = NaN;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:String = getTextureIdentifier(param1);
         var _loc4_:* = null;
         if(needsNewTexture(param1))
         {
            _loc5_ = Number(0 * param1.scale);
            _loc6_ = Number(0 * param1.scale);
            if(_loc5_ < 1)
            {
               _loc5_ = 1;
            }
            if(_loc6_ < 1)
            {
               _loc6_ = 1;
            }
            _loc7_ = param1.getCoordinatePosition(var_515);
            _loc4_ = var_180.getValue(_loc3_) as BitmapData;
            if(_loc4_ == null)
            {
               _loc4_ = new BitmapData(_loc5_,_loc6_,true,4278190080 | _color);
               if(_loc4_ != null)
               {
                  cacheTexture(_loc3_,_loc4_);
               }
            }
         }
         else
         {
            _loc4_ = var_180.getValue(_loc3_) as BitmapData;
         }
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         return null;
      }
      
      public function get normal() : IVector3d
      {
         return var_515;
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
      }
      
      private function getTextureIdentifier(param1:IRoomGeometry) : String
      {
         if(param1 == null)
         {
            return null;
         }
         return String(param1.scale);
      }
      
      public function get leftSide() : IVector3d
      {
         return var_286;
      }
   }
}

package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.visualization.furniture.data.ColorData;
   import com.sulake.habbo.room.object.visualization.furniture.data.LayerData;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class FurnitureVisualization extends RoomObjectSpriteVisualization
   {
      
      protected static const const_1411:Number = Math.sqrt(0.5);
       
      
      protected var _direction:int;
      
      protected var var_2304:int = -1;
      
      private var var_519:Array;
      
      private var var_2144:int = -1;
      
      protected var _data:FurnitureVisualizationData = null;
      
      protected var _alphaMultiplier:Number = 1;
      
      protected var _type:String = "";
      
      private var var_520:Array;
      
      protected var var_1608:String = null;
      
      private var var_518:Array;
      
      private var var_523:Array;
      
      private var var_2145:Number = 0;
      
      private var var_521:Array;
      
      private var var_1309:Boolean = true;
      
      private var var_607:Array;
      
      private var var_606:Array;
      
      private var var_2142:Number = 0;
      
      private var var_517:Array;
      
      private var var_524:Array;
      
      private var var_522:Array;
      
      protected var var_2303:Number = NaN;
      
      private var var_2143:int = -1;
      
      public function FurnitureVisualization()
      {
         var_606 = [];
         var_607 = [];
         var_520 = [];
         var_517 = [];
         var_522 = [];
         var_523 = [];
         var_519 = [];
         var_524 = [];
         var_518 = [];
         var_521 = [];
         super();
         reset();
      }
      
      protected function getSpriteZOffset(param1:int, param2:int, param3:int) : Number
      {
         if(false)
         {
            return var_524[param1];
         }
         if(_data == null)
         {
            return LayerData.const_369;
         }
         var _loc4_:Number = _data.getZOffset(param1,param2,param3);
         var_524[param1] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteAssetName(param1:int, param2:Number) : String
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(_data == null)
         {
            return "";
         }
         var _loc3_:String = "null";
         var _loc4_:Boolean = false;
         if(_loc3_ == null || _loc3_.length == 0)
         {
            _loc5_ = _data.getSize(param2);
            _loc3_ = _type;
            _loc6_ = "";
            if(param1 < spriteCount - 1)
            {
               _loc6_ = String.fromCharCode("a".charCodeAt() + param1);
            }
            else
            {
               _loc6_ = "sd";
            }
            if(_loc5_ == 1)
            {
               _loc3_ += "_icon_" + _loc6_;
               _loc4_ = false;
            }
            else
            {
               _loc3_ += "_" + _loc5_ + "_" + _loc6_ + "_" + _direction;
               _loc4_ = true;
            }
            var_606[param1] = _loc3_;
            var_607[param1] = _loc4_;
         }
         if(_loc4_)
         {
            _loc7_ = getFrameNumber(param1,param2);
            _loc3_ += "_" + _loc7_;
         }
         return _loc3_;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         reset();
         if(param1 == null || !(param1 is FurnitureVisualizationData))
         {
            return false;
         }
         _data = param1 as FurnitureVisualizationData;
         _type = _data.getType();
         return true;
      }
      
      protected function getSpriteInk(param1:int, param2:int, param3:int) : int
      {
         if(false)
         {
            return var_521[param1];
         }
         if(_data == null)
         {
            return LayerData.const_386;
         }
         var _loc4_:int = _data.getInk(param1,_direction,param3);
         var_521[param1] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         if(false)
         {
            return var_519[param1];
         }
         if(_data == null)
         {
            return LayerData.const_471;
         }
         var _loc4_:int = _data.getYOffset(param1,param2,param3);
         var_519[param1] = _loc4_;
         return _loc4_;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _data = null;
         var_606 = null;
         var_607 = null;
         var_520 = null;
         var_517 = null;
         var_522 = null;
         var_523 = null;
         var_519 = null;
         var_524 = null;
         var_518 = null;
         var_521 = null;
      }
      
      protected function getSpriteMouseCapture(param1:int, param2:int, param3:int) : Boolean
      {
         if(false)
         {
            return var_518[param1];
         }
         if(_data == null)
         {
            return true;
         }
         var _loc4_:* = !_data.getIgnoreMouse(param1,_direction,param3);
         var_518[param1] = _loc4_;
         return _loc4_;
      }
      
      protected function updateAnimation(param1:Number) : Boolean
      {
         return false;
      }
      
      protected function updateSprites(param1:int, param2:Number) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = NaN;
         var _loc10_:int = 0;
         if(_data == null)
         {
            return;
         }
         var _loc3_:int = _data.getLayerCount(param1) + 1;
         if(_loc3_ != spriteCount)
         {
            createSprites(_loc3_);
         }
         updateAssetNameCache(_direction,param1);
         updateSpriteValueCache(_direction,param1);
         var _loc4_:Boolean = false;
         if(var_1608 != null && var_1608.indexOf("http") == 0)
         {
            _loc4_ = true;
         }
         var _loc5_:int = spriteCount - 1;
         while(_loc5_ >= 0)
         {
            _loc6_ = getSpriteAssetName(_loc5_,param1);
            _loc7_ = getSprite(_loc5_);
            if(_loc7_ != null)
            {
               _loc8_ = null;
               if(assetCollection != null)
               {
                  _loc8_ = assetCollection.getAsset(_loc6_);
               }
               if(_loc8_ != null && _loc8_.asset != null)
               {
                  _loc7_.visible = true;
                  _loc7_.asset = _loc8_.asset.content as BitmapData;
                  _loc7_.flipH = _loc8_.flipH;
                  _loc7_.flipV = _loc8_.flipV;
                  _loc7_.offsetX = _loc8_.offsetX;
                  _loc7_.offsetY = _loc8_.offsetY;
                  _loc9_ = 0;
                  if(_loc5_ < spriteCount - 1)
                  {
                     _loc7_.tag = getSpriteTag(_loc5_,_direction,param1);
                     _loc7_.alpha = getSpriteAlpha(_loc5_,_direction,param1);
                     _loc7_.color = getSpriteColor(_loc5_,var_2304,param1);
                     _loc7_.offsetX += getSpriteXOffset(_loc5_,_direction,param1);
                     _loc7_.offsetY += getSpriteYOffset(_loc5_,_direction,param1);
                     _loc7_.capturesMouse = getSpriteMouseCapture(_loc5_,_direction,param1);
                     _loc7_.blendMode = getBlendMode(getSpriteInk(_loc5_,_direction,param1));
                     _loc9_ = Number(getSpriteZOffset(_loc5_,_direction,param1));
                     _loc9_ -= _loc5_ * 0.001;
                  }
                  else
                  {
                     _loc10_ = 96;
                     _loc10_ *= _alphaMultiplier;
                     _loc7_.alpha = _loc10_;
                     _loc7_.capturesMouse = false;
                     _loc9_ = 1;
                  }
                  _loc9_ *= param2;
                  _loc7_.relativeDepth = _loc9_;
                  _loc7_.assetName = _loc6_;
                  _loc7_.clickHandling = _loc4_;
               }
               else
               {
                  _loc7_.asset = null;
                  _loc7_.assetName = "";
                  _loc7_.tag = "";
                  _loc7_.flipH = false;
                  _loc7_.flipV = false;
                  _loc7_.offsetX = 0;
                  _loc7_.offsetY = 0;
                  _loc7_.relativeDepth = 0;
                  _loc7_.clickHandling = false;
               }
            }
            _loc5_--;
         }
         var_1309 = false;
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc5_:Number = NaN;
         if(param1 == null)
         {
            return;
         }
         if(_data == null)
         {
            return;
         }
         var _loc3_:Boolean = false;
         var _loc4_:Number = param1.scale;
         if(updateObject(_loc4_,param1.direction.x))
         {
            _loc3_ = true;
         }
         if(updateModel(_loc4_))
         {
            _loc3_ = true;
         }
         if(updateAnimation(_loc4_))
         {
            _loc3_ = true;
         }
         if(_loc3_ || var_213 != _loc4_)
         {
            _loc5_ = const_1411;
            updateSprites(_loc4_,_loc5_);
            var_213 = _loc4_;
            increaseUpdateId();
         }
      }
      
      override protected function reset() : void
      {
         super.reset();
         _direction = -1;
         _data = null;
         var_606 = [];
         var_607 = [];
         var_520 = [];
         var_517 = [];
         var_522 = [];
         var_523 = [];
         var_519 = [];
         var_524 = [];
         var_518 = [];
         var_521 = [];
         this.createSprites(0);
      }
      
      protected function getBlendMode(param1:int) : String
      {
         var _loc2_:String = "null";
         switch(param1)
         {
            case LayerData.const_882:
               _loc2_ = "null";
               break;
            case LayerData.INK_DARKEN:
               _loc2_ = "null";
               break;
            case LayerData.const_881:
               _loc2_ = "null";
         }
         return _loc2_;
      }
      
      private function updateAssetNameCache(param1:int, param2:Number) : void
      {
         var _loc3_:int = 0;
         if(var_2144 != param1 || var_2142 != param2)
         {
            _loc3_ = spriteCount - 1;
            while(_loc3_ >= 0)
            {
               var_606[_loc3_] = "";
               var_607[_loc3_] = false;
               _loc3_--;
            }
            var_2144 = param1;
            var_2142 = param2;
         }
      }
      
      protected function getSpriteAlpha(param1:int, param2:int, param3:int) : int
      {
         if(false && !var_1309)
         {
            return var_517[param1];
         }
         if(_data == null)
         {
            return LayerData.const_417;
         }
         var _loc4_:int = _data.getAlpha(param1,param2,param3);
         _loc4_ *= _alphaMultiplier;
         var_517[param1] = _loc4_;
         return _loc4_;
      }
      
      private function updateSpriteValueCache(param1:int, param2:Number) : void
      {
         var _loc3_:int = 0;
         if(var_2143 != param1 || var_2145 != param2)
         {
            _loc3_ = spriteCount - 1;
            while(_loc3_ >= 0)
            {
               var_520[_loc3_] = null;
               var_517[_loc3_] = null;
               var_522[_loc3_] = null;
               var_523[_loc3_] = null;
               var_519[_loc3_] = null;
               var_524[_loc3_] = null;
               var_518[_loc3_] = null;
               var_521[_loc3_] = null;
               _loc3_--;
            }
            var_2143 = param1;
            var_2145 = param2;
         }
      }
      
      protected function getSpriteTag(param1:int, param2:int, param3:int) : String
      {
         if(false)
         {
            return var_520[param1];
         }
         if(_data == null)
         {
            return "";
         }
         var _loc4_:String = _data.getTag(param1,_direction,param3);
         var_520[param1] = _loc4_;
         return _loc4_;
      }
      
      protected function updateModel(param1:Number) : Boolean
      {
         var _loc4_:* = NaN;
         var _loc2_:IRoomObject = object;
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:IRoomObjectModel = _loc2_.getModel();
         if(_loc3_ == null)
         {
            return false;
         }
         if(var_164 != _loc3_.getUpdateID())
         {
            var_2304 = _loc3_.getNumber(RoomObjectVariableEnum.const_222);
            _loc4_ = Number(_loc3_.getNumber(RoomObjectVariableEnum.const_235));
            if(isNaN(_loc4_))
            {
               _loc4_ = 1;
            }
            if(_loc4_ != _alphaMultiplier)
            {
               _alphaMultiplier = _loc4_;
               var_1309 = true;
            }
            var_1608 = _loc3_.getString(RoomObjectVariableEnum.const_302);
            var_164 = _loc3_.getUpdateID();
            return true;
         }
         return false;
      }
      
      protected function updateObject(param1:Number, param2:Number) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return false;
         }
         if(var_293 != _loc3_.getUpdateID() || param1 != var_213 || param2 != var_2303)
         {
            _loc4_ = _loc3_.getDirection().x - (param2 + 135);
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = _data.getDirectionValue(_loc4_,param1);
            _direction = _loc5_;
            var_293 = _loc3_.getUpdateID();
            var_2303 = param2;
            return true;
         }
         return false;
      }
      
      protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         if(false)
         {
            return var_523[param1];
         }
         if(_data == null)
         {
            return LayerData.const_443;
         }
         var _loc4_:int = _data.getXOffset(param1,param2,param3);
         var_523[param1] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteColor(param1:int, param2:int, param3:int) : int
      {
         if(false)
         {
            return var_522[param1];
         }
         if(_data == null)
         {
            return ColorData.const_71;
         }
         var _loc4_:int = _data.getColor(param1,param2,param3);
         var_522[param1] = _loc4_;
         return _loc4_;
      }
      
      protected function getFrameNumber(param1:int, param2:int) : int
      {
         return 0;
      }
   }
}

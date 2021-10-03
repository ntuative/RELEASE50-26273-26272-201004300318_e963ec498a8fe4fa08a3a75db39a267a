package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.utils.getTimer;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization
   {
       
      
      private const const_1424:int = 0;
      
      private var var_316:String;
      
      private var var_648:int = 0;
      
      private const const_1639:int = 1;
      
      private var var_1196:int;
      
      private var var_437:Boolean;
      
      private const const_782:int = 3;
      
      private var var_992:int = 0;
      
      private var var_480:int = 0;
      
      private var var_479:BitmapDataAsset;
      
      private const const_1072:int = 3;
      
      private const const_1640:int = 2;
      
      private var var_683:AvatarVisualizationData = null;
      
      private var var_478:BitmapDataAsset;
      
      private var var_343:Map;
      
      private var var_818:Array;
      
      public function AvatarVisualization()
      {
         var_1196 = getTimer();
         var_818 = new Array();
         super();
         var_343 = new Map();
         var_437 = false;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         var_683 = param1 as AvatarVisualizationData;
         createSprites(const_782);
         return true;
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc24_:Boolean = false;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:* = false;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:* = null;
         var _loc35_:* = null;
         var _loc36_:* = null;
         var _loc37_:int = 0;
         var _loc38_:int = 0;
         var _loc39_:* = null;
         var _loc40_:* = null;
         var _loc41_:* = null;
         var _loc42_:* = null;
         var _loc43_:int = 0;
         var _loc44_:int = 0;
         var _loc45_:int = 0;
         var _loc46_:int = 0;
         var _loc47_:int = 0;
         var _loc48_:int = 0;
         var _loc49_:int = 0;
         var _loc50_:int = 0;
         var _loc51_:int = 0;
         var _loc52_:int = 0;
         var _loc53_:int = 0;
         var _loc54_:* = null;
         var _loc55_:int = 0;
         var _loc56_:int = 0;
         var _loc57_:* = null;
         var _loc58_:int = 0;
         var _loc59_:int = 0;
         var _loc60_:int = 0;
         var _loc61_:int = 0;
         var _loc62_:int = 0;
         var _loc63_:* = null;
         var _loc64_:* = null;
         var _loc65_:int = 0;
         var _loc66_:int = 0;
         var _loc67_:int = 0;
         var _loc68_:int = 0;
         var _loc69_:int = 0;
         var _loc70_:* = null;
         var _loc71_:int = 0;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(var_683 == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModel = _loc3_.getModel();
         var _loc5_:String = "avatarImage" + param1.scale.toString();
         var _loc6_:* = var_343.getValue(_loc5_) as IAvatarImage;
         var _loc7_:String = _loc4_.getString(RoomObjectVariableEnum.const_164);
         var _loc8_:Boolean = false;
         var _loc9_:int = _loc4_.getNumber(RoomObjectVariableEnum.const_566);
         var _loc10_:int = _loc4_.getNumber(RoomObjectVariableEnum.const_538);
         var _loc11_:int = param2 - _loc9_;
         if(_loc11_ < _loc10_ * 1000)
         {
            if(Math.random() * 100 > 33 && _loc6_ != null)
            {
               _loc8_ = true;
               var_480 = const_1072;
            }
         }
         var _loc12_:Boolean = false;
         var _loc13_:int = param2 - var_1196;
         if(_loc13_ > 5000 && _loc6_ != null && _loc6_.getScale() == AvatarScaleType.const_56)
         {
            if(Math.random() * 100 > 95)
            {
               var_1196 = param2;
               var_480 = const_1072;
               _loc12_ = true;
            }
         }
         var _loc14_:Boolean = false;
         var _loc15_:int = _loc4_.getNumber(RoomObjectVariableEnum.const_308);
         if(_loc15_ > 0)
         {
            _loc18_ = param2 - _loc15_;
            if(_loc18_ < 0)
            {
               _loc14_ = true;
               var_480 = const_1072;
            }
         }
         var _loc16_:Boolean = var_293 != _loc3_.getUpdateID() || var_213 != param1.scale || var_164 != _loc4_.getUpdateID();
         var _loc17_:Boolean = var_437 || var_480 > 0;
         if(_loc16_ || _loc17_)
         {
            increaseUpdateId();
            --var_480;
            _loc19_ = getTimer();
            if(var_316 != _loc7_)
            {
               for each(_loc40_ in var_343.getKeys())
               {
                  _loc41_ = var_343.getValue(_loc40_) as IAvatarImage;
                  if(_loc41_)
                  {
                     _loc41_.dispose();
                  }
                  var_343.remove(_loc40_);
               }
               if(_loc6_)
               {
                  _loc6_.dispose();
               }
               _loc6_ = null;
            }
            if(_loc6_ == null)
            {
               _loc42_ = _loc4_.getString(RoomObjectVariableEnum.const_965);
               _loc6_ = var_683.getAvatar(_loc7_,param1.scale,_loc42_);
               if(_loc6_ == null)
               {
                  return;
               }
               var_343.add(_loc5_,_loc6_);
               var_316 = _loc7_;
            }
            _loc20_ = _loc3_.getDirection().x - (param1.direction.x + 135 - 22.5);
            _loc20_ = (_loc20_ % 360 + 360) % 360;
            _loc6_.setDirectionAngle(AvatarSetType.const_40,_loc20_);
            _loc21_ = _loc4_.getNumber(RoomObjectVariableEnum.const_298);
            if(isNaN(_loc21_) || _loc4_.getString(RoomObjectVariableEnum.const_270) == "float")
            {
               _loc21_ = _loc20_;
            }
            else
            {
               _loc21_ -= param1.direction.x + 135 - 22.5;
            }
            _loc21_ = (_loc21_ % 360 + 360) % 360;
            _loc6_.setDirectionAngle(AvatarSetType.const_49,_loc21_);
            _loc6_.initActionAppends();
            _loc22_ = _loc4_.getString(RoomObjectVariableEnum.const_270);
            _loc23_ = _loc4_.getString(RoomObjectVariableEnum.const_599);
            _loc6_.appendAction(AvatarAction.const_526,_loc22_,_loc23_);
            _loc24_ = false;
            if(_loc22_ == "lay")
            {
               _loc43_ = int(_loc23_);
               if(_loc43_ < 0)
               {
                  _loc24_ = true;
               }
            }
            _loc25_ = _loc4_.getNumber(RoomObjectVariableEnum.const_400);
            if(_loc25_ > 0 && _loc6_.getScale() == AvatarScaleType.const_56)
            {
               _loc44_ = _loc4_.getNumber(RoomObjectVariableEnum.const_484);
               _loc45_ = 3;
               _loc46_ = param2 - _loc44_;
               if(_loc46_ < _loc45_ * 1000)
               {
                  _loc6_.appendAction(AvatarAction.const_328,AvatarAction.const_1244[_loc25_]);
               }
            }
            _loc26_ = _loc4_.getNumber(RoomObjectVariableEnum.const_826);
            if(_loc26_ > 0)
            {
               _loc6_.appendAction(AvatarAction.const_845,_loc26_);
            }
            _loc27_ = _loc4_.getNumber(RoomObjectVariableEnum.const_822);
            if(_loc27_ > 0)
            {
               _loc47_ = _loc4_.getNumber(RoomObjectVariableEnum.const_889);
               _loc48_ = 5;
               _loc49_ = param2 - _loc47_;
               if(_loc49_ < _loc48_ * 1000)
               {
                  _loc6_.appendAction(AvatarAction.const_1012,_loc27_);
               }
            }
            _loc28_ = _loc4_.getNumber(RoomObjectVariableEnum.const_584);
            _loc29_ = 0;
            if(_loc28_ > 0)
            {
               _loc50_ = _loc4_.getNumber(RoomObjectVariableEnum.const_673);
               _loc51_ = 100;
               _loc52_ = param2 - _loc50_;
               if(_loc52_ < _loc51_ * 1000)
               {
                  _loc6_.appendAction(AvatarAction.const_962,_loc28_);
                  _loc53_ = 1;
                  while(_loc53_ < 10)
                  {
                     if(_loc52_ > _loc53_ * 10 * 1000 && _loc52_ < _loc53_ * 10 * 1000 + 1000)
                     {
                        _loc29_ = _loc28_;
                     }
                     _loc53_++;
                  }
               }
            }
            _loc30_ = _loc4_.getNumber(RoomObjectVariableEnum.const_927);
            if(_loc29_ > 0)
            {
               _loc30_ = _loc29_;
            }
            if(_loc30_ > 0)
            {
               _loc6_.appendAction(AvatarAction.const_980,_loc30_);
            }
            if(_loc8_)
            {
               _loc6_.appendAction(AvatarAction.const_472);
            }
            _loc31_ = _loc4_.getNumber(RoomObjectVariableEnum.const_462) > 0;
            if(_loc31_ || _loc12_)
            {
               _loc6_.appendAction(AvatarAction.const_553);
            }
            if(_loc14_)
            {
               _loc6_.appendAction(AvatarAction.const_481);
            }
            _loc32_ = _loc4_.getNumber(RoomObjectVariableEnum.const_852);
            if(_loc32_ > 0)
            {
               _loc6_.appendAction(AvatarAction.const_664,_loc32_);
            }
            _loc6_.endActionAppends();
            ++var_648;
            ++var_992;
            if(var_992 > 1)
            {
               _loc6_.updateAnimationByFrames(1);
               var_992 = 0;
            }
            _loc33_ = const_782;
            for each(_loc34_ in _loc6_.getSprites())
            {
               if(_loc34_.id != "avatarImage")
               {
                  _loc33_++;
               }
            }
            if(_loc33_ != spriteCount)
            {
               createSprites(_loc33_);
            }
            _loc36_ = _loc6_.getCanvasOffsets();
            if(_loc36_ == null || _loc36_.length < 3)
            {
               _loc36_ = new Array(0,0,0);
            }
            _loc37_ = 0;
            if(_loc22_ == "sit" || _loc22_ == "lay")
            {
               _loc37_ = param1.scale / 2;
            }
            _loc35_ = getSprite(const_1424);
            if(_loc35_ != null)
            {
               _loc35_.asset = _loc6_.getImage(AvatarSetType.const_40,false);
               if(_loc35_.asset)
               {
                  _loc35_.offsetX = -1 * param1.scale / 2 + _loc36_[0];
                  _loc35_.offsetY = -_loc35_.asset.height + param1.scale / 4 + _loc36_[1] + _loc37_;
               }
               if(_loc24_)
               {
                  _loc35_.relativeDepth = -0.5;
               }
               else if(_loc22_ == "lay")
               {
                  _loc35_.relativeDepth = -0.409 + _loc36_[2];
               }
               else
               {
                  _loc35_.relativeDepth = -0.01 + _loc36_[2];
               }
            }
            var_437 = _loc6_.isAnimating();
            _loc38_ = const_782;
            for each(_loc39_ in _loc6_.getSprites())
            {
               if(_loc39_.id == "avatar")
               {
                  _loc35_ = getSprite(const_1424);
                  _loc54_ = _loc6_.getLayerData(_loc39_);
                  _loc55_ = _loc39_.getDirectionOffsetX(_loc6_.getDirection());
                  _loc56_ = _loc39_.getDirectionOffsetY(_loc6_.getDirection());
                  if(_loc54_ != null)
                  {
                     _loc55_ += _loc54_.dx;
                     _loc56_ += _loc54_.dy;
                  }
                  if(param1.scale < 48)
                  {
                     _loc55_ /= 2;
                     _loc56_ /= 2;
                  }
                  _loc35_.offsetX += _loc55_;
                  _loc35_.offsetY += _loc56_;
               }
               else
               {
                  _loc35_ = getSprite(_loc38_);
                  if(_loc35_ != null)
                  {
                     _loc35_.visible = true;
                     _loc57_ = _loc6_.getLayerData(_loc39_);
                     _loc58_ = 0;
                     _loc59_ = _loc39_.getDirectionOffsetX(_loc6_.getDirection());
                     _loc60_ = _loc39_.getDirectionOffsetY(_loc6_.getDirection());
                     _loc61_ = _loc39_.getDirectionOffsetZ(_loc6_.getDirection());
                     _loc62_ = 0;
                     if(_loc39_.hasDirections)
                     {
                        _loc62_ = _loc6_.getDirection();
                     }
                     if(_loc57_ != null)
                     {
                        _loc58_ = _loc57_.animationFrame;
                        _loc59_ += _loc57_.dx;
                        _loc60_ += _loc57_.dy;
                        _loc62_ += _loc57_.directionOffset;
                     }
                     if(param1.scale < 48)
                     {
                        _loc59_ /= 2;
                        _loc60_ /= 2;
                     }
                     if(_loc62_ < 0)
                     {
                        _loc62_ += 8;
                     }
                     if(_loc62_ > 7)
                     {
                        _loc62_ -= 8;
                     }
                     _loc63_ = _loc6_.getScale() + "_" + _loc39_.member + "_" + _loc62_ + "_" + _loc58_;
                     _loc64_ = _loc6_.getAsset(_loc63_);
                     if(_loc64_ == null)
                     {
                        continue;
                     }
                     _loc35_.asset = _loc64_.content as BitmapData;
                     _loc35_.offsetX = -1 * _loc64_.offset.x - param1.scale / 2 + _loc59_;
                     _loc35_.offsetY = -1 * _loc64_.offset.y + _loc60_ + _loc37_;
                     if(_loc22_ == "lay")
                     {
                        _loc35_.relativeDepth = -0.409 - 0.1 * _loc33_ * _loc61_;
                     }
                     else
                     {
                        _loc35_.relativeDepth = -0.01 - 0.1 * _loc33_ * _loc61_;
                     }
                     if(_loc39_.ink == 33)
                     {
                        _loc35_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc35_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc38_++;
               }
            }
            _loc35_ = getSprite(const_1639);
            var_478 = null;
            if(_loc22_ == "mv" || _loc22_ == "std")
            {
               _loc35_.visible = true;
               _loc65_ = 0;
               _loc66_ = 0;
               switch(param1.scale)
               {
                  case 32:
                     var_478 = _loc6_.getAsset("sh_std_sd_1_0_0");
                     _loc65_ = -8;
                     _loc66_ = -3;
                     break;
                  case 64:
                     var_478 = _loc6_.getAsset("h_std_sd_1_0_0");
                     _loc65_ = -17;
                     _loc66_ = -7;
               }
               if(var_478 != null)
               {
                  _loc35_.asset = var_478.content as BitmapData;
                  _loc35_.offsetX = _loc65_;
                  _loc35_.offsetY = _loc66_;
                  _loc35_.alpha = 50;
                  _loc35_.relativeDepth = 1;
               }
            }
            else
            {
               _loc35_.visible = false;
            }
            var_479 = null;
            _loc35_ = getSprite(const_1640);
            if(_loc4_.getNumber(RoomObjectVariableEnum.const_831))
            {
               _loc35_.visible = true;
               switch(param1.scale)
               {
                  case 32:
                     var_479 = var_683.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
                     _loc67_ = 3;
                     _loc68_ = -42;
                     break;
                  case 64:
                     var_479 = var_683.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
                     _loc67_ = 14;
                     _loc68_ = -83;
               }
               if(var_479 != null)
               {
                  _loc35_.asset = var_479.content as BitmapData;
                  _loc35_.offsetX = _loc67_;
                  _loc35_.offsetY = _loc68_;
                  _loc35_.relativeDepth = -0.02 + _loc36_[2];
               }
            }
            else
            {
               _loc35_.visible = false;
            }
            var_293 = _loc3_.getUpdateID();
            var_164 = _loc4_.getUpdateID();
            var_213 = param1.scale;
            var_818.push(getTimer() - _loc19_);
            if(false)
            {
               _loc69_ = 0;
               _loc70_ = "[";
               for each(_loc71_ in var_818)
               {
                  _loc69_ += _loc71_;
                  _loc70_ += "," + _loc71_;
               }
               _loc70_ += "]";
               var_818 = new Array();
            }
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         super.dispose();
         if(var_343 != null)
         {
            for each(_loc1_ in var_343)
            {
               if(_loc1_)
               {
                  _loc1_.dispose();
               }
            }
            var_343.dispose();
            var_343 = null;
         }
         var_683 = null;
         var_478 = null;
         var_479 = null;
      }
   }
}

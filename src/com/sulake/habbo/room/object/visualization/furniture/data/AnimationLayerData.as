package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationLayerData
   {
       
      
      private var var_412:int = -1;
      
      private var var_196:Array;
      
      private var var_1505:int = 1;
      
      private var var_1503:Boolean = false;
      
      private var var_1504:int = 1;
      
      public function AnimationLayerData(param1:int, param2:int, param3:Boolean)
      {
         var_196 = [];
         super();
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param2 < 1)
         {
            param2 = 1;
         }
         var_1504 = param1;
         var_1505 = param2;
         var_1503 = param3;
      }
      
      public function dispose() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < var_196.length)
         {
            _loc2_ = var_196[_loc1_] as AnimationFrameSequenceData;
            if(_loc2_ != null)
            {
               _loc2_.dispose();
            }
            _loc1_++;
         }
         var_196 = [];
      }
      
      public function addFrameSequence(param1:int, param2:Boolean) : AnimationFrameSequenceData
      {
         var _loc3_:AnimationFrameSequenceData = new AnimationFrameSequenceData(param1,param2);
         var_196.push(_loc3_);
         return _loc3_;
      }
      
      public function calculateLength() : void
      {
         var _loc2_:* = null;
         var_412 = 0;
         var _loc1_:int = 0;
         while(_loc1_ < var_196.length)
         {
            _loc2_ = var_196[_loc1_] as AnimationFrameSequenceData;
            if(_loc2_ != null)
            {
               var_412 += _loc2_.frameCount;
            }
            _loc1_++;
         }
      }
      
      public function get frameCount() : int
      {
         if(var_412 < 0)
         {
            calculateLength();
         }
         return var_412;
      }
      
      private function getFrameFromSpecificSequence(param1:int, param2:AnimationFrameSequenceData, param3:Boolean, param4:int) : AnimationFrame
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         var _loc10_:* = null;
         if(param2 != null)
         {
            _loc5_ = param2.getFrame(param1);
            if(_loc5_ == null)
            {
               return null;
            }
            _loc6_ = _loc5_.x;
            _loc7_ = _loc5_.y;
            if(_loc5_.randomX != 0)
            {
               _loc6_ += _loc5_.randomX * Math.random();
            }
            if(_loc5_.randomY != 0)
            {
               _loc7_ += _loc5_.randomY * Math.random();
            }
            _loc8_ = var_1505;
            if(param3)
            {
               _loc8_ = 0;
            }
            _loc9_ = false;
            if(!var_1503 && !param2.isRandom)
            {
               if(param4 == -1 && param1 == param2.frameCount - 1)
               {
                  _loc9_ = true;
               }
            }
            return new AnimationFrame(_loc5_.id,_loc6_,_loc7_,_loc8_,_loc9_,param4,param1);
         }
         return null;
      }
      
      public function getFrame(param1:int) : AnimationFrame
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(var_412 < 1)
         {
            return null;
         }
         var _loc2_:* = null;
         param1 /= var_1505;
         var _loc3_:Boolean = false;
         if(!var_1503)
         {
            _loc4_ = param1 / var_412;
            param1 %= var_412;
            if(var_1504 > 0 && _loc4_ >= var_1504)
            {
               param1 = var_412 - 1;
               _loc3_ = true;
            }
            _loc5_ = 0;
            _loc6_ = 0;
            _loc6_ = 0;
            while(_loc6_ < var_196.length)
            {
               _loc2_ = var_196[_loc6_] as AnimationFrameSequenceData;
               if(_loc2_ != null)
               {
                  if(param1 < _loc5_ + _loc2_.frameCount)
                  {
                     break;
                  }
                  _loc5_ += _loc2_.frameCount;
               }
               _loc6_++;
            }
            return getFrameFromSpecificSequence(param1 - _loc5_,_loc2_,_loc3_,_loc6_);
         }
         _loc7_ = 0 * Math.random();
         _loc2_ = var_196[_loc7_] as AnimationFrameSequenceData;
         if(_loc2_.frameCount < 1)
         {
            return null;
         }
         param1 %= _loc2_.frameCount;
         return getFrameFromSpecificSequence(param1,_loc2_,false,_loc7_);
      }
      
      public function getFrameFromSequence(param1:int, param2:int, param3:int) : AnimationFrame
      {
         if(param1 < 0 || param1 >= var_196.length)
         {
            return null;
         }
         var _loc4_:AnimationFrameSequenceData = var_196[param1] as AnimationFrameSequenceData;
         if(_loc4_ != null)
         {
            if(param2 >= _loc4_.frameCount)
            {
               return getFrame(param3);
            }
            return getFrameFromSpecificSequence(param2,_loc4_,false,param1);
         }
         return null;
      }
   }
}

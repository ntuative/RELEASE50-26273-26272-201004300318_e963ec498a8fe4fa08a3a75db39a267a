package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.utils.Vector3d;
   
   public class FurniturePlanetSystemVisualization extends AnimatedFurnitureVisualization
   {
       
      
      private var var_234:Array;
      
      private var var_604:Array;
      
      private var var_2128:Vector3d;
      
      private var _planetNameIndex:Array;
      
      public function FurniturePlanetSystemVisualization()
      {
         var_604 = new Array();
         var_2128 = new Vector3d(0,0,0);
         super();
      }
      
      private function readDefinition() : Boolean
      {
         var _loc7_:* = null;
         var _loc9_:* = null;
         var _loc1_:IRoomObject = object;
         if(_loc1_ == null)
         {
            return false;
         }
         var _loc2_:IRoomObjectModel = _loc1_.getModel();
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:String = _loc2_.getString(RoomObjectVariableEnum.const_973);
         var _loc4_:XMLList = XMLList(_loc3_);
         var _loc5_:XMLList = _loc4_.children();
         var _loc6_:int = _loc5_.length();
         var_234 = new Array();
         _planetNameIndex = new Array();
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            _loc9_ = _loc5_[_loc8_];
            _loc7_ = getSprite(_loc8_);
            if(_loc7_ != null)
            {
               addPlanet(_loc9_.@name,_loc8_,_loc9_.@parent,Number(_loc9_.@radius),Number(_loc9_.@arcspeed),Number(_loc9_.@arcoffset),Number(_loc9_.@height));
            }
            _loc8_++;
         }
         return true;
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         if(param1 < var_604.length)
         {
            return var_604[param1].y;
         }
         return super.getSpriteYOffset(param1,param2,param3);
      }
      
      override protected function getSpriteZOffset(param1:int, param2:int, param3:int) : Number
      {
         if(param1 < var_604.length)
         {
            return var_604[param1].z;
         }
         return super.getSpriteZOffset(param1,param2,param3);
      }
      
      private function getPlanet(param1:String) : FurniturePlanetSystemVisualizationPlanetObject
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < var_234.length)
         {
            _loc2_ = var_234[_loc3_];
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
            if(_loc2_.hasChild(param1))
            {
               return _loc2_.getChild(param1);
            }
            _loc3_++;
         }
         return null;
      }
      
      override protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         if(param1 < var_604.length)
         {
            return var_604[param1].x;
         }
         return super.getSpriteXOffset(param1,param2,param3);
      }
      
      private function addPlanet(param1:String, param2:int, param3:String, param4:Number, param5:Number, param6:Number, param7:Number) : void
      {
         var _loc9_:* = null;
         if(var_234 == null)
         {
            return;
         }
         var _loc8_:FurniturePlanetSystemVisualizationPlanetObject = new FurniturePlanetSystemVisualizationPlanetObject(param1,param2,param4,param5,param6,param7);
         _loc9_ = getPlanet(param3);
         if(_loc9_ != null)
         {
            _loc9_.addChild(_loc8_);
         }
         else
         {
            var_234.push(_loc8_);
            _planetNameIndex.push(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(var_234 == null && spriteCount > 0)
         {
            if(!readDefinition())
            {
               return false;
            }
         }
         if(var_234 != null)
         {
            _loc3_ = 0;
            while(_loc3_ < var_234.length)
            {
               _loc2_ = var_234[_loc3_];
               _loc2_.update(var_604,var_2128,param1);
               _loc3_++;
            }
            return super.updateAnimation(param1);
         }
         return false;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(var_234 != null)
         {
            while(false)
            {
               _loc1_ = var_234.shift();
               _loc1_.dispose();
            }
         }
         var_234 = null;
         _planetNameIndex = null;
      }
   }
}

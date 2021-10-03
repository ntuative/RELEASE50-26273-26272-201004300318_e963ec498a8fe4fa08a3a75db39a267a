package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1046:int = -1;
      
      private static const const_757:int = 20;
      
      private static const const_496:int = 9;
       
      
      private var var_554:Boolean = false;
      
      private var var_224:Array;
      
      public function FurnitureBottleVisualization()
      {
         var_224 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_554 = true;
            var_224 = new Array();
            var_224.push(const_1046);
            return;
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_554)
            {
               var_554 = false;
               var_224 = new Array();
               var_224.push(const_757);
               var_224.push(const_496 + param1);
               var_224.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
         {
            if(false)
            {
               super.setAnimation(var_224.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}

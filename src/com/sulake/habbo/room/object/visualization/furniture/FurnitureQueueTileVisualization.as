package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1079:int = 1;
      
      private static const const_1046:int = 3;
      
      private static const const_1081:int = 2;
      
      private static const const_1080:int = 15;
       
      
      private var var_838:int;
      
      private var var_224:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_224 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1081)
         {
            var_224 = new Array();
            var_224.push(const_1079);
            var_838 = const_1080;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_838 > 0)
         {
            --var_838;
         }
         if(var_838 == 0)
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

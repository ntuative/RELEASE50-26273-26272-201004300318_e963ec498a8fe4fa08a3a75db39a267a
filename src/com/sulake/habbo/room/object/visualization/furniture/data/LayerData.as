package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_417:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_386:int = 0;
      
      public static const const_881:int = 2;
      
      public static const const_882:int = 1;
      
      public static const const_591:Boolean = false;
      
      public static const const_645:String = "";
      
      public static const const_369:int = 0;
      
      public static const const_471:int = 0;
      
      public static const const_443:int = 0;
       
      
      private var var_1875:int = 0;
      
      private var var_1808:String = "";
      
      private var var_1474:int = 0;
      
      private var var_1876:int = 0;
      
      private var var_1874:Number = 0;
      
      private var var_1866:int = 255;
      
      private var var_1877:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1875;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1474 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1874;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1876 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1875 = param1;
      }
      
      public function get tag() : String
      {
         return var_1808;
      }
      
      public function get alpha() : int
      {
         return var_1866;
      }
      
      public function get ink() : int
      {
         return var_1474;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1874 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1876;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1877 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1877;
      }
      
      public function set tag(param1:String) : void
      {
         var_1808 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1866 = param1;
      }
   }
}

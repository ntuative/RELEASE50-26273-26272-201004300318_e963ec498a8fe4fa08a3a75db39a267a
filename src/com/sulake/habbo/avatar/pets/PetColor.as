package com.sulake.habbo.avatar.pets
{
   import flash.geom.ColorTransform;
   
   public class PetColor extends PetEditorInfo implements IPetColor
   {
       
      
      private var _id:int;
      
      private var var_1480:uint;
      
      private var _rgb:uint;
      
      private var var_2021:int;
      
      private var var_1481:Number;
      
      private var _b:uint;
      
      private var var_1482:Number;
      
      private var var_1479:uint;
      
      private var _colorTransform:ColorTransform;
      
      private var var_1478:Number;
      
      public function PetColor(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var _loc2_:String = param1.text();
         _rgb = parseInt(_loc2_,16);
         var_1480 = _rgb >> 16 & 255;
         var_1479 = _rgb >> 8 & 255;
         _b = _rgb >> 0 & 255;
         var_1478 = var_1480 / 255 * 1;
         var_1482 = var_1479 / 255 * 1;
         var_1481 = _b / 255 * 1;
         _colorTransform = new ColorTransform(var_1478,var_1482,var_1481);
      }
      
      public function set figurePartPaletteColorId(param1:int) : void
      {
         var_2021 = param1;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return _colorTransform;
      }
      
      public function get rgb() : uint
      {
         return _rgb;
      }
      
      public function get figurePartPaletteColorId() : int
      {
         return var_2021;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get g() : uint
      {
         return var_1479;
      }
      
      public function get b() : uint
      {
         return _b;
      }
      
      public function get r() : uint
      {
         return var_1480;
      }
   }
}

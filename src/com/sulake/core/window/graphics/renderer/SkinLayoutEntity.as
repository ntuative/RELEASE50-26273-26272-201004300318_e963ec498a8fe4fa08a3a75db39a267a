package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_262:uint = 1;
      
      public static const const_397:uint = 0;
      
      public static const const_839:uint = 8;
      
      public static const const_269:uint = 4;
      
      public static const const_489:uint = 2;
       
      
      private var var_402:uint;
      
      private var var_1796:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_1795:uint;
      
      private var var_97:Rectangle;
      
      private var var_646:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_97 = param3;
         _color = param4;
         var_402 = param5;
         var_1796 = param6;
         var_1795 = param7;
         var_646 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_1796;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_402;
      }
      
      public function get scaleV() : uint
      {
         return var_1795;
      }
      
      public function get tags() : Array
      {
         return var_646;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_97 = null;
         var_646 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_97;
      }
   }
}

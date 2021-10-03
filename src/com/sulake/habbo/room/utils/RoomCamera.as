package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_352:Number = 0.5;
      
      private static const const_763:int = 3;
      
      private static const const_1078:Number = 1;
       
      
      private var var_1890:Boolean = false;
      
      private var var_1884:Boolean = false;
      
      private var var_1012:int = 0;
      
      private var var_258:Vector3d = null;
      
      private var var_1889:int = 0;
      
      private var var_1891:int = 0;
      
      private var var_1885:Boolean = false;
      
      private var var_1883:int = -2;
      
      private var var_1886:Boolean = false;
      
      private var var_1888:int = 0;
      
      private var var_1887:int = -1;
      
      private var var_404:Vector3d = null;
      
      private var var_1892:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1889;
      }
      
      public function get targetId() : int
      {
         return var_1887;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1888 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1889 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1890 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1887 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1884 = param1;
      }
      
      public function dispose() : void
      {
         var_404 = null;
         var_258 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_404 == null)
         {
            var_404 = new Vector3d();
         }
         var_404.assign(param1);
         var_1012 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1883;
      }
      
      public function get screenHt() : int
      {
         return var_1892;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1891 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_258;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1892 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1888;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1890;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1884;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_404 != null && var_258 != null)
         {
            ++var_1012;
            _loc2_ = Vector3d.dif(var_404,var_258);
            if(_loc2_.length <= const_352)
            {
               var_258 = var_404;
               var_404 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_352 * (const_763 + 1))
               {
                  _loc2_.mul(const_352);
               }
               else if(var_1012 <= const_763)
               {
                  _loc2_.mul(const_352);
               }
               else
               {
                  _loc2_.mul(const_1078);
               }
               var_258 = Vector3d.sum(var_258,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1885 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1891;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1886 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1883 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_258 != null)
         {
            return;
         }
         var_258 = new Vector3d();
         var_258.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1885;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1886;
      }
   }
}

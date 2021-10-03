package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_721:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_721 = new ByteArray();
         var_721.writeShort(param1);
         var_721.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_721.position = 0;
         if(false)
         {
            _loc1_ = var_721.readShort();
            var_721.position = 0;
         }
         return _loc1_;
      }
   }
}

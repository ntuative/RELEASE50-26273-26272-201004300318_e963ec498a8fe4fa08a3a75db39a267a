package com.sulake.habbo.avatar.cache
{
   import com.sulake.core.utils.Map;
   import flash.utils.getTimer;
   
   public class AvatarImageActionCache
   {
       
      
      private var var_1925:int;
      
      private var var_142:Map;
      
      public function AvatarImageActionCache()
      {
         super();
         var_142 = new Map();
         setLastAccessTime();
      }
      
      public function setLastAccessTime() : void
      {
         var_1925 = getTimer();
      }
      
      private function debugInfo(param1:String) : void
      {
      }
      
      public function getLastAccessTime() : int
      {
         return var_1925;
      }
      
      public function getDirectionCache(param1:int) : AvatarImageDirectionCache
      {
         var _loc2_:String = param1.toString();
         return var_142.getValue(_loc2_) as AvatarImageDirectionCache;
      }
      
      public function updateDirectionCache(param1:int, param2:AvatarImageDirectionCache) : void
      {
         var _loc3_:String = param1.toString();
         var_142.add(_loc3_,param2);
      }
      
      public function dispose() : void
      {
         debugInfo("[dispose]");
         if(var_142 == null)
         {
            return;
         }
         var_142.dispose();
      }
   }
}

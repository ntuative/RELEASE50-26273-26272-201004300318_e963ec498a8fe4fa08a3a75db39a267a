package com.sulake.habbo.utils
{
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class HabboWebTools
   {
      
      public static const const_1235:String = "advertisement";
       
      
      public function HabboWebTools()
      {
         super();
      }
      
      public static function openWebPage(param1:String, param2:String = "") : void
      {
         var _loc4_:* = null;
         if(param2 == null || param2 == "")
         {
            param2 = const_1235;
         }
         var _loc3_:URLRequest = new URLRequest(param1);
         if(true)
         {
            navigateToURL(_loc3_,param2);
         }
         else
         {
            _loc4_ = String(ExternalInterface.call("function() {return navigator.userAgent;}")).toLowerCase();
            if(_loc4_.indexOf("firefox") != -1 || _loc4_.indexOf("msie") != -1 && uint(_loc4_.substr(_loc4_.indexOf("msie") + 5,3)) >= 7)
            {
               ExternalInterface.call("window.open",_loc3_.url,param2);
            }
            else
            {
               navigateToURL(_loc3_,param2);
            }
         }
      }
      
      public static function navigateToURL(param1:String, param2:String = null) : void
      {
         var _loc3_:URLRequest = new URLRequest(param1);
         navigateToURL(_loc3_,param2);
      }
   }
}

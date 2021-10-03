package com.sulake.habbo.avatar.structure
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class AvatarStructureDownloadSet extends EventDispatcher
   {
      
      public static const DOWNLOAD_SET_DONE:String = "DOWNLOAD_SET_DONE";
       
      
      private var var_1576:int = 0;
      
      private var var_1575:int = 0;
      
      public function AvatarStructureDownloadSet()
      {
         super();
      }
      
      public function add(param1:AvatarStructureDownload) : void
      {
         param1.addEventListener(AvatarStructureDownload.const_953,onDownloadDone);
         ++var_1576;
      }
      
      private function onDownloadDone(param1:Event = null) : void
      {
         ++var_1575;
         if(var_1575 == var_1576)
         {
            dispatchEvent(new Event(DOWNLOAD_SET_DONE));
         }
      }
   }
}

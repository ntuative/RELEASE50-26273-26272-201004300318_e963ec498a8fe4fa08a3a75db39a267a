package com.sulake.core.assets.loaders
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   
   class AssetLoaderEventBroker extends EventDispatcher implements IDisposable
   {
       
      
      protected var var_162:int = 0;
      
      protected var var_2363:int = 2;
      
      protected var var_378:int = 0;
      
      function AssetLoaderEventBroker()
      {
         super();
      }
      
      protected function loadEventHandler(param1:Event) : void
      {
         switch(param1.type)
         {
            case HTTPStatusEvent.HTTP_STATUS:
               var_162 = HTTPStatusEvent(param1).status;
               dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_888,var_162));
               break;
            case Event.COMPLETE:
               dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_37,var_162));
               break;
            case Event.UNLOAD:
               dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_984,var_162));
               break;
            case Event.OPEN:
               dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_854,var_162));
               break;
            case ProgressEvent.PROGRESS:
               dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_970,var_162));
               break;
            case IOErrorEvent.IO_ERROR:
               if(!retry())
               {
                  dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_48,var_162));
               }
               break;
            case SecurityErrorEvent.SECURITY_ERROR:
               if(!retry())
               {
                  dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_48,var_162));
               }
               break;
            default:
               Logger.log("Unknown asset loader event! AssetLoaderEventBroker::loadEventHandler(" + param1 + ")");
         }
      }
      
      protected function retry() : Boolean
      {
         return false;
      }
   }
}

package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   
   public class BinaryFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_15:URLLoader;
      
      protected var _type:String;
      
      protected var var_642:String;
      
      public function BinaryFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_642 = param2 == null ? "" : param2.url;
         _type = param1;
         var_15 = new URLLoader();
         var_15.addEventListener(Event.COMPLETE,loadEventHandler);
         var_15.addEventListener(Event.UNLOAD,loadEventHandler);
         var_15.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_15.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_15.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_15.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return !!var_15 ? 0 : uint(0);
      }
      
      public function load(param1:URLRequest) : void
      {
         var_642 = param1.url;
         var_378 = 0;
         var_15.dataFormat = _type == "application/octet-stream" ? "null" : URLLoaderDataFormat.TEXT;
         var_15.load(param1);
      }
      
      public function get ready() : Boolean
      {
         return bytesTotal > 0 ? bytesTotal == bytesLoaded : false;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_15.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_15.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_15.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_15.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_15.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_15.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               var_15.close();
            }
            catch(e:Error)
            {
            }
            var_15 = null;
            _type = null;
            var_642 = null;
         }
      }
      
      public function get url() : String
      {
         return var_642;
      }
      
      public function get bytesLoaded() : uint
      {
         return !!var_15 ? 0 : uint(0);
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get content() : Object
      {
         return !!var_15 ? var_15.data : null;
      }
      
      override protected function retry() : Boolean
      {
         if(!_disposed)
         {
            if(++var_378 < var_2363)
            {
               try
               {
                  var_15.close();
               }
               catch(e:Error)
               {
               }
               var_15.load(new URLRequest(var_642 + (var_642.indexOf("?") == -1 ? "?" : "&") + "retry=" + var_378));
               return true;
            }
         }
         return false;
      }
   }
}

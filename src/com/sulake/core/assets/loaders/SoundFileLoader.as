package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   
   public class SoundFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_15:Sound;
      
      protected var _type:String;
      
      protected var var_642:String;
      
      public function SoundFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_642 = param2 == null ? "" : param2.url;
         _type = param1;
         var_15 = new Sound(null,null);
         var_15.addEventListener(Event.ID3,loadEventHandler);
         var_15.addEventListener(Event.OPEN,loadEventHandler);
         var_15.addEventListener(Event.COMPLETE,loadEventHandler);
         var_15.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_15.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return !!var_15 ? 0 : uint(0);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            var_15.removeEventListener(Event.ID3,loadEventHandler);
            var_15.removeEventListener(Event.OPEN,loadEventHandler);
            var_15.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_15.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_15.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_15 = null;
            _type = null;
            var_642 = null;
            super.dispose();
         }
      }
      
      public function get ready() : Boolean
      {
         return bytesTotal > 0 ? bytesTotal == bytesLoaded : false;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_642 = param1.url;
         var_15.load(param1,null);
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
         return var_15;
      }
   }
}

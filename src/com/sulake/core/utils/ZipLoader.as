package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import deng.fzip.FZipErrorEvent;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_1262:uint = 0;
      
      private var var_1261:uint = 0;
      
      private var var_100:FZip;
      
      private var var_1260:Array;
      
      private var var_2003:uint = 0;
      
      private var var_867:int = 0;
      
      private var var_2393:Array;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1260 = new Array();
      }
      
      override protected function removeEventListeners() : void
      {
         if(var_100)
         {
            var_100.removeEventListener(Event.COMPLETE,onComplete);
            var_100.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            var_100.removeEventListener(ProgressEvent.PROGRESS,onProgress);
            var_100.removeEventListener(HTTPStatusEvent.HTTP_STATUS,onHTTPStatus);
            var_100.removeEventListener(FZipErrorEvent.const_119,onParseError);
         }
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         debug("Load event IO ERROR for file \"undefined\"");
         if(!handleHttpStatus(var_162))
         {
            failure("IO Error, load operation failed for file \"undefined\": " + param1.text);
            removeEventListeners();
         }
      }
      
      override public function get bytesLoaded() : uint
      {
         return var_1261;
      }
      
      private function onParseError(param1:FZipErrorEvent) : void
      {
         debug("Load event parse error for file \"undefined\"");
         if(!handleHttpStatus(var_162))
         {
            failure("Parse Error, load operation failed for file \"undefined\": " + param1.text);
            removeEventListeners();
         }
      }
      
      override protected function loadEventHandler(param1:Event) : void
      {
      }
      
      override public function get bytesTotal() : uint
      {
         return var_1262;
      }
      
      public function get resources() : Array
      {
         return var_1260;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var loaderInfo:LoaderInfo = null;
         var name:String = null;
         var event:Event = param1;
         try
         {
            loaderInfo = event.target as LoaderInfo;
            name = getQualifiedClassName(var_15.content);
            var_1260.push(var_15.contentLoaderInfo.applicationDomain.getDefinition(name));
            ++var_867;
            if(var_1260.length == var_2003)
            {
               var_15.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
               var_15.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
               removeEventListeners();
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0,var_1262,var_1261));
            }
            else
            {
               var_15.loadBytes(var_100.getFileAt(var_867).content);
            }
         }
         catch(e:Error)
         {
            failure("Crashed on ZipLoader.onLoaderComplete: \"undefined\": " + e.message);
         }
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         var_1262 = param1.bytesTotal;
         var_1261 = param1.bytesLoaded;
         debug("Load event PROGRESS for file \"undefined\"");
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0,var_1262,var_1261));
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 1) : void
      {
         ErrorReportStorage.addDebugData("Library url","Library url " + param1.url);
         var_68 = param1;
         _name = parseNameFromUrl(var_68.url);
         var_291 = param3;
         if(var_100)
         {
            var_100.close();
         }
         ErrorReportStorage.addDebugData("Library name","Library name " + _name);
         var_100 = new FZip();
         var_100.addEventListener(Event.COMPLETE,onComplete);
         var_100.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_100.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_100.addEventListener(HTTPStatusEvent.HTTP_STATUS,onHTTPStatus);
         var_100.addEventListener(FZipErrorEvent.const_119,onParseError);
         var_100.load(var_68);
      }
      
      override protected function handleHttpStatus(param1:int) : Boolean
      {
         if(param1 == 0 || param1 >= 400)
         {
            if(var_291 > 0)
            {
               if(var_100)
               {
                  var_100.close();
               }
               addRequestCounterToUrlRequest(var_68,const_1034 - var_291);
               var_100.load(var_68);
               --var_291;
               return true;
            }
            failure("HTTP Error " + param1 + " \"" + var_68.url + "\"");
            removeEventListeners();
         }
         return false;
      }
      
      private function onComplete(param1:Event) : void
      {
         var event:Event = param1;
         var_867 = 0;
         var_2003 = var_100.getFileCount();
         debug("Load event COMPLETE for file \"undefined\"");
         removeEventListeners();
         try
         {
            if(var_15)
            {
               var_15.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
               var_15.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
               var_15.loadBytes(var_100.getFileAt(var_867).content);
            }
         }
         catch(e:Error)
         {
            debug("Failed to extract files from library \"undefined\"");
            if(!handleHttpStatus(var_162))
            {
               failure("Crashed on ZipLoader.onComplete: \"undefined\": " + e.message);
            }
         }
      }
      
      private function onHTTPStatus(param1:HTTPStatusEvent) : void
      {
         var_162 = param1.status;
         debug("Load event STATUS " + var_162 + " for file \"" + var_68.url + "\"");
      }
   }
}

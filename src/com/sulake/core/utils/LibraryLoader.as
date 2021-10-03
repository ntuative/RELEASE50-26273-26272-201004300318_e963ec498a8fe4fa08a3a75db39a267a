package com.sulake.core.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   import flash.display.DisplayObject;
   import flash.display.FrameLabel;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class LibraryLoader extends EventDispatcher implements IDisposable
   {
      
      protected static const STATE_EVENT_INIT:uint = 2;
      
      protected static const STATE_EVENT_COMPLETE:uint = 1;
      
      protected static const const_1034:int = 5;
      
      protected static const STATE_READY:uint = 7;
      
      protected static const STATE_EVENT_FRAME:uint = 4;
      
      protected static const STATE_ANALYZE:uint = 3;
       
      
      protected var var_291:int;
      
      protected var var_2286:String = "";
      
      protected var var_162:int = 0;
      
      protected var var_539:XML;
      
      protected var var_1389:Boolean = false;
      
      protected var var_455:uint = 0;
      
      protected var var_15:Loader;
      
      protected var var_2287:String = "";
      
      protected var var_68:URLRequest;
      
      protected var var_1395:Boolean = false;
      
      protected var _name:String;
      
      protected var var_371:Class;
      
      protected var var_2410:uint = 0;
      
      protected var var_16:LoaderContext;
      
      public function LibraryLoader(param1:Boolean)
      {
         var_1395 = param1;
         var_162 = 0;
         var_15 = new Loader();
         var_15.contentLoaderInfo.addEventListener(Event.INIT,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(Event.COMPLETE,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(Event.UNLOAD,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         super();
      }
      
      protected static function parseNameFromUrl(param1:String) : String
      {
         var _loc2_:int = 0;
         _loc2_ = param1.indexOf("?",0);
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf(".");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf("/");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(_loc2_ + 1,param1.length);
         }
         return param1;
      }
      
      protected function addRequestCounterToUrlRequest(param1:URLRequest, param2:int) : void
      {
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc11_:* = null;
         if(param1.url == null || param1.url == "")
         {
            return;
         }
         var _loc3_:Array = param1.url.split("?");
         var _loc4_:String = _loc3_[0];
         var _loc5_:String = "";
         if(_loc3_.length > 1)
         {
            _loc5_ = _loc3_[1];
         }
         var _loc7_:Array = _loc5_.split("&");
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc11_ = _loc7_[_loc9_];
            if(_loc11_.indexOf("counterparameter=") >= 0)
            {
               _loc11_ = "counterparameter=" + param2.toString();
               _loc7_[_loc9_] = _loc11_;
               _loc8_ = true;
            }
            _loc9_++;
         }
         if(!_loc8_)
         {
            _loc7_.push("counterparameter=" + param2);
         }
         var _loc10_:String = _loc4_;
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            if(_loc9_ == 0)
            {
               _loc10_ = _loc10_ + "?" + _loc7_[_loc9_];
            }
            else
            {
               _loc10_ = _loc10_ + "&" + _loc7_[_loc9_];
            }
            _loc9_++;
         }
         param1.url = _loc10_;
      }
      
      protected function failure(param1:String) : void
      {
         var_2287 = param1;
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,var_162,bytesTotal,bytesLoaded));
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get resource() : Class
      {
         return var_371;
      }
      
      public function get request() : URLRequest
      {
         return var_68;
      }
      
      public function getLastErrorMessage() : String
      {
         return var_2287;
      }
      
      public function hasDefinition(param1:String) : Boolean
      {
         return var_15.contentLoaderInfo.applicationDomain.hasDefinition(param1);
      }
      
      public function get bytesTotal() : uint
      {
         return var_15.contentLoaderInfo.bytesTotal;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            try
            {
               var_15.close();
               var_15.unload();
            }
            catch(e:Error)
            {
            }
            var_15 = null;
            var_16 = null;
            var_371 = null;
            var_539 = null;
            super.dispose();
         }
      }
      
      public function get ready() : Boolean
      {
         return var_1389;
      }
      
      public function get manifest() : XML
      {
         return var_539;
      }
      
      protected function prepareLibrary() : void
      {
         var xmlClass:Class = null;
         debug("Preparing library \"" + _name + "\"");
         var_371 = this.getDefinition(_name) as Class;
         if(var_371 == null)
         {
            failure("Failed to find resource class \"" + _name + "\" in library " + var_68.url + "!");
            return;
         }
         try
         {
            xmlClass = var_371.manifest as Class;
            if(xmlClass == null)
            {
               return;
            }
         }
         catch(e:Error)
         {
            failure("Failed to find embedded manifest.xml in library undefined!");
            return;
         }
         var bytes:ByteArray = new xmlClass() as ByteArray;
         var_539 = new XML(bytes.readUTFBytes(bytes.length));
      }
      
      public function get domain() : ApplicationDomain
      {
         return var_15.contentLoaderInfo.applicationDomain;
      }
      
      public function getDefinition(param1:String) : Object
      {
         if(var_15.contentLoaderInfo.applicationDomain.hasDefinition(param1))
         {
            return var_15.contentLoaderInfo.applicationDomain.getDefinition(param1);
         }
         return null;
      }
      
      protected function analyzeLibrary() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:DisplayObject = var_15.content;
         debug("Analyzing library \"" + _name + "\", content " + (_loc1_ is MovieClip ? "is" : "is not") + " a MovieClip");
         debug("\tBytes loaded: " + var_15.contentLoaderInfo.bytesLoaded + "/" + var_15.contentLoaderInfo.bytesTotal);
         if(_loc1_ is MovieClip)
         {
            _loc2_ = _loc1_ as MovieClip;
            _loc4_ = _loc2_.currentLabels;
            debug("\tLibrary \"" + _name + "\" is in frame " + _loc2_.currentFrame + "(" + _loc2_.currentLabel + ")");
            if(_loc4_.length > 1)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  _loc3_ = _loc4_[_loc5_] as FrameLabel;
                  if(_loc3_.name == _name)
                  {
                     if(_loc3_.frame != _loc2_.currentFrame)
                     {
                        _loc2_.addEventListener(Event.ENTER_FRAME,loadEventHandler);
                        return false;
                     }
                  }
                  _loc5_++;
               }
            }
         }
         return true;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_15.contentLoaderInfo.bytesLoaded;
      }
      
      protected function debug(param1:String) : void
      {
         var_2286 = param1;
         if(var_1395)
         {
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DEBUG,var_162,bytesTotal,bytesLoaded));
         }
      }
      
      protected function loadEventHandler(param1:Event) : void
      {
         switch(param1.type)
         {
            case Event.INIT:
               debug("Load event INIT for file \"" + var_15.contentLoaderInfo.url + "\"");
               var_455 |= LibraryLoader.STATE_EVENT_INIT;
               break;
            case Event.COMPLETE:
               debug("Load event COMPLETE for file \"" + var_15.contentLoaderInfo.url + "\"");
               var_455 |= LibraryLoader.STATE_EVENT_COMPLETE;
               break;
            case Event.ENTER_FRAME:
               break;
            case HTTPStatusEvent.HTTP_STATUS:
               var_162 = HTTPStatusEvent(param1).status;
               debug("Load event STATUS " + var_162 + " for file \"" + var_15.contentLoaderInfo.url + "\"");
               break;
            case Event.UNLOAD:
               debug("Load event UNLOAD for file \"" + var_15.contentLoaderInfo.url + "\"");
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_UNLOAD,var_162,bytesTotal,bytesLoaded));
               break;
            case ProgressEvent.PROGRESS:
               debug("Load event PROGRESS for file \"" + var_15.contentLoaderInfo.url + "\"");
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,var_162,bytesTotal,bytesLoaded));
               break;
            case IOErrorEvent.IO_ERROR:
               debug("Load event IO ERROR for file \"" + var_15.contentLoaderInfo.url + "\"");
               if(!handleHttpStatus(var_162))
               {
                  failure("IO Error, send or load operation failed for file \"" + var_15.contentLoaderInfo.url + "\"");
                  removeEventListeners();
               }
               break;
            case SecurityErrorEvent.SECURITY_ERROR:
               failure("Security Error, security violation with file \"" + var_15.contentLoaderInfo.url + "\"");
               removeEventListeners();
               break;
            default:
               Logger.log("LibraryLoader::loadEventHandler(" + param1 + ")");
         }
         if(var_455 == LibraryLoader.STATE_ANALYZE)
         {
            if(analyzeLibrary())
            {
               var_455 |= LibraryLoader.STATE_EVENT_FRAME;
            }
         }
         if(var_455 == LibraryLoader.STATE_READY)
         {
            var_1389 = true;
            prepareLibrary();
            removeEventListeners();
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,var_162,bytesTotal,bytesLoaded));
         }
      }
      
      protected function handleHttpStatus(param1:int) : Boolean
      {
         var statusCode:int = param1;
         if(statusCode == 0 || statusCode >= 400)
         {
            if(var_291 > 0)
            {
               try
               {
                  var_15.close();
                  var_15.unload();
               }
               catch(e:Error)
               {
               }
               addRequestCounterToUrlRequest(var_68,const_1034 - var_291);
               var_15.load(var_68,var_16);
               --var_291;
               return true;
            }
            failure("HTTP Error " + statusCode + " \"" + var_15.contentLoaderInfo.url + "\"");
            removeEventListeners();
         }
         return false;
      }
      
      protected function removeEventListeners() : void
      {
         if(var_15)
         {
            if(false)
            {
               var_15.content.removeEventListener(Event.ENTER_FRAME,loadEventHandler);
            }
            var_15.contentLoaderInfo.removeEventListener(Event.INIT,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         }
      }
      
      public function get url() : String
      {
         return var_68.url;
      }
      
      public function get status() : int
      {
         return var_162;
      }
      
      public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 5) : void
      {
         ErrorReportStorage.addDebugData("Library url","Library url " + param1.url);
         var_1389 = false;
         var_68 = param1;
         if(param2 == null)
         {
            var_16 = new LoaderContext();
            var_16.applicationDomain = ApplicationDomain.currentDomain;
         }
         else
         {
            var_16 = param2;
         }
         var_291 = param3;
         _name = parseNameFromUrl(var_68.url);
         ErrorReportStorage.addDebugData("Library name","Library name " + _name);
         var_15.load(var_68,var_16);
      }
      
      public function getLastDebugMessage() : String
      {
         return var_2286;
      }
   }
}

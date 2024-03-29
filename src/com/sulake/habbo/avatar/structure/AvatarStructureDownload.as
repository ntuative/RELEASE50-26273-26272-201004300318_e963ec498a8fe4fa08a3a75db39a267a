package com.sulake.habbo.avatar.structure
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   
   public class AvatarStructureDownload extends EventDispatcher
   {
      
      public static const const_953:String = "AVATAR_STRUCTURE_DONE";
       
      
      private var _assets:IAssetLibrary;
      
      private var var_1801:IStructureData;
      
      private var var_1453:XML;
      
      public function AvatarStructureDownload(param1:IAssetLibrary, param2:String, param3:IStructureData)
      {
         super();
         _assets = param1;
         var_1801 = param3;
         var _loc4_:String = param2;
         if(_assets.hasAsset(_loc4_))
         {
            Logger.log("[AvatarStructureDownload] reload data for url: " + param2);
         }
         var _loc5_:URLRequest = new URLRequest(param2);
         var _loc6_:AssetLoaderStruct = _assets.loadAssetFromFile(_loc4_,_loc5_,"text/plain");
         _loc6_.addEventListener(AssetLoaderEvent.const_37,onDataComplete);
      }
      
      private function onDataComplete(param1:Event) : void
      {
         var event:Event = param1;
         var loaderStruct:AssetLoaderStruct = event.target as AssetLoaderStruct;
         if(loaderStruct == null)
         {
            return;
         }
         try
         {
            var_1453 = new XML(loaderStruct.assetLoader.content as String);
         }
         catch(e:Error)
         {
            Logger.log("[AvatarStructureDownload] Error: " + e.message);
            return;
         }
         if(var_1453 == null)
         {
            Logger.log("[AvatarStructureDownload] XML error: " + loaderStruct + " not valid XML");
            return;
         }
         var_1801.appendXML(var_1453);
         dispatchEvent(new Event(AvatarStructureDownload.const_953));
      }
   }
}

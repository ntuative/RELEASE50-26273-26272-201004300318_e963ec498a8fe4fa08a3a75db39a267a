package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_20:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_642:String;
      
      protected var var_460:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_460 = param1;
         var_642 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_460;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            var_20 = DisplayAsset(param1).var_20;
            var_460 = DisplayAsset(param1).var_460;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function get url() : String
      {
         return var_642;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            var_20 = param1 as DisplayObject;
            if(var_20 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            var_20 = DisplayAsset(param1).var_20;
            var_460 = DisplayAsset(param1).var_460;
            if(var_20 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function get content() : Object
      {
         return var_20;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(false)
            {
               if(var_20.loaderInfo.loader != null)
               {
                  var_20.loaderInfo.loader.unload();
               }
            }
            var_20 = null;
            var_460 = null;
            _disposed = true;
            var_642 = null;
         }
      }
   }
}

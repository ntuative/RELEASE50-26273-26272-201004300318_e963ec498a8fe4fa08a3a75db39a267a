package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1972:Class;
      
      private var var_1970:Class;
      
      private var var_1971:String;
      
      private var var_1246:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1971 = param1;
         var_1970 = param2;
         var_1972 = param3;
         if(rest == null)
         {
            var_1246 = new Array();
         }
         else
         {
            var_1246 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1972;
      }
      
      public function get assetClass() : Class
      {
         return var_1970;
      }
      
      public function get mimeType() : String
      {
         return var_1971;
      }
      
      public function get fileTypes() : Array
      {
         return var_1246;
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_210:String = "e";
      
      public static const const_82:String = "i";
      
      public static const const_83:String = "s";
       
      
      private var var_1015:String;
      
      private var var_1224:String;
      
      private var var_1222:int;
      
      private var var_2237:int;
      
      private var var_1016:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1224 = param1.readString();
         var_2237 = param1.readInteger();
         var_1015 = param1.readString();
         var_1016 = param1.readInteger();
         var_1222 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1016;
      }
      
      public function get productType() : String
      {
         return var_1224;
      }
      
      public function get expiration() : int
      {
         return var_1222;
      }
      
      public function get furniClassId() : int
      {
         return var_2237;
      }
      
      public function get extraParam() : String
      {
         return var_1015;
      }
   }
}

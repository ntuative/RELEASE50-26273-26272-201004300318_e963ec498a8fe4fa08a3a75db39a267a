package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_398:uint;
      
      private var var_998:IUnknown;
      
      private var var_1202:String;
      
      private var var_999:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_999 = param1;
         var_1202 = getQualifiedClassName(var_999);
         var_998 = param2;
         var_398 = 0;
      }
      
      public function get iid() : IID
      {
         return var_999;
      }
      
      public function get disposed() : Boolean
      {
         return var_998 == null;
      }
      
      public function get references() : uint
      {
         return var_398;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_398) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_998;
      }
      
      public function get iis() : String
      {
         return var_1202;
      }
      
      public function reserve() : uint
      {
         return ++var_398;
      }
      
      public function dispose() : void
      {
         var_999 = null;
         var_1202 = null;
         var_998 = null;
         var_398 = 0;
      }
   }
}

package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1353:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_931:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1353 = param1;
         var_931 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_931;
      }
      
      public function get identifier() : IID
      {
         return var_1353;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1353 = null;
            while(false)
            {
               var_931.pop();
            }
            var_931 = null;
         }
      }
   }
}

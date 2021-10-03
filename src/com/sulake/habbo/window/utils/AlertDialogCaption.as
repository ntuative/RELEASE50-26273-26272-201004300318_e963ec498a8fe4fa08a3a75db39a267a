package com.sulake.habbo.window.utils
{
   class AlertDialogCaption implements ICaption
   {
       
      
      private var var_338:Boolean;
      
      private var var_211:String;
      
      private var var_1372:String;
      
      function AlertDialogCaption(param1:String, param2:String, param3:Boolean)
      {
         super();
         var_211 = param1;
         var_1372 = param2;
         var_338 = param3;
      }
      
      public function get toolTip() : String
      {
         return var_1372;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_338 = param1;
      }
      
      public function get text() : String
      {
         return var_211;
      }
      
      public function get visible() : Boolean
      {
         return var_338;
      }
      
      public function set toolTip(param1:String) : void
      {
         var_1372 = param1;
      }
      
      public function set text(param1:String) : void
      {
         var_211 = param1;
      }
   }
}

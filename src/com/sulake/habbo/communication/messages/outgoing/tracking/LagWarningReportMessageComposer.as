package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LagWarningReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_1706:int;
      
      private var var_1705:int;
      
      public function LagWarningReportMessageComposer(param1:int, param2:int)
      {
         super();
         var_1706 = param1;
         var_1705 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_1706,var_1705];
      }
   }
}

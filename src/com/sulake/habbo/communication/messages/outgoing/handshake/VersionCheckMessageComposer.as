package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1669:String;
      
      private var var_1317:String;
      
      private var var_1670:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1670 = param1;
         var_1317 = param2;
         var_1669 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1670,var_1317,var_1669];
      }
      
      public function dispose() : void
      {
      }
   }
}

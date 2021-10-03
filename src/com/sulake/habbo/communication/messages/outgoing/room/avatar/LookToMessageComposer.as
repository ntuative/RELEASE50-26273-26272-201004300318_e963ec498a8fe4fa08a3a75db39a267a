package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LookToMessageComposer implements IMessageComposer
   {
       
      
      private var var_2136:int;
      
      private var var_2137:int;
      
      public function LookToMessageComposer(param1:int, param2:int)
      {
         super();
         var_2136 = param1;
         var_2137 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_2136,var_2137];
      }
   }
}

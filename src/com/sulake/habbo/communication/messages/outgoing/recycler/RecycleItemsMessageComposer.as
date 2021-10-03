package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_884:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_884 = new Array();
         var_884.push(param1.length);
         var_884 = var_884.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_884;
      }
   }
}

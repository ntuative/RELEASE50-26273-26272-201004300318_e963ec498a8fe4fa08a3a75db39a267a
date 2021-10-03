package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2134:String;
      
      private var var_579:String;
      
      private var var_1502:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1502 = param1.readInteger();
         var_2134 = param1.readString();
         var_579 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_579;
      }
      
      public function get figureString() : String
      {
         return var_2134;
      }
      
      public function get slotId() : int
      {
         return var_1502;
      }
   }
}

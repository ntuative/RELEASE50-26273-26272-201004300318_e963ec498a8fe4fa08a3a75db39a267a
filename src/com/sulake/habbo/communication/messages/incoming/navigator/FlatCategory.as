package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_338:Boolean;
      
      private var var_1288:int;
      
      private var var_1566:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         var_1288 = param1.readInteger();
         var_1566 = param1.readString();
         var_338 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return var_338;
      }
      
      public function get nodeName() : String
      {
         return var_1566;
      }
      
      public function get nodeId() : int
      {
         return var_1288;
      }
   }
}

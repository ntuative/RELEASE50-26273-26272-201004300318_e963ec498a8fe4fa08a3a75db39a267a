package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1288:int;
      
      private var var_1566:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1288 = param1;
         var_1566 = param2;
         Logger.log("READ NODE: " + var_1288 + ", " + var_1566);
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

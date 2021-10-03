package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1708:int;
      
      private var var_1709:int = 0;
      
      private var var_1710:String;
      
      private var var_1707:int;
      
      private var var_1711:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1708 = param1;
         var_1707 = param2;
         var_1711 = param3;
         var_1710 = param4;
      }
      
      public function get length() : int
      {
         return var_1707;
      }
      
      public function get name() : String
      {
         return var_1711;
      }
      
      public function get creator() : String
      {
         return var_1710;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1709;
      }
      
      public function get id() : int
      {
         return var_1708;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1709 = param1;
      }
   }
}

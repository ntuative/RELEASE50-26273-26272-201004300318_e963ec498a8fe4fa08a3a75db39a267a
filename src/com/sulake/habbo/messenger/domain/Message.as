package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_596:int = 2;
      
      public static const const_1003:int = 6;
      
      public static const const_727:int = 1;
      
      public static const const_715:int = 3;
      
      public static const const_974:int = 4;
      
      public static const const_699:int = 5;
       
      
      private var var_1770:String;
      
      private var var_1098:int;
      
      private var var_1769:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1098 = param2;
         var_1769 = param3;
         var_1770 = param4;
      }
      
      public function get time() : String
      {
         return var_1770;
      }
      
      public function get senderId() : int
      {
         return var_1098;
      }
      
      public function get messageText() : String
      {
         return var_1769;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}

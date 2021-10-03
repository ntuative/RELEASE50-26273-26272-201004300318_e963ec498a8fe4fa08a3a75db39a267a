package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1390:int = 2;
      
      public static const const_1579:int = 1;
       
      
      private var var_1963:int;
      
      private var var_1959:int;
      
      private var var_1962:Boolean;
      
      private var var_1956:int;
      
      private var var_1376:String;
      
      private var var_1960:Boolean;
      
      private var var_1957:int;
      
      private var var_1958:int;
      
      private var var_1961:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1959;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1962;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1958;
      }
      
      public function get memberPeriods() : int
      {
         return var_1956;
      }
      
      public function get productName() : String
      {
         return var_1376;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1960;
      }
      
      public function get responseType() : int
      {
         return var_1963;
      }
      
      public function get pastClubDays() : int
      {
         return var_1961;
      }
      
      public function get pastVipDays() : int
      {
         return var_1957;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1376 = param1.readString();
         var_1959 = param1.readInteger();
         var_1956 = param1.readInteger();
         var_1958 = param1.readInteger();
         var_1963 = param1.readInteger();
         var_1960 = param1.readBoolean();
         var_1962 = param1.readBoolean();
         var_1961 = param1.readInteger();
         var_1957 = param1.readInteger();
         return true;
      }
   }
}

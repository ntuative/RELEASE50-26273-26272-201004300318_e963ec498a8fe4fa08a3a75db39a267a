package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1903:int;
      
      private var var_1906:int;
      
      private var var_1907:int;
      
      private var _userName:String;
      
      private var var_1905:int;
      
      private var var_1904:int;
      
      private var var_1908:int;
      
      private var _userId:int;
      
      private var var_659:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1904 = param1.readInteger();
         var_1905 = param1.readInteger();
         var_659 = param1.readBoolean();
         var_1907 = param1.readInteger();
         var_1906 = param1.readInteger();
         var_1903 = param1.readInteger();
         var_1908 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1908;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_659;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1905;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1906;
      }
      
      public function get cautionCount() : int
      {
         return var_1903;
      }
      
      public function get cfhCount() : int
      {
         return var_1907;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1904;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}

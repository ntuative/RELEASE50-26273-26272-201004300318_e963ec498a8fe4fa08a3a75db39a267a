package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var var_1667:int = 0;
      
      private var _type:int = 0;
      
      private var var_2012:String = "";
      
      private var var_2013:String = "";
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _type = param1.readInteger();
         var_1667 = param1.readInteger();
         var_2013 = param1.readString();
         var_2012 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get badgeID() : String
      {
         return var_2013;
      }
      
      public function get removedBadgeID() : String
      {
         return var_2012;
      }
      
      public function get level() : int
      {
         return var_1667;
      }
   }
}

package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1074:Boolean;
      
      private var var_1073:Boolean;
      
      private var var_1075:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1074;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1073;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1075 = param1.readBoolean();
         var_1073 = param1.readBoolean();
         var_1074 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1075;
      }
      
      public function flush() : Boolean
      {
         var_1075 = false;
         var_1073 = false;
         var_1074 = false;
         return true;
      }
   }
}

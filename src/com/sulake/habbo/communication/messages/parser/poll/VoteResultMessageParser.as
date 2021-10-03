package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1315:int;
      
      private var var_963:String;
      
      private var var_676:Array;
      
      private var var_1077:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_676.slice();
      }
      
      public function flush() : Boolean
      {
         var_963 = "";
         var_1077 = [];
         var_676 = [];
         var_1315 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1315;
      }
      
      public function get question() : String
      {
         return var_963;
      }
      
      public function get choices() : Array
      {
         return var_1077.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_963 = param1.readString();
         var_1077 = [];
         var_676 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_1077.push(param1.readString());
            var_676.push(param1.readInteger());
            _loc3_++;
         }
         var_1315 = param1.readInteger();
         return true;
      }
   }
}

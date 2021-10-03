package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_1436:Array;
      
      private var var_1781:Boolean;
      
      private var var_624:Array;
      
      private var var_1782:int;
      
      private var var_623:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var_1436 = [];
         var_623 = [];
         var_624 = [];
         var_1781 = param1.readBoolean();
         var_1782 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_1436.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_623.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_624.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_624;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1436;
      }
      
      public function get wrappingPrice() : int
      {
         return var_1782;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boxTypes() : Array
      {
         return var_623;
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return var_1781;
      }
   }
}

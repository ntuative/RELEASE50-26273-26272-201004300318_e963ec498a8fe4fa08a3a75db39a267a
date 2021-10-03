package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1284:int;
      
      private var var_1283:String;
      
      private var var_2197:String;
      
      private var _index:int;
      
      private var var_2198:Boolean = false;
      
      private var _category:FaqCategory;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         var_1284 = param1;
         var_2197 = param2;
         _index = param3;
         _category = param4;
      }
      
      public function get answerText() : String
      {
         return var_1283;
      }
      
      public function get questionId() : int
      {
         return var_1284;
      }
      
      public function get questionText() : String
      {
         return var_2197;
      }
      
      public function set answerText(param1:String) : void
      {
         var_1283 = param1;
         var_2198 = true;
      }
      
      public function get hasAnswer() : Boolean
      {
         return var_2198;
      }
      
      public function get category() : FaqCategory
      {
         return _category;
      }
      
      public function get index() : int
      {
         return _index;
      }
   }
}

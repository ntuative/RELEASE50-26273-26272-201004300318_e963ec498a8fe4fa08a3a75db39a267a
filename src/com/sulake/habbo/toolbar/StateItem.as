package com.sulake.habbo.toolbar
{
   public class StateItem
   {
       
      
      private var var_1208:Boolean;
      
      private var var_1985:String;
      
      private var _frames:XMLList;
      
      private var var_1003:String = "-1";
      
      private var var_645:String;
      
      private var var_176:int = 120;
      
      private var var_1250:String = "-1";
      
      private var var_1251:String;
      
      private var var_1984:Boolean;
      
      private var var_1525:String = "-1";
      
      private var _id:String;
      
      public function StateItem(param1:XML, param2:String)
      {
         super();
         _id = param1.@id;
         if(param1.attribute("loop").length() > 0)
         {
            var_1208 = Boolean(param1.@loop);
         }
         if(param1.attribute("bounce").length() > 0)
         {
            var_1984 = Boolean(param1.@loop);
         }
         if(param1.attribute("timer").length() > 0)
         {
            var_176 = int(param1.@timer);
         }
         if(param1.attribute("namebase").length() > 0)
         {
            var_1251 = param1.@namebase;
         }
         else
         {
            var_1251 = param2;
         }
         if(param1.attribute("state_over").length() > 0)
         {
            var_1003 = param1.@state_over;
         }
         if(param1.attribute("nextState").length() > 0)
         {
            var_1250 = param1.@nextState;
         }
         else
         {
            var_1250 = _id;
         }
         if(param1.attribute("state_default").length() > 0)
         {
            var_1525 = param1.@state_default;
         }
         if(param1.attribute("tooltip").length() > 0)
         {
            var_1985 = param1.@tooltip;
         }
         if(param1.attribute("background").length() > 0)
         {
            var_645 = param1.@background;
         }
         var _loc3_:XMLList = param1.elements("frame");
         if(_loc3_.length() > 0)
         {
            _frames = _loc3_;
         }
      }
      
      public function get hasStateOver() : Boolean
      {
         return var_1003 != "-1";
      }
      
      public function get bounce() : Boolean
      {
         return var_1984;
      }
      
      public function get defaultState() : String
      {
         return var_1525;
      }
      
      public function get hasDefaultState() : Boolean
      {
         return var_1525 != "-1";
      }
      
      public function get tooltip() : String
      {
         return var_1985;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get timer() : int
      {
         return var_176;
      }
      
      public function get loop() : Boolean
      {
         return var_1208;
      }
      
      public function get nextState() : String
      {
         return var_1250;
      }
      
      public function get frames() : XMLList
      {
         return _frames;
      }
      
      public function get background() : String
      {
         return var_645;
      }
      
      public function get stateOver() : String
      {
         return var_1003;
      }
      
      public function get nameBase() : String
      {
         return var_1251;
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_84:Number = 0;
      
      private var _data:String = "";
      
      private var var_1501:int = 0;
      
      private var var_34:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_1764:Boolean = false;
      
      private var var_2384:String = "";
      
      private var _id:int = 0;
      
      private var var_200:Boolean = false;
      
      private var var_223:String = "";
      
      private var var_1763:int = 0;
      
      private var var_1761:int = 0;
      
      private var var_1762:int = 0;
      
      private var var_1765:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_1764 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_200)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_1764;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_200)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_223;
      }
      
      public function get state() : int
      {
         return var_34;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_200)
         {
            var_1762 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_200)
         {
            var_1763 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_200)
         {
            var_1761 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_200)
         {
            var_223 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_200)
         {
            var_1765 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_200)
         {
            var_34 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1762;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_200)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_1763;
      }
      
      public function get wallY() : Number
      {
         return var_1761;
      }
      
      public function get localY() : Number
      {
         return var_1765;
      }
      
      public function setReadOnly() : void
      {
         var_200 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_200)
         {
            var_84 = param1;
         }
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_1090:int = 0;
      
      private var _data:String = "";
      
      private var var_1501:int = -1;
      
      private var var_34:int = 0;
      
      private var _type:int = 0;
      
      private var var_1089:int = 0;
      
      private var var_2384:String = "";
      
      private var var_2026:int = 0;
      
      private var _id:int = 0;
      
      private var var_200:Boolean = false;
      
      private var var_223:int = 0;
      
      private var var_2229:String = null;
      
      private var var_83:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_84:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_200)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_200)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_223;
      }
      
      public function get extra() : int
      {
         return var_1501;
      }
      
      public function get state() : int
      {
         return var_34;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_200)
         {
            var_223 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_200)
         {
            var_83 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_200)
         {
            var_1501 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_200)
         {
            var_34 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_2026;
      }
      
      public function get staticClass() : String
      {
         return var_2229;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_200)
         {
            var_2026 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_200)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_200)
         {
            var_2229 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_200 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_200)
         {
            var_1090 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_200)
         {
            var_1089 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_200)
         {
            var_84 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_1090;
      }
      
      public function get x() : Number
      {
         return var_83;
      }
      
      public function get sizeY() : int
      {
         return var_1089;
      }
   }
}

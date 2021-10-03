package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_84:Number = 0;
      
      private var var_223:int = 0;
      
      private var var_1679:int = 0;
      
      private var var_1677:Number = 0;
      
      private var var_1674:Number = 0;
      
      private var var_1678:Number = 0;
      
      private var var_1676:Number = 0;
      
      private var var_1675:Boolean = false;
      
      private var var_83:Number = 0;
      
      private var _id:int = 0;
      
      private var var_206:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_206 = [];
         super();
         _id = param1;
         var_83 = param2;
         _y = param3;
         var_84 = param4;
         var_1676 = param5;
         var_223 = param6;
         var_1679 = param7;
         var_1677 = param8;
         var_1674 = param9;
         var_1678 = param10;
         var_1675 = param11;
         var_206 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function get dir() : int
      {
         return var_223;
      }
      
      public function get localZ() : Number
      {
         return var_1676;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1675;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1679;
      }
      
      public function get targetX() : Number
      {
         return var_1677;
      }
      
      public function get targetY() : Number
      {
         return var_1674;
      }
      
      public function get targetZ() : Number
      {
         return var_1678;
      }
      
      public function get x() : Number
      {
         return var_83;
      }
      
      public function get actions() : Array
      {
         return var_206.slice();
      }
   }
}

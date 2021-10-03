package com.sulake.room.object
{
   import flash.utils.Dictionary;
   
   public class RoomObjectModel implements IRoomObjectModelController
   {
       
      
      private var _updateID:int;
      
      private var _stringArrayReadOnlyList:Array;
      
      private var _numberArrayReadOnlyList:Array;
      
      private var var_534:Dictionary;
      
      private var var_533:Dictionary;
      
      private var var_1029:Array;
      
      private var var_494:Dictionary;
      
      private var var_1028:Array;
      
      private var var_493:Dictionary;
      
      public function RoomObjectModel()
      {
         super();
         var_494 = new Dictionary();
         var_493 = new Dictionary();
         var_533 = new Dictionary();
         var_534 = new Dictionary();
         var_1029 = [];
         var_1028 = [];
         _numberArrayReadOnlyList = [];
         _stringArrayReadOnlyList = [];
         _updateID = 0;
      }
      
      public function setNumber(param1:String, param2:Number, param3:Boolean = false) : void
      {
         if(var_1029.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            var_1029.push(param1);
         }
         if(var_494[param1] != param2)
         {
            var_494[param1] = param2;
            ++_updateID;
         }
      }
      
      public function setStringArray(param1:String, param2:Array, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(_stringArrayReadOnlyList.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            _stringArrayReadOnlyList.push(param1);
         }
         var _loc4_:* = [];
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            if(param2[_loc5_] is String)
            {
               _loc4_.push(param2[_loc5_]);
            }
            _loc5_++;
         }
         var _loc6_:Array = var_534[param1];
         var _loc7_:Boolean = true;
         if(_loc6_ != null && _loc6_.length == _loc4_.length)
         {
            _loc5_ = _loc4_.length - 1;
            while(_loc5_ >= 0)
            {
               if(_loc4_[_loc5_] as String != _loc6_[_loc5_] as String)
               {
                  _loc7_ = false;
                  break;
               }
               _loc5_--;
            }
         }
         else
         {
            _loc7_ = false;
         }
         if(_loc7_)
         {
            return;
         }
         var_534[param1] = _loc4_;
         ++_updateID;
      }
      
      public function getNumber(param1:String) : Number
      {
         return var_494[param1];
      }
      
      public function setString(param1:String, param2:String, param3:Boolean = false) : void
      {
         if(var_1028.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            var_1028.push(param1);
         }
         if(var_493[param1] != param2)
         {
            var_493[param1] = param2;
            ++_updateID;
         }
      }
      
      public function setNumberArray(param1:String, param2:Array, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(_numberArrayReadOnlyList.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            _numberArrayReadOnlyList.push(param1);
         }
         var _loc4_:* = [];
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            if(param2[_loc5_] is Number)
            {
               _loc4_.push(param2[_loc5_]);
            }
            _loc5_++;
         }
         var _loc6_:Array = var_533[param1];
         var _loc7_:Boolean = true;
         if(_loc6_ != null && _loc6_.length == _loc4_.length)
         {
            _loc5_ = _loc4_.length - 1;
            while(_loc5_ >= 0)
            {
               if(_loc4_[_loc5_] as Number != _loc6_[_loc5_] as Number)
               {
                  _loc7_ = false;
                  break;
               }
               _loc5_--;
            }
         }
         else
         {
            _loc7_ = false;
         }
         if(_loc7_)
         {
            return;
         }
         var_533[param1] = _loc4_;
         ++_updateID;
      }
      
      public function getString(param1:String) : String
      {
         return var_493[param1];
      }
      
      public function getNumberArray(param1:String) : Array
      {
         var _loc2_:Array = var_533[param1];
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.slice();
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(var_494 != null)
         {
            for(_loc1_ in var_494)
            {
               delete var_494[_loc1_];
            }
            var_494 = null;
         }
         if(var_493 != null)
         {
            for(_loc1_ in var_493)
            {
               delete var_493[_loc1_];
            }
            var_493 = null;
         }
         if(var_533 != null)
         {
            for(_loc1_ in var_533)
            {
               delete var_533[_loc1_];
            }
            var_533 = null;
         }
         if(var_534 != null)
         {
            for(_loc1_ in var_534)
            {
               delete var_534[_loc1_];
            }
            var_534 = null;
         }
         var_1028 = [];
         var_1029 = [];
         _stringArrayReadOnlyList = [];
         _numberArrayReadOnlyList = [];
      }
      
      public function getStringArray(param1:String) : Array
      {
         var _loc2_:Array = var_534[param1];
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.slice();
         }
         return _loc2_;
      }
      
      public function getUpdateID() : int
      {
         return _updateID;
      }
   }
}

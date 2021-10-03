package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1997:String;
      
      private var var_388:int;
      
      private var var_2201:String;
      
      private var var_2202:String;
      
      private var var_2200:int;
      
      private var var_2203:String;
      
      private var var_2199:int;
      
      private var var_646:Array;
      
      private var var_1002:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_646 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1002 = false;
            return;
         }
         this.var_1002 = true;
         var_2200 = int(_loc2_);
         var_2201 = param1.readString();
         var_388 = int(param1.readString());
         var_2199 = param1.readInteger();
         var_1997 = param1.readString();
         var_2202 = param1.readString();
         var_2203 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_646.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_2199;
      }
      
      public function get eventName() : String
      {
         return var_1997;
      }
      
      public function get eventDescription() : String
      {
         return var_2202;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_2201;
      }
      
      public function get tags() : Array
      {
         return var_646;
      }
      
      public function get creationTime() : String
      {
         return var_2203;
      }
      
      public function get exists() : Boolean
      {
         return var_1002;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_2200;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_646 = null;
      }
      
      public function get flatId() : int
      {
         return var_388;
      }
   }
}

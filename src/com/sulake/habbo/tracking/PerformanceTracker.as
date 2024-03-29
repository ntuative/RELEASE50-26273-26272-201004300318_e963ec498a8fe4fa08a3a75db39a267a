package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1543:GarbageMonitor = null;
      
      private var var_1272:int = 0;
      
      private var var_1203:Boolean = false;
      
      private var var_1854:String = "";
      
      private var var_1544:String = "";
      
      private var var_357:Number = 0;
      
      private var var_1269:int = 10;
      
      private var var_2334:Array;
      
      private var var_648:int = 0;
      
      private var var_1270:int = 60;
      
      private var var_1048:int = 0;
      
      private var var_1049:int = 0;
      
      private var var_1858:String = "";
      
      private var var_2017:Number = 0;
      
      private var var_1271:int = 1000;
      
      private var var_2016:Boolean = true;
      
      private var var_2018:Number = 0.15;
      
      private var var_150:IHabboConfigurationManager = null;
      
      private var var_1859:String = "";
      
      private var var_1273:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2334 = [];
         super();
         var_1544 = Capabilities.version;
         var_1854 = Capabilities.os;
         var_1203 = Capabilities.isDebugger;
         var_1859 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1543 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1272 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1543.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1543.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_357;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1270 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1544;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1049;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1271)
         {
            ++var_1048;
            _loc3_ = true;
         }
         else
         {
            ++var_648;
            if(var_648 <= 1)
            {
               var_357 = param1;
            }
            else
            {
               _loc4_ = Number(var_648);
               var_357 = var_357 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1272 > var_1270 * 1000 && var_1273 < var_1269)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_357);
            _loc5_ = true;
            if(var_2016 && var_1273 > 0)
            {
               _loc6_ = differenceInPercents(var_2017,var_357);
               if(_loc6_ < var_2018)
               {
                  _loc5_ = false;
               }
            }
            var_1272 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_2017 = var_357;
               if(sendReport())
               {
                  ++var_1273;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1269 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1271 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1859,var_1544,var_1854,var_1858,var_1203,_loc4_,_loc3_,var_1049,var_357,var_1048);
            _connection.send(_loc1_);
            var_1049 = 0;
            var_357 = 0;
            var_648 = 0;
            var_1048 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_150 = param1;
         var_1270 = int(var_150.getKey("performancetest.interval","60"));
         var_1271 = int(var_150.getKey("performancetest.slowupdatelimit","1000"));
         var_1269 = int(var_150.getKey("performancetest.reportlimit","10"));
         var_2018 = Number(var_150.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_2016 = Boolean(int(var_150.getKey("performancetest.distribution.enabled","1")));
      }
   }
}

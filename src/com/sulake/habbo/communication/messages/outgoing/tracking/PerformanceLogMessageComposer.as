package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1048:int = 0;
      
      private var var_1203:int = 0;
      
      private var var_1854:String = "";
      
      private var var_1049:int = 0;
      
      private var var_1858:String = "";
      
      private var var_1855:int = 0;
      
      private var var_1544:String = "";
      
      private var var_1860:int = 0;
      
      private var var_1856:int = 0;
      
      private var var_1859:String = "";
      
      private var var_1857:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1860 = param1;
         var_1859 = param2;
         var_1544 = param3;
         var_1854 = param4;
         var_1858 = param5;
         if(param6)
         {
            var_1203 = 1;
         }
         else
         {
            var_1203 = 0;
         }
         var_1855 = param7;
         var_1856 = param8;
         var_1049 = param9;
         var_1857 = param10;
         var_1048 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1860,var_1859,var_1544,var_1854,var_1858,var_1203,var_1855,var_1856,var_1049,var_1857,var_1048];
      }
      
      public function dispose() : void
      {
      }
   }
}

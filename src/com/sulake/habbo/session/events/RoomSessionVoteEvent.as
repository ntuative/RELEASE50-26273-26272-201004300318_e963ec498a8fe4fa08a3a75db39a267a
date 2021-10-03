package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_128:String = "RSPE_VOTE_RESULT";
      
      public static const const_117:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1315:int = 0;
      
      private var var_963:String = "";
      
      private var var_676:Array;
      
      private var var_1077:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_1077 = [];
         var_676 = [];
         super(param1,param2,param7,param8);
         var_963 = param3;
         var_1077 = param4;
         var_676 = param5;
         if(var_676 == null)
         {
            var_676 = [];
         }
         var_1315 = param6;
      }
      
      public function get votes() : Array
      {
         return var_676.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1315;
      }
      
      public function get question() : String
      {
         return var_963;
      }
      
      public function get choices() : Array
      {
         return var_1077.slice();
      }
   }
}

package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   import flash.events.Event;
   
   public class RoomSessionEvent extends Event
   {
      
      public static const const_107:String = "RSE_ENDED";
      
      public static const const_95:String = "RSE_STARTED";
      
      public static const const_296:String = "RSE_CREATED";
       
      
      private var var_38:IRoomSession;
      
      public function RoomSessionEvent(param1:String, param2:IRoomSession, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         var_38 = param2;
      }
      
      public function get session() : IRoomSession
      {
         return var_38;
      }
   }
}

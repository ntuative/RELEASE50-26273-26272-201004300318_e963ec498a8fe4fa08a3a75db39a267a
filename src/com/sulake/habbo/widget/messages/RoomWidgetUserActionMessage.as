package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_687:String = "RWUAM_RESPECT_USER";
      
      public static const const_571:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_729:String = "RWUAM_START_TRADING";
      
      public static const const_598:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_674:String = "RWUAM_WHISPER_USER";
      
      public static const const_703:String = "RWUAM_IGNORE_USER";
      
      public static const const_474:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_726:String = "RWUAM_BAN_USER";
      
      public static const const_710:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_410:String = "RWUAM_KICK_USER";
      
      public static const const_581:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_685:String = " RWUAM_RESPECT_PET";
      
      public static const const_473:String = "RWUAM_KICK_BOT";
      
      public static const const_1335:String = "RWUAM_TRAIN_PET";
      
      public static const const_525:String = "RWUAM_PICKUP_PET";
      
      public static const const_520:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_658:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}

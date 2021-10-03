package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2335:Boolean;
      
      private var var_2336:int;
      
      private var var_2338:Boolean;
      
      private var var_1416:String;
      
      private var var_1169:String;
      
      private var var_2122:int;
      
      private var var_1673:String;
      
      private var var_2337:String;
      
      private var var_1672:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2122 = param1.readInteger();
         this.var_1416 = param1.readString();
         this.var_1673 = param1.readString();
         this.var_2335 = param1.readBoolean();
         this.var_2338 = param1.readBoolean();
         param1.readString();
         this.var_2336 = param1.readInteger();
         this.var_1672 = param1.readString();
         this.var_2337 = param1.readString();
         this.var_1169 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1169;
      }
      
      public function get avatarName() : String
      {
         return this.var_1416;
      }
      
      public function get avatarId() : int
      {
         return this.var_2122;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2335;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2337;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1672;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2338;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1673;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2336;
      }
   }
}

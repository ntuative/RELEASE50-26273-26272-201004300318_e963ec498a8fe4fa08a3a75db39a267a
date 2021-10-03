package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_316:String;
      
      private var var_1167:String;
      
      private var var_1166:String;
      
      private var var_1165:int;
      
      private var var_579:int;
      
      private var var_1169:String;
      
      private var _name:String;
      
      private var var_1168:Boolean;
      
      private var var_659:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_579 = param1.readInteger();
         this.var_659 = param1.readBoolean();
         this.var_1168 = param1.readBoolean();
         this.var_316 = param1.readString();
         this.var_1165 = param1.readInteger();
         this.var_1166 = param1.readString();
         this.var_1167 = param1.readString();
         this.var_1169 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_579;
      }
      
      public function get realName() : String
      {
         return var_1169;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1166;
      }
      
      public function get categoryId() : int
      {
         return var_1165;
      }
      
      public function get online() : Boolean
      {
         return var_659;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1168;
      }
      
      public function get lastAccess() : String
      {
         return var_1167;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_316;
      }
   }
}

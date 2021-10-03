package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_316:String;
      
      private var var_2324:String;
      
      private var var_2328:int;
      
      private var var_2326:int;
      
      private var var_555:String;
      
      private var var_1169:String;
      
      private var _name:String;
      
      private var var_481:int;
      
      private var var_820:int;
      
      private var var_2327:int;
      
      private var var_2019:int;
      
      private var var_2325:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2326;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1169;
      }
      
      public function get customData() : String
      {
         return this.var_2324;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_481;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2328;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2325;
      }
      
      public function get figure() : String
      {
         return this.var_316;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2019;
      }
      
      public function get sex() : String
      {
         return this.var_555;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_316 = param1.readString();
         this.var_555 = param1.readString();
         this.var_2324 = param1.readString();
         this.var_1169 = param1.readString();
         this.var_2327 = param1.readInteger();
         this.var_2325 = param1.readString();
         this.var_2328 = param1.readInteger();
         this.var_2326 = param1.readInteger();
         this.var_2019 = param1.readInteger();
         this.var_820 = param1.readInteger();
         this.var_481 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2327;
      }
      
      public function get respectLeft() : int
      {
         return this.var_820;
      }
   }
}

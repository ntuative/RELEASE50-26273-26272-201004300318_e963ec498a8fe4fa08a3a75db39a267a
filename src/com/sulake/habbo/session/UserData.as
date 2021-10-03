package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_316:String = "";
      
      private var var_1777:String = "";
      
      private var var_1776:int = 0;
      
      private var var_1779:int = 0;
      
      private var _type:int = 0;
      
      private var var_1778:String = "";
      
      private var var_555:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_1780:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_1776 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_1778 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_316 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_555 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_1776;
      }
      
      public function set webID(param1:int) : void
      {
         var_1780 = param1;
      }
      
      public function get groupID() : String
      {
         return var_1778;
      }
      
      public function set custom(param1:String) : void
      {
         var_1777 = param1;
      }
      
      public function get figure() : String
      {
         return var_316;
      }
      
      public function get sex() : String
      {
         return var_555;
      }
      
      public function get custom() : String
      {
         return var_1777;
      }
      
      public function get webID() : int
      {
         return var_1780;
      }
      
      public function set xp(param1:int) : void
      {
         var_1779 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_1779;
      }
   }
}

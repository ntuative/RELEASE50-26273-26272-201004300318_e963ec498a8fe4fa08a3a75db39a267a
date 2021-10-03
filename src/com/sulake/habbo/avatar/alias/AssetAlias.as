package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_1064:Boolean;
      
      private var _name:String;
      
      private var var_1759:String;
      
      private var var_1063:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1759 = String(param1.@link);
         var_1063 = Boolean(parseInt(param1.@fliph));
         var_1064 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_1063;
      }
      
      public function get flipV() : Boolean
      {
         return var_1064;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1759;
      }
   }
}

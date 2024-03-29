package com.sulake.habbo.avatar.structure.figure
{
   import com.sulake.core.utils.Map;
   
   public class SetType implements ISetType
   {
       
      
      private var _type:String;
      
      private var _partSets:Map;
      
      private var var_2224:Boolean;
      
      private var var_2223:int;
      
      public function SetType(param1:XML)
      {
         super();
         _type = String(param1.@type);
         var_2223 = parseInt(param1.@paletteid);
         var_2224 = Boolean(parseInt(param1.@mandatory));
         _partSets = new Map();
         append(param1);
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function getDefaultPartSet(param1:String) : IFigurePartSet
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:Array = _partSets.getKeys();
         var _loc3_:int = _loc2_.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = _loc2_[_loc3_];
            _loc5_ = _partSets.getValue(_loc4_);
            if(_loc5_ && _loc5_.clubLevel == 0 && _loc5_.gender == param1)
            {
               return _loc5_;
            }
            _loc3_--;
         }
         return null;
      }
      
      public function get partSets() : Map
      {
         return _partSets;
      }
      
      public function get isMandatory() : Boolean
      {
         return var_2224;
      }
      
      public function get paletteID() : int
      {
         return var_2223;
      }
      
      public function getPartSet(param1:int) : IFigurePartSet
      {
         return _partSets.getValue(String(param1));
      }
      
      public function append(param1:XML) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1["set"])
         {
            _partSets.add(String(_loc2_.@id),new FigurePartSet(_loc2_));
         }
      }
   }
}

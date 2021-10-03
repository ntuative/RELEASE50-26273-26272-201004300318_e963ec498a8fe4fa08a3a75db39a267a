package com.sulake.habbo.avatar.structure
{
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPalette;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.structure.figure.Palette;
   import com.sulake.habbo.avatar.structure.figure.SetType;
   import flash.utils.Dictionary;
   
   public class FigureData implements IStructureData, IFigureData
   {
       
      
      private var var_767:Dictionary;
      
      private var var_217:Dictionary;
      
      public function FigureData()
      {
         super();
         var_217 = new Dictionary();
         var_767 = new Dictionary();
      }
      
      public function parse(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.colors.palette)
         {
            var_217[String(_loc2_.@id)] = new Palette(_loc2_);
         }
         for each(_loc3_ in param1.sets.settype)
         {
            var_767[String(_loc3_.@type)] = new SetType(_loc3_);
         }
         return true;
      }
      
      public function getDefaultPartSet(param1:String, param2:String) : IFigurePartSet
      {
         var _loc3_:SetType = var_767[param1] as SetType;
         if(_loc3_)
         {
            return _loc3_.getDefaultPartSet(param2);
         }
         return null;
      }
      
      public function getPalette(param1:int) : IPalette
      {
         return var_217[String(param1)];
      }
      
      public function dispose() : void
      {
      }
      
      public function getSetType(param1:String) : ISetType
      {
         return var_767[param1];
      }
      
      public function appendXML(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.colors.palette)
         {
            _loc4_ = var_217[String(_loc2_.@id)];
            if(_loc4_ == null)
            {
               var_217[String(_loc2_.@id)] = new Palette(_loc2_);
            }
            else
            {
               _loc4_.append(_loc2_);
            }
         }
         for each(_loc3_ in param1.sets.settype)
         {
            _loc5_ = var_767[String(_loc3_.@type)];
            if(_loc5_ == null)
            {
               var_767[String(_loc3_.@type)] = new SetType(_loc3_);
            }
            else
            {
               _loc5_.append(_loc3_);
            }
         }
         return false;
      }
      
      public function getMandatorySetTypeIds() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         for each(_loc2_ in var_767)
         {
            if(_loc2_ && _loc2_.isMandatory)
            {
               _loc1_.push(_loc2_.type);
            }
         }
         return _loc1_;
      }
   }
}

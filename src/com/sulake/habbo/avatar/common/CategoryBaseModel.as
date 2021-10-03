package com.sulake.habbo.avatar.common
{
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   
   public class CategoryBaseModel implements IAvatarEditorCategoryModel
   {
       
      
      protected var var_29:HabboAvatarEditor;
      
      protected var _view:IAvatarEditorCategoryView;
      
      protected var var_166:Boolean = false;
      
      protected var var_88:Map;
      
      public function CategoryBaseModel(param1:HabboAvatarEditor)
      {
         super();
         var_29 = param1;
      }
      
      public function hasClubItemsOverLevel(param1:int) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         if(!var_88)
         {
            return false;
         }
         var _loc2_:Boolean = false;
         for each(_loc3_ in var_88)
         {
            if(_loc3_)
            {
               _loc4_ = _loc3_.hasClubSelectionsOverLevel(param1);
               if(_loc4_)
               {
                  _loc2_ = true;
               }
            }
         }
         return _loc2_;
      }
      
      public function stripClubItemsOverLevel(param1:int) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         if(!var_88)
         {
            return false;
         }
         var _loc2_:Array = var_88.getKeys();
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc5_ = _loc2_[_loc4_];
            _loc6_ = var_88[_loc5_];
            _loc7_ = false;
            if(_loc6_.stripClubItemsOverLevel(param1))
            {
               _loc7_ = true;
            }
            if(_loc6_.stripClubColorsOverLevel(param1))
            {
               _loc7_ = true;
            }
            if(_loc7_)
            {
               _loc8_ = _loc6_.getCurrentPart();
               if(_loc8_ && var_29 && false && _loc6_)
               {
                  var_29.figureData.savePartData(_loc5_,_loc8_.id,_loc6_.getSelectedColorIds(),true);
               }
               _loc3_ = true;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(!var_166)
         {
            init();
         }
         if(!_view)
         {
            return null;
         }
         return _view.getWindowContainer();
      }
      
      public function getCategoryData(param1:String) : CategoryData
      {
         if(!var_166)
         {
            init();
         }
         if(!var_88)
         {
            return null;
         }
         return var_88[param1];
      }
      
      public function selectColor(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:CategoryData = var_88[param1];
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.selectColorIndex(param2,param3);
         if(var_29 && false)
         {
            var_29.figureData.savePartSetColourId(param1,_loc4_.getSelectedColorIds(),true);
         }
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         var_166 = false;
         for each(_loc1_ in var_88)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         var_88 = new Map();
         if(_view)
         {
            _view.reset();
         }
      }
      
      protected function init() : void
      {
         if(!var_88)
         {
            var_88 = new Map();
         }
      }
      
      public function switchCategory(param1:String) : void
      {
         if(!var_166)
         {
            init();
         }
         if(_view)
         {
            _view.switchCategory(param1);
         }
      }
      
      public function selectPart(param1:String, param2:int) : void
      {
         var _loc3_:CategoryData = var_88[param1];
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.selectPartIndex(param2);
         var _loc4_:AvatarEditorGridPartItem = _loc3_.getCurrentPart();
         if(!_loc4_)
         {
            return;
         }
         if(_view)
         {
            _view.showPalettes(param1,_loc4_.colorLayerCount);
         }
         if(var_29 && false)
         {
            var_29.figureData.savePartData(param1,_loc4_.id,_loc3_.getSelectedColorIds(),true);
         }
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return var_29;
      }
      
      protected function updateSelectionsFromFigure(param1:String) : void
      {
         if(!var_88 || !var_29 || true)
         {
            return;
         }
         var _loc2_:CategoryData = var_88[param1];
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = var_29.figureData.getPartSetId(param1);
         var _loc4_:Array = var_29.figureData.getColourIds(param1);
         if(!_loc4_)
         {
            _loc4_ = new Array();
         }
         _loc2_.selectPartId(_loc3_);
         _loc2_.selectColorIds(_loc4_);
         if(_view)
         {
            _view.showPalettes(param1,_loc4_.length);
         }
      }
      
      public function dispose() : void
      {
         if(_view != null)
         {
            _view.dispose();
         }
         _view = null;
         var_88 = null;
         var_29 = null;
      }
      
      protected function initCategory(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:CategoryData = var_88[param1];
         if(_loc2_ == null)
         {
            _loc3_ = var_29.generateDataContent(this,param1);
            if(_loc3_)
            {
               var_88[param1] = _loc3_;
               updateSelectionsFromFigure(param1);
            }
         }
      }
   }
}

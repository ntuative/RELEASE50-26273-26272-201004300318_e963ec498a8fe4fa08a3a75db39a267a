package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.window.enum.HabboIconType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AvatarEditorGridColorItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var _model:IAvatarEditorCategoryModel;
      
      private var _window:IWindowContainer;
      
      private var var_741:IPartColor;
      
      private var var_905:BitmapData;
      
      private var var_742:BitmapData;
      
      private var var_740:BitmapData;
      
      public function AvatarEditorGridColorItem(param1:IWindowContainer, param2:IAvatarEditorCategoryModel, param3:IPartColor)
      {
         super();
         _model = param2;
         _window = param1;
         _window.background = true;
         var_741 = param3;
         var _loc4_:BitmapDataAsset = param2.controller.assets.getAssetByName("editor_clr_40x32_1") as BitmapDataAsset;
         var_740 = _loc4_.content as BitmapData;
         var _loc5_:BitmapDataAsset = param2.controller.assets.getAssetByName("editor_clr_40x32_2") as BitmapDataAsset;
         var_905 = _loc5_.content as BitmapData;
         var _loc6_:BitmapDataAsset = param2.controller.assets.getAssetByName("editor_clr_40x32_3") as BitmapDataAsset;
         var_742 = _loc6_.content as BitmapData;
         updateThumbData();
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get view() : IWindowContainer
      {
         return _window;
      }
      
      public function get partColor() : IPartColor
      {
         return var_741;
      }
      
      private function updateThumbData() : void
      {
         var _loc5_:* = null;
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = _window.findChildByTag("BG_BORDER") as IBitmapWrapperWindow;
         if(_loc1_ != null)
         {
            _loc1_.bitmap = new BitmapData(var_740.width,var_740.height,true,0);
            _loc1_.bitmap.copyPixels(var_740,var_740.rect,new Point(0,0));
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByTag("COLOR_IMAGE") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = new BitmapData(var_905.width,var_905.height,true,0);
            _loc5_ = var_905.clone();
            _loc5_.colorTransform(_loc5_.rect,var_741.colorTransform);
            _loc2_.bitmap.copyPixels(_loc5_,_loc5_.rect,new Point(0,0));
         }
         var _loc3_:IBitmapWrapperWindow = _window.findChildByTag("COLOR_CHOSEN") as IBitmapWrapperWindow;
         if(_loc3_ != null)
         {
            if(_isSelected)
            {
               _loc3_.bitmap = new BitmapData(var_742.width,var_742.height,true,16777215);
               _loc3_.bitmap.copyPixels(var_742,var_742.rect,new Point(0,0),null,null,true);
               _loc3_.visible = true;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         var _loc4_:IIconWindow = _window.findChildByTag("CLUB_ICON") as IIconWindow;
         if(_loc4_)
         {
            if(var_741)
            {
               switch(var_741.clubLevel)
               {
                  case HabboClubLevelEnum.const_55:
                     _loc4_.visible = false;
                     break;
                  case HabboClubLevelEnum.const_62:
                     _loc4_.style = HabboIconType.const_667;
                     _loc4_.visible = true;
                     break;
                  case HabboClubLevelEnum.const_52:
                     _loc4_.style = HabboIconType.const_565;
                     _loc4_.visible = true;
               }
            }
            else
            {
               _loc4_.visible = false;
            }
         }
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
         updateThumbData();
      }
      
      public function dispose() : void
      {
         _model = null;
         if(_window != null)
         {
            if(true)
            {
               _window.dispose();
            }
         }
         _window = null;
         var_741 = null;
         var_740 = null;
         var_905 = null;
         var_742 = null;
      }
   }
}

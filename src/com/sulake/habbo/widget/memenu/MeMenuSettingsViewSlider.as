package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MeMenuSettingsViewSlider
   {
       
      
      private var var_803:MeMenuSettingsView;
      
      private var var_2386:int;
      
      private var var_559:BitmapData;
      
      private var var_969:Number = 1;
      
      private var var_1430:int;
      
      private var var_671:Number = 0;
      
      private var _sliderContainer:IWindowContainer;
      
      private var var_560:BitmapData;
      
      public function MeMenuSettingsViewSlider(param1:MeMenuSettingsView, param2:IWindowContainer, param3:IAssetLibrary, param4:Number = 0, param5:Number = 1)
      {
         super();
         var_803 = param1;
         _sliderContainer = param2;
         var_671 = param4;
         var_969 = param5;
         storeAssets(param3);
         displaySlider();
      }
      
      private function buttonProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_442)
         {
            return;
         }
         var_803.saveVolume(getValue(param2.x),false);
      }
      
      private function displaySlider() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_sliderContainer == null)
         {
            return;
         }
         _loc2_ = _sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow;
         if(_loc2_ != null && var_560 != null)
         {
            _loc2_.bitmap = new BitmapData(var_560.width,var_560.height,true,16777215);
            _loc2_.bitmap.copyPixels(var_560,var_560.rect,new Point(0,0),null,null,true);
         }
         _loc1_ = _sliderContainer.findChildByName("slider_movement_area") as IWindowContainer;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.findChildByName("slider_button") as IBitmapWrapperWindow;
            if(_loc2_ != null && var_559 != null)
            {
               _loc2_.bitmap = new BitmapData(var_559.width,var_559.height,true,16777215);
               _loc2_.bitmap.copyPixels(var_559,var_559.rect,new Point(0,0),null,null,true);
               _loc2_.procedure = buttonProcedure;
               var_1430 = _loc1_.width - _loc2_.width;
            }
         }
      }
      
      private function storeAssets(param1:IAssetLibrary) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_base"));
         var_560 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_button"));
         var_559 = BitmapData(_loc2_.content);
      }
      
      public function set max(param1:Number) : void
      {
         var_969 = param1;
         setValue(var_803.volume);
      }
      
      public function dispose() : void
      {
         var_803 = null;
         _sliderContainer = null;
         var_560 = null;
         var_559 = null;
      }
      
      private function getSliderPosition(param1:Number) : int
      {
         return int(var_1430 * (Number(param1 - var_671) / (var_969 - var_671)));
      }
      
      public function set min(param1:Number) : void
      {
         var_671 = param1;
         setValue(var_803.volume);
      }
      
      public function setValue(param1:Number) : void
      {
         if(_sliderContainer == null)
         {
            return;
         }
         var _loc2_:IWindow = _sliderContainer.findChildByName("slider_button");
         if(_loc2_ != null)
         {
            _loc2_.x = getSliderPosition(param1);
         }
      }
      
      private function getValue(param1:Number) : Number
      {
         return param1 / var_1430 * (var_969 - var_671) + var_671;
      }
   }
}

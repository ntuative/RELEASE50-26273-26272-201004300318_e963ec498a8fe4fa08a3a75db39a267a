package com.sulake.habbo.inventory.pets
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class PetsGridItem
   {
       
      
      private const const_1636:int = 8947848;
      
      private const const_1635:int = 13421772;
      
      private var _isSelected:Boolean;
      
      private var var_1249:PetData;
      
      private var _window:IWindowContainer;
      
      private var var_967:PetsView;
      
      private var var_795:Boolean;
      
      public function PetsGridItem(param1:PetsView, param2:PetData, param3:IHabboWindowManager, param4:IAssetLibrary, param5:IAvatarRenderManager)
      {
         super();
         if(param1 == null || param2 == null || param3 == null || param4 == null || param5 == null)
         {
            return;
         }
         var_967 = param1;
         var_1249 = param2;
         var _loc6_:XmlAsset = param4.getAssetByName("inventory_thumb_xml") as XmlAsset;
         if(_loc6_ == null || _loc6_.content == null)
         {
            return;
         }
         _window = param3.buildFromXML(_loc6_.content as XML) as IWindowContainer;
         _window.procedure = eventHandler;
         var _loc7_:IAvatarImage = param5.createPetImageFromFigure(param2.figure,AvatarScaleType.const_56);
         if(_loc7_ == null)
         {
            return;
         }
         _loc7_.setDirection(AvatarSetType.const_40,3);
         var _loc8_:BitmapData = _loc7_.getCroppedImage(AvatarSetType.const_49);
         var _loc9_:IBitmapWrapperWindow = _window.findChildByName("bitmap") as IBitmapWrapperWindow;
         _loc7_.dispose();
         var _loc10_:BitmapData = new BitmapData(_loc9_.width,_loc9_.height);
         _loc10_.fillRect(_loc10_.rect,0);
         _loc10_.copyPixels(_loc8_,_loc8_.rect,new Point(_loc10_.width / 2 - _loc8_.width / 2,_loc10_.height / 2 - _loc8_.height / 2));
         _loc9_.bitmap = _loc10_;
         setSelected(false);
      }
      
      public function get pet() : PetData
      {
         return var_1249;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.const_53:
               var_967.setSelectedGridItem(this);
               var_795 = true;
               break;
            case WindowMouseEvent.const_99:
               var_795 = false;
               break;
            case WindowMouseEvent.const_33:
               if(var_795)
               {
                  var_795 = false;
                  var_967.placePetToRoom(var_1249.id,true);
               }
         }
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(_isSelected == param1)
         {
            return;
         }
         _isSelected = param1;
         if(_window == null)
         {
            return;
         }
         _window.color = !!_isSelected ? uint(const_1636) : uint(const_1635);
      }
      
      public function dispose() : void
      {
         var_967 = null;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
   }
}

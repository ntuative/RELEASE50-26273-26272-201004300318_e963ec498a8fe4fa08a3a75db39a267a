package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.enum.RenderMode;
   import com.sulake.habbo.avatar.palette.PaletteManager;
   import com.sulake.habbo.avatar.pets.IPetDataManager;
   import com.sulake.habbo.avatar.pets.PetDataManager;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.parts.PartOffsetData;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   
   public class AvatarRenderManager extends Component implements IAvatarRenderManager
   {
       
      
      private var var_771:String;
      
      private var var_27:CoreComponent;
      
      private var _aliasCollection:AssetAliasCollection;
      
      private var var_1099:PaletteManager;
      
      private var var_752:PetDataManager;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_239:Map;
      
      public function AvatarRenderManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_239 = new Map();
         param2 |= const_864;
         super(param1,param2,param3);
         var_771 = RenderMode.const_1334;
         if(param1 is CoreComponent)
         {
            var_27 = CoreComponent(param1);
            var_27.events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         }
         queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationReady);
      }
      
      public function injectFigureData(param1:String, param2:XML) : void
      {
         var _loc3_:* = null;
         switch(param1)
         {
            case AvatarType.const_86:
               _loc3_ = var_239.getValue(AvatarType.const_86) as AvatarStructure;
               break;
            case AvatarType.PET:
               _loc3_ = var_239.getValue(AvatarType.PET) as AvatarStructure;
               break;
            default:
               Logger.log("Uknown avatar type: " + param1);
         }
         if(_loc3_ != null)
         {
            _loc3_.injectFigureData(param2);
         }
      }
      
      private function onConfigurationInit(param1:Event = null) : void
      {
         var _loc2_:* = null;
         _loc2_ = var_239.getValue(AvatarType.const_86) as AvatarStructure;
         if(_loc2_ != null)
         {
            _loc2_.initConfiguration(_habboConfiguration);
         }
         _loc2_ = var_239.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc2_ != null)
         {
            _loc2_.initConfiguration(_habboConfiguration);
         }
      }
      
      private function onStructureInit(param1:Event = null) : void
      {
         this.events.dispatchEvent(new Event(AvatarRenderEvent.AVATAR_RENDER_READY));
      }
      
      private function init() : void
      {
         var _loc5_:* = null;
         var _loc1_:AssetLibraryCollection = var_27.assets as AssetLibraryCollection;
         var _loc2_:int = 0;
         var _loc3_:Array = new Array();
         while(_loc1_.hasAssetLibrary("lib-" + _loc2_))
         {
            _loc3_.push("lib-" + _loc2_);
            _loc2_++;
         }
         if(_loc1_.hasAssetLibrary("PetData"))
         {
            _loc3_.push("PetData");
            _loc2_++;
         }
         if(_loc1_.hasAssetLibrary("PaletteData"))
         {
            _loc3_.push("PaletteData");
            _loc2_++;
         }
         _aliasCollection = new AssetAliasCollection(_loc1_,_loc3_);
         var_752 = new PetDataManager(_loc1_,_loc3_);
         var_1099 = new PaletteManager(_loc1_,_loc3_);
         var _loc4_:XML = _assets.getAssetByName("HabboAvatarPetFigure").content as XML;
         var_752.populateFigureData(_loc4_);
         _loc5_ = new AvatarStructure(this,assets,_loc1_,AvatarType.const_86);
         _loc5_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,onStructureInit);
         var_239.add(AvatarType.const_86,_loc5_);
         _loc5_ = new AvatarStructure(this,assets,_loc1_,AvatarType.PET);
         _loc5_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,onStructureInit);
         var_239.add(AvatarType.PET,_loc5_);
      }
      
      public function get petDataManager() : IPetDataManager
      {
         return var_752 as IPetDataManager;
      }
      
      public function set mode(param1:String) : void
      {
         var_771 = param1;
         if(var_771 == RenderMode.const_1357)
         {
            init();
         }
         if(var_771 == RenderMode.const_1385)
         {
            init();
            onConfigurationInit(null);
         }
      }
      
      public function createPetImage(param1:int, param2:int, param3:uint, param4:String) : IAvatarImage
      {
         var _loc5_:String = var_752.createAvatarFigureString(param1,param2,param3);
         var _loc6_:AvatarStructure = var_239.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc6_ == null)
         {
            return null;
         }
         return new AvatarImage(_loc6_,_aliasCollection,_loc5_,param4,AvatarType.PET);
      }
      
      public function getAssetByName(param1:String) : IAsset
      {
         return _aliasCollection.getAssetByName(param1);
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            _habboConfiguration = param2 as IHabboConfigurationManager;
            (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationInit);
         }
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
         init();
      }
      
      public function getFigureData(param1:String) : IFigureData
      {
         var _loc2_:AvatarStructure = var_239.getValue(param1) as AvatarStructure;
         if(_loc2_ != null)
         {
            return _loc2_.figureData;
         }
         return null;
      }
      
      public function createAvatarImage(param1:String, param2:String, param3:String = null) : IAvatarImage
      {
         var _loc4_:AvatarStructure = var_239.getValue(AvatarType.const_86) as AvatarStructure;
         if(_loc4_ == null)
         {
            return null;
         }
         return new AvatarImage(_loc4_,_aliasCollection,param1,param2,AvatarType.const_86,param3);
      }
      
      override public function dispose() : void
      {
         if(_habboConfiguration)
         {
            _habboConfiguration.release(new IIDHabboConfigurationManager());
            _habboConfiguration = null;
         }
         super.dispose();
         if(var_239 != null)
         {
            var_239.dispose();
            var_239 = null;
         }
         if(var_752 != null)
         {
            var_752 = null;
         }
         if(var_1099 != null)
         {
            var_1099 = null;
         }
         PartOffsetData.dispose();
      }
      
      public function get paletteManager() : PaletteManager
      {
         return var_1099;
      }
      
      public function createPetImageFromFigure(param1:String, param2:String) : IAvatarImage
      {
         if(param1.indexOf(" ") == -1)
         {
            return null;
         }
         var _loc3_:Array = param1.split(" ");
         if(_loc3_.length == 0)
         {
            return null;
         }
         var _loc4_:int = int(_loc3_[0]);
         var _loc5_:int = int(_loc3_[1]);
         var _loc6_:uint = parseInt(_loc3_[2],16);
         return createPetImage(_loc4_,_loc5_,_loc6_,param2);
      }
      
      public function get mode() : String
      {
         return var_771;
      }
   }
}

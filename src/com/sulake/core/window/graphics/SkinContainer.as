package com.sulake.core.window.graphics
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.renderer.BitmapDataRenderer;
   import com.sulake.core.window.graphics.renderer.BitmapSkinRenderer;
   import com.sulake.core.window.graphics.renderer.FillSkinRenderer;
   import com.sulake.core.window.graphics.renderer.ISkinRenderer;
   import com.sulake.core.window.graphics.renderer.NullSkinRenderer;
   import com.sulake.core.window.graphics.renderer.ShapeSkinRenderer;
   import com.sulake.core.window.graphics.renderer.SkinRenderer;
   import com.sulake.core.window.graphics.renderer.TextSkinRenderer;
   import com.sulake.core.window.utils.DefaultAttStruct;
   import com.sulake.core.window.utils.StateCodeTable;
   import com.sulake.core.window.utils.TypeCodeTable;
   import flash.utils.Dictionary;
   
   public class SkinContainer implements ISkinContainer
   {
      
      protected static var var_385:Array;
      
      private static const const_758:uint = 8;
       
      
      private var var_1803:Dictionary;
      
      private var var_1459:Dictionary;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_680:Dictionary;
      
      private var var_1804:Dictionary;
      
      private var var_475:Dictionary;
      
      private var var_1177:Dictionary;
      
      private var var_679:Dictionary;
      
      public function SkinContainer(param1:XML, param2:IAssetLibrary)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         super();
         _assetLibrary = param2;
         var_680 = new Dictionary();
         var_679 = new Dictionary();
         var_1459 = new Dictionary();
         var_1804 = new Dictionary();
         TypeCodeTable.fillTables(var_1459,var_1804);
         var_1177 = new Dictionary();
         var_1803 = new Dictionary();
         StateCodeTable.fillTables(var_1177,var_1803);
         var_475 = new Dictionary();
         var_475["skin"] = BitmapSkinRenderer;
         var_475["bitmap"] = BitmapDataRenderer;
         var_475["fill"] = FillSkinRenderer;
         var_475["text"] = TextSkinRenderer;
         var_475["shape"] = ShapeSkinRenderer;
         var_475["unknown"] = SkinRenderer;
         var_475["null"] = NullSkinRenderer;
         if(var_385 == null)
         {
            var_385 = new Array();
            var_385.push(WindowState.const_67);
            var_385.push(WindowState.const_75);
            var_385.push(WindowState.const_101);
            var_385.push(WindowState.WINDOW_STATE_SELECTED);
            var_385.push(WindowState.const_84);
            var_385.push(WindowState.const_78);
            var_385.push(WindowState.const_96);
            var_385.push(WindowState.const_90);
         }
         var _loc3_:Array = new Array();
         for(_loc4_ in var_1177)
         {
            _loc3_.push(var_1177[_loc4_]);
         }
         if(param1 != null)
         {
            _loc5_ = param1.child("component");
            _loc6_ = uint(_loc5_.length());
            if(_loc6_ > 0)
            {
               _loc21_ = 0;
               while(_loc21_ < _loc6_)
               {
                  _loc7_ = _loc5_[_loc21_];
                  _loc9_ = _loc7_.attribute("type");
                  _loc10_ = _loc7_.attribute("style");
                  _loc11_ = uint(_loc7_.attribute("blend") as uint);
                  _loc12_ = uint(_loc7_.attribute("color") as uint);
                  _loc13_ = _loc7_.attribute("skin");
                  _loc16_ = _loc7_.attribute("layout");
                  _loc18_ = _loc7_.attribute("renderer");
                  _loc8_ = _loc7_.child("states");
                  _loc19_ = var_475[_loc18_];
                  _loc17_ = new _loc19_(_loc3_);
                  _loc14_ = _assetLibrary.getAssetByName(_loc13_);
                  _loc15_ = !!_loc14_ ? _loc14_.content as XML : null;
                  if(_loc15_ != null)
                  {
                     BitmapSkinParser.parseSkinDescription(_loc15_,_loc8_,_loc17_,_loc16_,_assetLibrary);
                  }
                  _loc20_ = new DefaultAttStruct();
                  _loc20_.treshold = !!_loc7_.@treshold[0] ? uint(uint(_loc7_.@treshold[0])) : uint(10);
                  _loc20_.background = !!_loc7_.@background[0] ? _loc7_.@background[0] == "HabboHelpCom_back_hi_png" : false;
                  _loc20_.blend = !!_loc7_.@blend[0] ? Number(Number(_loc7_.@blend[0])) : Number(1);
                  _loc20_.color = !!_loc7_.@color[0] ? uint(uint(_loc7_.@color[0])) : uint(16777215);
                  addSkinRenderer(var_1459[_loc9_],uint(_loc10_),_loc17_,_loc20_);
                  _loc21_++;
               }
            }
         }
      }
      
      public function get assets() : IAssetLibrary
      {
         return _assetLibrary;
      }
      
      public function getDefaultAttributesByTypeAndStyle(param1:uint, param2:uint) : DefaultAttStruct
      {
         var _loc3_:Array = var_679[param1];
         return _loc3_ != null ? _loc3_[param2] : null;
      }
      
      public function dispose() : void
      {
         var_680 = null;
         var_679 = null;
         _assetLibrary = null;
      }
      
      public function getSkinRendererByTypeAndStyle(param1:uint, param2:uint) : ISkinRenderer
      {
         var _loc3_:Array = var_680[param1];
         return _loc3_ != null ? _loc3_[param2] : null;
      }
      
      public function addSkinRenderer(param1:uint, param2:uint, param3:ISkinRenderer, param4:DefaultAttStruct) : void
      {
         if(true)
         {
            var_680[param1] = new Array(SkinContainer.const_758);
         }
         var_680[param1][param2] = param3;
         if(true)
         {
            var_679[param1] = new Array(SkinContainer.const_758);
         }
         var_679[param1][param2] = param4;
      }
      
      public function getTheActualState(param1:uint, param2:uint, param3:uint) : uint
      {
         var _loc5_:int = 0;
         var _loc4_:ISkinRenderer = getSkinRendererByTypeAndStyle(param1,param2);
         if(_loc4_ != null)
         {
            for each(_loc5_ in var_385)
            {
               if((param3 & _loc5_) == _loc5_)
               {
                  if(_loc4_.isStateDrawable(_loc5_))
                  {
                     return _loc5_;
                  }
               }
            }
         }
         return 0;
      }
   }
}

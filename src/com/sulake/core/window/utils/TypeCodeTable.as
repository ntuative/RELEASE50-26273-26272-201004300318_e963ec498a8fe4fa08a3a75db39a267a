package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_695;
         param1["bitmap"] = const_657;
         param1["border"] = const_582;
         param1["border_notify"] = const_1277;
         param1["button"] = const_429;
         param1["button_thick"] = const_662;
         param1["button_icon"] = const_1204;
         param1["button_group_left"] = const_579;
         param1["button_group_center"] = const_639;
         param1["button_group_right"] = const_723;
         param1["canvas"] = const_692;
         param1["checkbox"] = const_543;
         param1["closebutton"] = const_858;
         param1["container"] = const_293;
         param1["container_button"] = const_694;
         param1["display_object_wrapper"] = const_519;
         param1["dropmenu"] = const_445;
         param1["dropmenu_item"] = const_438;
         param1["frame"] = const_322;
         param1["frame_notify"] = const_1324;
         param1["header"] = const_706;
         param1["icon"] = const_841;
         param1["itemgrid"] = const_883;
         param1["itemgrid_horizontal"] = const_376;
         param1["itemgrid_vertical"] = const_514;
         param1["itemlist"] = const_911;
         param1["itemlist_horizontal"] = const_290;
         param1["itemlist_vertical"] = const_327;
         param1["maximizebox"] = const_1370;
         param1["menu"] = const_1237;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_960;
         param1["minimizebox"] = const_1251;
         param1["notify"] = const_1304;
         param1["null"] = const_624;
         param1["password"] = const_743;
         param1["radiobutton"] = const_631;
         param1["region"] = const_393;
         param1["restorebox"] = const_1248;
         param1["scaler"] = const_570;
         param1["scaler_horizontal"] = const_1384;
         param1["scaler_vertical"] = const_1272;
         param1["scrollbar_horizontal"] = const_465;
         param1["scrollbar_vertical"] = const_613;
         param1["scrollbar_slider_button_up"] = const_1026;
         param1["scrollbar_slider_button_down"] = const_865;
         param1["scrollbar_slider_button_left"] = const_958;
         param1["scrollbar_slider_button_right"] = const_988;
         param1["scrollbar_slider_bar_horizontal"] = const_840;
         param1["scrollbar_slider_bar_vertical"] = const_828;
         param1["scrollbar_slider_track_horizontal"] = const_929;
         param1["scrollbar_slider_track_vertical"] = const_893;
         param1["scrollable_itemlist"] = const_1208;
         param1["scrollable_itemlist_vertical"] = const_389;
         param1["scrollable_itemlist_horizontal"] = const_824;
         param1["selector"] = const_659;
         param1["selector_list"] = const_614;
         param1["submenu"] = const_960;
         param1["tab_button"] = const_668;
         param1["tab_container_button"] = const_819;
         param1["tab_context"] = const_381;
         param1["tab_content"] = const_948;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_714;
         param1["input"] = const_562;
         param1["toolbar"] = const_1401;
         param1["tooltip"] = const_303;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}

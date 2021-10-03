package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_134;
         param1["bound_to_parent_rect"] = const_92;
         param1["child_window"] = const_904;
         param1["embedded_controller"] = const_336;
         param1["resize_to_accommodate_children"] = const_65;
         param1["input_event_processor"] = const_50;
         param1["internal_event_handling"] = const_618;
         param1["mouse_dragging_target"] = const_231;
         param1["mouse_dragging_trigger"] = const_338;
         param1["mouse_scaling_target"] = const_240;
         param1["mouse_scaling_trigger"] = const_469;
         param1["horizontal_mouse_scaling_trigger"] = const_227;
         param1["vertical_mouse_scaling_trigger"] = const_218;
         param1["observe_parent_input_events"] = const_1004;
         param1["optimize_region_to_layout_size"] = const_362;
         param1["parent_window"] = const_1005;
         param1["relative_horizontal_scale_center"] = const_170;
         param1["relative_horizontal_scale_fixed"] = const_113;
         param1["relative_horizontal_scale_move"] = const_333;
         param1["relative_horizontal_scale_strech"] = const_271;
         param1["relative_scale_center"] = const_1025;
         param1["relative_scale_fixed"] = const_680;
         param1["relative_scale_move"] = const_915;
         param1["relative_scale_strech"] = const_1023;
         param1["relative_vertical_scale_center"] = const_179;
         param1["relative_vertical_scale_fixed"] = const_131;
         param1["relative_vertical_scale_move"] = const_324;
         param1["relative_vertical_scale_strech"] = const_279;
         param1["on_resize_align_left"] = const_702;
         param1["on_resize_align_right"] = const_463;
         param1["on_resize_align_center"] = const_424;
         param1["on_resize_align_top"] = const_590;
         param1["on_resize_align_bottom"] = const_361;
         param1["on_resize_align_middle"] = const_401;
         param1["on_accommodate_align_left"] = const_909;
         param1["on_accommodate_align_right"] = const_478;
         param1["on_accommodate_align_center"] = const_688;
         param1["on_accommodate_align_top"] = const_876;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_627;
         param1["route_input_events_to_parent"] = const_487;
         param1["use_parent_graphic_context"] = const_35;
         param1["draggable_with_mouse"] = const_982;
         param1["scalable_with_mouse"] = const_859;
         param1["reflect_horizontal_resize_to_parent"] = const_396;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_243;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}

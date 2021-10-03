package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_554:String = "Rectangle";
      
      public static const const_61:String = "Boolean";
      
      public static const const_544:String = "Number";
      
      public static const const_69:String = "int";
      
      public static const STRING:String = "String";
      
      public static const const_735:String = "Point";
      
      public static const const_832:String = "Array";
      
      public static const const_934:String = "uint";
      
      public static const const_409:String = "hex";
      
      public static const const_843:String = "Map";
       
      
      private var var_563:String;
      
      private var var_170:Object;
      
      private var var_2309:Boolean;
      
      private var _type:String;
      
      private var var_1793:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_563 = param1;
         var_170 = param2;
         _type = param3;
         var_1793 = param4;
         var_2309 = param3 == const_843 || param3 == const_832 || param3 == const_735 || param3 == const_554;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_409:
               return "0x" + uint(var_170).toString(16);
            case const_61:
               return Boolean(var_170) == true ? "HabboHelpCom_back_hi_png" : "false";
            case const_735:
               return "Point(" + Point(var_170).x + ", " + Point(var_170).y + ")";
            case const_554:
               return "Rectangle(" + Rectangle(var_170).x + ", " + Rectangle(var_170).y + ", " + Rectangle(var_170).width + ", " + Rectangle(var_170).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_843:
               _loc3_ = var_170 as Map;
               _loc1_ = "<var key=\"" + var_563 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_832:
               _loc4_ = var_170 as Array;
               _loc1_ = "<var key=\"" + var_563 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_735:
               _loc5_ = var_170 as Point;
               _loc1_ = "<var key=\"" + var_563 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_69 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_69 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_554:
               _loc6_ = var_170 as Rectangle;
               _loc1_ = "<var key=\"" + var_563 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_69 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_69 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_69 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_69 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_409:
               _loc1_ = "<var key=\"" + var_563 + "\" value=\"" + "0x" + uint(var_170).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_563 + "\" value=\"" + var_170 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_170;
      }
      
      public function get valid() : Boolean
      {
         return var_1793;
      }
      
      public function get key() : String
      {
         return var_563;
      }
   }
}

package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_846:String = "inventory_badges";
      
      public static const const_1267:String = "inventory_clothes";
      
      public static const const_1372:String = "inventory_furniture";
      
      public static const const_690:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_856:String = "inventory_effects";
       
      
      private var var_2039:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_690);
         var_2039 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_2039;
      }
   }
}

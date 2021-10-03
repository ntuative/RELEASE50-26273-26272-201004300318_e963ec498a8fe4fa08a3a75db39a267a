package com.sulake.habbo.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.utils.INotify;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
   
   public class AlertDialog implements IAlertDialog, INotify
   {
      
      private static const const_1100:String = "_alert_button_list";
      
      private static const const_781:String = "_alert_button_cancel";
      
      private static const const_708:String = "_alert_button_ok";
      
      private static const const_1205:String = "_alert_text_summary";
      
      private static var var_648:uint = 0;
      
      private static const const_780:String = "_alert_button_custom";
       
      
      protected var _disposed:Boolean = false;
      
      protected var _window:IFrameWindow;
      
      protected var _title:String = "";
      
      protected var var_187:Function = null;
      
      protected var var_1285:String = "";
      
      public function AlertDialog(param1:IHabboWindowManager, param2:XML, param3:String, param4:String, param5:uint, param6:Function)
      {
         var _loc8_:* = null;
         super();
         ++var_648;
         _window = param1.buildFromXML(param2,2) as IFrameWindow;
         if(param5 == HabboAlertDialogFlag.const_42)
         {
            param5 = 0 | 0 | 0;
         }
         var _loc7_:IItemListWindow = _window.findChildByName(const_1100) as IItemListWindow;
         if(_loc7_)
         {
            if(!(param5 & 0))
            {
               _loc8_ = _loc7_.getListItemByName(const_708);
               _loc8_.dispose();
            }
            if(!(param5 & 0))
            {
               _loc8_ = _loc7_.getListItemByName(const_781);
               _loc8_.dispose();
            }
            if(!(param5 & 0))
            {
               _loc8_ = _loc7_.getListItemByName(const_780);
               _loc8_.dispose();
            }
         }
         _window.procedure = dialogEventProc;
         _window.center();
         this.title = param3;
         this.summary = param4;
         this.callback = param6;
      }
      
      public function set callback(param1:Function) : void
      {
         var_187 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1285 = param1;
         if(_window)
         {
            ITextWindow(_window.findChildByTag("DESCRIPTION")).text = var_1285;
         }
      }
      
      public function setButtonCaption(param1:int, param2:ICaption) : void
      {
      }
      
      public function get callback() : Function
      {
         return var_187;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(_window && true)
            {
               _window.dispose();
               _window = null;
            }
            var_187 = null;
            _disposed = true;
         }
      }
      
      protected function dialogEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "_alert_button_ok":
                  if(var_187 != null)
                  {
                     var_187(this,new WindowEvent(WindowEvent.const_166,null,null));
                  }
                  break;
               case "header_button_close":
                  if(var_187 != null)
                  {
                     var_187(this,new WindowEvent(WindowEvent.const_573,null,null));
                  }
            }
         }
      }
      
      public function getButtonCaption(param1:int) : ICaption
      {
         var _loc2_:* = null;
         if(!_disposed)
         {
            switch(param1)
            {
               case HabboAlertDialogFlag.const_708:
                  _loc2_ = _window.findChildByName(const_708) as IInteractiveWindow;
                  break;
               case HabboAlertDialogFlag.const_781:
                  _loc2_ = _window.findChildByName(const_781) as IInteractiveWindow;
                  break;
               case HabboAlertDialogFlag.const_780:
                  _loc2_ = _window.findChildByName(const_780) as IInteractiveWindow;
            }
         }
         return !!_loc2_ ? new AlertDialogCaption(_loc2_.caption,_loc2_.toolTipCaption,_loc2_.visible) : null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get summary() : String
      {
         return var_1285;
      }
      
      public function set title(param1:String) : void
      {
         _title = param1;
         if(_window)
         {
            _window.caption = _title;
         }
      }
      
      public function get title() : String
      {
         return _title;
      }
   }
}

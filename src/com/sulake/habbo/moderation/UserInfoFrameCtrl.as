package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class UserInfoFrameCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_938:UserInfoCtrl;
      
      private var _disposed:Boolean;
      
      private var _userId:int;
      
      private var var_51:IFrameWindow;
      
      private var _main:ModerationManager;
      
      public function UserInfoFrameCtrl(param1:ModerationManager, param2:int)
      {
         super();
         _main = param1;
         _userId = param2;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_51 != null)
         {
            var_51.destroy();
            var_51 = null;
         }
         if(var_938 != null)
         {
            var_938.dispose();
            var_938 = null;
         }
         _main = null;
      }
      
      public function getId() : String
      {
         return "" + _userId;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1220;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      public function show() : void
      {
         var_51 = IFrameWindow(_main.getXmlWindow("user_info_frame"));
         var_51.caption = "User Info";
         var _loc1_:IWindow = var_51.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_938 = new UserInfoCtrl(var_51,_main,"",true);
         var_938.load(var_51.content,_userId);
         var_51.visible = true;
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_51;
      }
   }
}

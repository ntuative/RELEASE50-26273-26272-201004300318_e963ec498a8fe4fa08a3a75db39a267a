package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_121:DisplayObject;
      
      private var var_2330:uint;
      
      private var var_858:IWindowToolTipAgentService;
      
      private var var_855:IWindowMouseScalingService;
      
      private var _windowContext:IWindowContext;
      
      private var var_859:IWindowFocusManagerService;
      
      private var var_856:IWindowMouseListenerService;
      
      private var var_857:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2330 = 0;
         var_121 = param2;
         _windowContext = param1;
         var_857 = new WindowMouseDragger(param2);
         var_855 = new WindowMouseScaler(param2);
         var_856 = new WindowMouseListener(param2);
         var_859 = new FocusManager(param2);
         var_858 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_855;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_859;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_858;
      }
      
      public function dispose() : void
      {
         if(var_857 != null)
         {
            var_857.dispose();
            var_857 = null;
         }
         if(var_855 != null)
         {
            var_855.dispose();
            var_855 = null;
         }
         if(var_856 != null)
         {
            var_856.dispose();
            var_856 = null;
         }
         if(var_859 != null)
         {
            var_859.dispose();
            var_859 = null;
         }
         if(var_858 != null)
         {
            var_858.dispose();
            var_858 = null;
         }
         _windowContext = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_856;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_857;
      }
   }
}

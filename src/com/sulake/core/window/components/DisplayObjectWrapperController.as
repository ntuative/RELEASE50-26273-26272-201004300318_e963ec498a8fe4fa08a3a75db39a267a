package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.graphics.GraphicContext;
   import com.sulake.core.window.graphics.IGraphicContext;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   
   public class DisplayObjectWrapperController extends WindowController implements IDisplayObjectWrapper
   {
       
      
      public function DisplayObjectWrapperController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_165 = false;
      }
      
      public function getDisplayObject() : DisplayObject
      {
         return IGraphicContextHost(this).getGraphicContext(true).getDisplayObject();
      }
      
      override public function getGraphicContext(param1:Boolean) : IGraphicContext
      {
         if(param1 && !var_17)
         {
            var_17 = new GraphicContext("GC {" + _name + "}",GraphicContext.const_539,var_8);
         }
         return var_17;
      }
      
      public function setDisplayObject(param1:DisplayObject) : void
      {
         IGraphicContextHost(this).getGraphicContext(true).setDisplayObject(param1);
      }
   }
}

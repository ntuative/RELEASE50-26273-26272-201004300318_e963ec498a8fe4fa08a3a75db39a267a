package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.session.IRoomHandlerListener;
   
   public class BaseHandler implements IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      public var _xxxRoomId:int;
      
      public var var_35:int;
      
      private var var_118:IRoomHandlerListener;
      
      private var _connection:IConnection;
      
      public function BaseHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super();
         _connection = param1;
         var_118 = param2;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get connection() : IConnection
      {
         return _connection;
      }
      
      public function get listener() : IRoomHandlerListener
      {
         return var_118;
      }
      
      public function dispose() : void
      {
         _connection = null;
         var_118 = null;
         _disposed = true;
      }
   }
}

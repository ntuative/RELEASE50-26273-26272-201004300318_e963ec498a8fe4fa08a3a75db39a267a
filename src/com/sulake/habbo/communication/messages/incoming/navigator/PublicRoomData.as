package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1695:int;
      
      private var var_1768:String;
      
      private var var_1698:int;
      
      private var _disposed:Boolean;
      
      private var var_1766:int;
      
      private var var_1767:String;
      
      private var var_1288:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1767 = param1.readString();
         var_1695 = param1.readInteger();
         var_1698 = param1.readInteger();
         var_1768 = param1.readString();
         var_1766 = param1.readInteger();
         var_1288 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1766;
      }
      
      public function get worldId() : int
      {
         return var_1698;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1767;
      }
      
      public function get unitPort() : int
      {
         return var_1695;
      }
      
      public function get castLibs() : String
      {
         return var_1768;
      }
      
      public function get nodeId() : int
      {
         return var_1288;
      }
   }
}

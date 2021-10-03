package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1213:int = 4;
      
      public static const const_569:int = 3;
      
      public static const const_679:int = 2;
      
      public static const const_860:int = 1;
       
      
      private var var_1913:String;
      
      private var _disposed:Boolean;
      
      private var var_1647:int;
      
      private var var_1910:Boolean;
      
      private var var_836:String;
      
      private var var_843:PublicRoomData;
      
      private var var_1912:int;
      
      private var _index:int;
      
      private var var_1911:String;
      
      private var _type:int;
      
      private var var_1808:String;
      
      private var var_842:GuestRoomData;
      
      private var var_1914:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_1913 = param1.readString();
         var_1914 = param1.readString();
         var_1910 = param1.readInteger() == 1;
         var_1911 = param1.readString();
         var_836 = param1.readString();
         var_1912 = param1.readInteger();
         var_1647 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_860)
         {
            var_1808 = param1.readString();
         }
         else if(_type == const_569)
         {
            var_843 = new PublicRoomData(param1);
         }
         else if(_type == const_679)
         {
            var_842 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_1912;
      }
      
      public function get popupCaption() : String
      {
         return var_1913;
      }
      
      public function get userCount() : int
      {
         return var_1647;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1910;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_860)
         {
            return 0;
         }
         if(this.type == const_679)
         {
            return this.var_842.maxUserCount;
         }
         if(this.type == const_569)
         {
            return this.var_843.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1914;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_842 != null)
         {
            this.var_842.dispose();
            this.var_842 = null;
         }
         if(this.var_843 != null)
         {
            this.var_843.dispose();
            this.var_843 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_842;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_1911;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_843;
      }
      
      public function get picRef() : String
      {
         return var_836;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1808;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}

package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1436:int = 10;
       
      
      private var var_1571:NavigatorSettingsMessageParser;
      
      private var var_1305:int;
      
      private var var_2121:int;
      
      private var var_2123:Boolean;
      
      private var var_1069:Array;
      
      private var var_893:Dictionary;
      
      private var var_1070:Array;
      
      private var var_2345:int;
      
      private var var_2125:int;
      
      private var var_2122:int;
      
      private var var_2124:int;
      
      private var var_603:PublicRoomShortData;
      
      private var var_434:RoomEventData;
      
      private var var_139:MsgWithRequestId;
      
      private var var_2127:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_2126:Boolean;
      
      private var var_205:GuestRoomData;
      
      private var var_730:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1069 = new Array();
         var_1070 = new Array();
         var_893 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_2121;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2126;
      }
      
      public function startLoading() : void
      {
         this.var_730 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2126 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_434 != null)
         {
            var_434.dispose();
         }
         var_434 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_139 != null && var_139 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_139 != null && var_139 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_139 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_205;
      }
      
      public function get allCategories() : Array
      {
         return var_1069;
      }
      
      public function onRoomExit() : void
      {
         if(var_434 != null)
         {
            var_434.dispose();
            var_434 = null;
         }
         if(var_603 != null)
         {
            var_603.dispose();
            var_603 = null;
         }
         if(var_205 != null)
         {
            var_205.dispose();
            var_205 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_139 = param1;
         var_730 = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1571;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_139 = param1;
         var_730 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_603 = null;
         var_205 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_603 = param1.publicSpace;
            var_434 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2345 = param1.limit;
         this.var_1305 = param1.favouriteRoomIds.length;
         this.var_893 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_893[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_139 as PopularRoomTagsData;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_603;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2123;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_139 = param1;
         var_730 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_2122 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_205 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_730;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1070;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1069 = param1;
         var_1070 = new Array();
         for each(_loc2_ in var_1069)
         {
            if(_loc2_.visible)
            {
               var_1070.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_2125;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2124;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1571 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_139 == null)
         {
            return;
         }
         var_139.dispose();
         var_139 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_434;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_893[param1] = !!param2 ? "yes" : null;
         var_1305 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_139 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_2122;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_139 != null && var_139 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2123 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2125 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_2127 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_205 != null)
         {
            var_205.dispose();
         }
         var_205 = param1;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_205 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1571.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1305 >= var_2345;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2124 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_2127;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_205 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2121 = param1;
      }
   }
}

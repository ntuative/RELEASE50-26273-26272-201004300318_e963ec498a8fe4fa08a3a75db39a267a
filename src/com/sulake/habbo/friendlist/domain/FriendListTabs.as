package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.friendlist.FriendRequestsView;
   import com.sulake.habbo.friendlist.FriendsView;
   import com.sulake.habbo.friendlist.SearchView;
   
   public class FriendListTabs
   {
       
      
      private var var_1650:int = 200;
      
      private var var_653:int = 200;
      
      private var var_450:IFriendListTabsDeps;
      
      private var var_411:Array;
      
      private var var_1412:FriendListTab;
      
      private var var_1413:int = 200;
      
      public function FriendListTabs(param1:IFriendListTabsDeps)
      {
         var_411 = new Array();
         super();
         var_450 = param1;
         var_411.push(new FriendListTab(var_450.getFriendList(),FriendListTab.const_87,new FriendsView(),"${friendlist.friends}","friends_footer","hdr_friends"));
         var_411.push(new FriendListTab(var_450.getFriendList(),FriendListTab.const_91,new FriendRequestsView(),"${friendlist.tab.friendrequests}","friend_requests_footer","hdr_friend_requests"));
         var_411.push(new FriendListTab(var_450.getFriendList(),FriendListTab.const_295,new SearchView(),"${generic.search}","search_footer","hdr_search"));
         toggleSelected(null);
      }
      
      public function findSelectedTab() : FriendListTab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_411)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get tabContentWidth() : int
      {
         return var_1413 - 2;
      }
      
      public function toggleSelected(param1:FriendListTab) : void
      {
         var _loc2_:FriendListTab = findSelectedTab();
         if(_loc2_ == null)
         {
            var_653 = var_1650;
            setSelected(determineDisplayedTab(param1),true);
         }
         else if(_loc2_ == param1 || param1 == null)
         {
            var_1650 = var_653;
            var_653 = 0;
            clearSelections();
         }
         else
         {
            setSelected(determineDisplayedTab(param1),true);
         }
      }
      
      public function clearSelections() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_411)
         {
            _loc1_.setSelected(false);
         }
      }
      
      public function set tabContentHeight(param1:int) : void
      {
         var_653 = param1;
      }
      
      public function findTab(param1:int) : FriendListTab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_411)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function setSelected(param1:FriendListTab, param2:Boolean) : void
      {
         var _loc3_:FriendListTab = findSelectedTab();
         clearSelections();
         param1.setSelected(param2);
         if(param2)
         {
            var_1412 = param1;
         }
      }
      
      private function determineDisplayedTab(param1:FriendListTab) : FriendListTab
      {
         if(param1 != null)
         {
            return param1;
         }
         if(var_1412 != null)
         {
            return var_1412;
         }
         return var_411[0];
      }
      
      public function get tabContentHeight() : int
      {
         return var_653;
      }
      
      public function set windowWidth(param1:int) : void
      {
         var_1413 = param1;
      }
      
      public function getTabs() : Array
      {
         return var_411;
      }
      
      public function get windowWidth() : int
      {
         return var_1413;
      }
   }
}

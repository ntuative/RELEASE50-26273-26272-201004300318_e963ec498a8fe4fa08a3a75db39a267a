package com.sulake.habbo.moderation
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.parser.moderation.IssueMessageData;
   
   public class IssueBundle
   {
       
      
      private var _id:int;
      
      private var var_34:int;
      
      private var var_1642:int = 0;
      
      private var var_148:Map;
      
      private var var_1643:String = "";
      
      private var var_977:int;
      
      public function IssueBundle(param1:int, param2:IssueMessageData)
      {
         super();
         _id = param1;
         var_148 = new Map();
         var_148.add(param2.issueId,param2);
         var_34 = param2.state;
         var_1642 = param2.pickerUserId;
         var_1643 = param2.pickerUserName;
         var_977 = param2.reportedUserId;
      }
      
      public function get reportedUserId() : int
      {
         return var_977;
      }
      
      public function getHighestPriorityIssue() : IssueMessageData
      {
         var _loc2_:* = null;
         if(var_148 == null || true)
         {
            return null;
         }
         var _loc1_:IssueMessageData = var_148.getWithIndex(0);
         var _loc3_:int = 1;
         while(_loc3_ < var_148.length)
         {
            _loc2_ = var_148.getWithIndex(_loc3_);
            if(_loc2_ != null && _loc2_.priority > _loc1_.priority)
            {
               _loc1_ = _loc2_;
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function updateIssue(param1:IssueMessageData) : void
      {
         var_148.remove(param1.issueId);
         var_148.add(param1.issueId,param1);
      }
      
      public function getPrioritySum() : int
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         for each(_loc2_ in issues)
         {
            _loc1_ += _loc2_.priority;
         }
         return _loc1_;
      }
      
      public function getIssueIds() : Array
      {
         if(var_148 == null)
         {
            return [];
         }
         return var_148.getKeys();
      }
      
      public function get state() : int
      {
         return var_34;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function getIssueCount() : int
      {
         if(var_148 == null)
         {
            return 0;
         }
         return var_148.length;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc2_ in var_148)
         {
            if(_loc1_ == null || _loc2_.timeStamp < _loc1_.timeStamp)
            {
               _loc1_ = _loc2_;
            }
         }
         if(_loc1_ != null)
         {
            return _loc1_.getOpenTime();
         }
         return "";
      }
      
      public function get pickerUserId() : int
      {
         return var_1642;
      }
      
      public function removeIssue(param1:int) : IssueMessageData
      {
         return var_148.remove(param1) as IssueMessageData;
      }
      
      public function get pickerName() : String
      {
         return var_1643;
      }
      
      public function get issues() : Array
      {
         return var_148.getValues();
      }
      
      public function getMessageCount() : int
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         for each(_loc2_ in var_148)
         {
            if(_loc2_.message != "")
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
   }
}

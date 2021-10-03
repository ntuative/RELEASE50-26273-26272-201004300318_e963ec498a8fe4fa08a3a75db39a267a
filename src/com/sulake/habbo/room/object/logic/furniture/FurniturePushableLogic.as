package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class FurniturePushableLogic extends FurnitureMultiStateLogic
   {
      
      private static const const_772:int = 1;
      
      private static const const_1092:int = 0;
       
      
      private var var_1536:Vector3d = null;
      
      public function FurniturePushableLogic()
      {
         super();
         moveUpdateInterval = 200;
         var_1536 = new Vector3d();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:* = null;
         if(object != null)
         {
            if(param1.loc != null)
            {
               _loc3_ = object.getLocation();
               _loc4_ = Vector3d.dif(param1.loc,_loc3_);
               if(_loc4_ != null)
               {
                  if(Math.abs(_loc4_.x) < 2 && Math.abs(_loc4_.y) < 2)
                  {
                     _loc5_ = _loc3_;
                     if(Math.abs(_loc4_.x) > 1 || Math.abs(_loc4_.y) > 1)
                     {
                        _loc5_ = Vector3d.sum(_loc3_,Vector3d.product(_loc4_,0.5));
                     }
                     _loc2_ = new RoomObjectMoveUpdateMessage(_loc5_,param1.loc,param1.dir);
                     super.processUpdateMessage(_loc2_);
                     return;
                  }
               }
            }
         }
         if(param1.loc != null)
         {
            _loc2_ = new RoomObjectMoveUpdateMessage(param1.loc,param1.loc,param1.dir);
            super.processUpdateMessage(_loc2_);
         }
         super.processUpdateMessage(param1);
      }
      
      override public function update(param1:int) : void
      {
         if(object != null)
         {
            var_1536.assign(object.getLocation());
            super.update(param1);
            if(Vector3d.dif(object.getLocation(),var_1536).length > 0)
            {
               if(object.getState(0) != const_772)
               {
                  object.setState(const_772,0);
               }
            }
            else
            {
               object.setState(const_1092,0);
            }
         }
      }
   }
}

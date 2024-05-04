package com.angrybirds.spiningwheel.data
{
   public class DailyRewardVO
   {
       
      
      private var mDay:uint;
      
      private var mWheelItems:Vector.<com.angrybirds.spiningwheel.data.WheelItemVO>;
      
      private var mDailyRewardItems:Vector.<com.angrybirds.spiningwheel.data.DailyRewardItemVO>;
      
      private var mDailyReward:com.angrybirds.spiningwheel.data.BaseItemVO;
      
      private var mRewardRawData:Object;
      
      private var mWheelRewardId:int;
      
      public function DailyRewardVO(data:Object)
      {
         var swItem:Object = null;
         var wItemVO:com.angrybirds.spiningwheel.data.WheelItemVO = null;
         super();
         this.mDay = data.d;
         var spinWheelItems:Array = data.sw;
         this.mWheelItems = new Vector.<com.angrybirds.spiningwheel.data.WheelItemVO>();
         for each(swItem in spinWheelItems)
         {
            wItemVO = new com.angrybirds.spiningwheel.data.WheelItemVO(swItem);
            this.mWheelItems.push(wItemVO);
         }
         this.mWheelRewardId = !!data.rid ? int(data.rid) : -1;
      }
      
      public function hasRewardToShow() : Boolean
      {
         return this.mWheelRewardId != -1;
      }
      
      public function getPredictedWheelRewardID() : int
      {
         return this.mWheelRewardId;
      }
      
      public function getWheelItems() : Vector.<com.angrybirds.spiningwheel.data.WheelItemVO>
      {
         return this.mWheelItems.concat();
      }
      
      public function getDailyReward() : com.angrybirds.spiningwheel.data.BaseItemVO
      {
         return this.mDailyReward;
      }
      
      public function getRewardRawData() : Object
      {
         return this.mRewardRawData;
      }
      
      internal function setReward(data:Object) : void
      {
         this.mRewardRawData = data;
      }
      
      public function getItemForID(id:int) : com.angrybirds.spiningwheel.data.WheelItemVO
      {
         var item:com.angrybirds.spiningwheel.data.WheelItemVO = null;
         if(id < 0)
         {
            throw new Error("invalid id for spinning wheel");
         }
         var wheelItem:com.angrybirds.spiningwheel.data.WheelItemVO = null;
         var wheelItems:Vector.<com.angrybirds.spiningwheel.data.WheelItemVO> = this.getWheelItems();
         for each(item in wheelItems)
         {
            if(item.id == id)
            {
               wheelItem = item;
               break;
            }
         }
         return wheelItem;
      }
   }
}

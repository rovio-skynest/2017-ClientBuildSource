// Item unlocked popup script (for Green Day, based on 20121109-1447) by The Green Spirit, for newer versions.
// You just unlocked an item: Sus!

package com.angrybirds.popups
{
   import com.rovio.ui.popup.AbstractPopup;
   import com.rovio.ui.popup.PopupPriorityType;
   import com.angrybirds.avatarcreator.data.Item;
   import com.rovio.ui.Views.ViewXMLLibrary;
   import com.rovio.ui.Views.UIView;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class ItemUnlockedPopup extends AbstractPopup
   {
      private var mCategory:String;
      
      private var mItem:Item;
      
      public function ItemUnlockedPopup(layerIndex:int, priority:int, item:Item)
      {
         this.mItem = item;
         super(layerIndex, priority, ViewXMLLibrary.mLibrary.Views.PopupView_ItemUnlocked[0], "ItemUnlockedPopup");
      }
      
      override protected function show(useTransition:Boolean = false) : void
      {
         super.show(useTransition);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override protected function init() : void
      {
         super.init();
         var itemIcon:MovieClip = this.mItem.getInventoryIcon();
         itemIcon.x = 60 + -itemIcon.width * 0.5;
         itemIcon.y = 90 + -itemIcon.height;
         itemIcon.scaleY = 1.75;
         itemIcon.scaleX = 1.75;
         mContainer.mClip.itemUnlockHeader.addChild(itemIcon);
         this.mCategory = this.mItem.category;
         mContainer.mClip.unlockedText.text = "You just unlocked an item: " + this.mItem.mName;
         mContainer.mClip.btnClose.addEventListener(MouseEvent.CLICK, this.onCloseClick);
         mContainer.mClip.wearBtn.addEventListener(MouseEvent.CLICK, this.onWearBtnClick);
      }
      
      private function onWearBtnClick(e:MouseEvent) : void
      {
         close();
         avatarCreatorPopup = new com.angrybirds.popups.AvatarCreatorPopup(PopupLayerIndexFacebook.ALERT, PopupPriorityType.TOP, this.mCategory);
         AngryBirdsBase.singleton.popupManager.openPopup(avatarCreatorPopup);
      }
      
      private function onCloseClick(e:MouseEvent) : void
      {
         close();
      }
      
      override protected function hide(useTransition:Boolean = false, waitForAnimationsToStop:Boolean = false) : void
      {
         mContainer.mClip.wearBtn.removeEventListener(MouseEvent.CLICK, this.onCloseClick);
         mContainer.mClip.btnClose.removeEventListener(MouseEvent.CLICK, this.onWearBtnClick);
         super.hide(useTransition,waitForAnimationsToStop);
      }
   }
}

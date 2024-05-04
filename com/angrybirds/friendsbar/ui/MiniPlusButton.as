package com.angrybirds.friendsbar.ui
{
   import com.rovio.assets.AssetCache;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   
   public class MiniPlusButton
   {
       
      
      public var mAssetHolder:Sprite;
      
      
      private var _mMiniPlusButton:Class = AssetCache.getAssetFromCache("ButtonMiniChallenge_Plates") as Class;
	  private var mMiniPlusButton:SimpleButton = new _mMiniPlusButton();
      
      
      private var _mCheckMarkAnimation:Class = AssetCache.getAssetFromCache("com.angrybirds.friendsbar.MiniGiftCheckmarkAnimation") as Class;
	  private var mCheckMarkAnimation:MovieClip = new _mCheckMarkAnimation();
      
      public function MiniPlusButton()
      {
         super();
         this.mAssetHolder = new Sprite();
         //this.mMiniPlusButton = AssetCache.getAssetFromCache("ButtonMiniChallenge_Plates");
         this.mAssetHolder.tabChildren = false;
         this.mMiniPlusButton.tabEnabled = false;
         this.mAssetHolder.addChild(this.mMiniPlusButton);
      }
      
      public function get miniPlusButton() : SimpleButton
      {
         return this.mMiniPlusButton;
      }
      
      public function setCanSend(canSend:Boolean, playTransition:Boolean) : void
      {
         if(canSend == false)
         {
            this.mMiniPlusButton.visible = false;
            if(playTransition)
            {
               //this.mCheckMarkAnimation = AssetCache.getAssetFromCache("com.angrybirds.friendsbar.MiniGiftCheckmarkAnimation");
               this.mAssetHolder.addChild(this.mCheckMarkAnimation);
               this.mCheckMarkAnimation.addFrameScript(this.mCheckMarkAnimation.totalFrames - 1,this.disposeCheckMark);
               this.mCheckMarkAnimation.play();
            }
         }
         else
         {
            this.mMiniPlusButton.visible = true;
            this.disposeCheckMark();
         }
      }
      
      private function disposeCheckMark() : void
      {
         if(this.mCheckMarkAnimation)
         {
            this.mCheckMarkAnimation.stop();
            if(this.mAssetHolder.contains(this.mCheckMarkAnimation))
            {
               this.mAssetHolder.removeChild(this.mCheckMarkAnimation);
            }
            this.mCheckMarkAnimation = null;
         }
      }
   }
}

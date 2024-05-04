package com.angrybirds.popups.custominvite
{
   import com.angrybirds.friendsbar.ui.ScrollerItemRenderer;
   
   public class PlayerToInviteRowRenderer extends ScrollerItemRenderer
   {
       
      
      private var mPlayer1:com.angrybirds.popups.custominvite.PlayerToInviteRenderer;
      
      private var mPlayer2:com.angrybirds.popups.custominvite.PlayerToInviteRenderer;
      
      public function PlayerToInviteRowRenderer()
      {
         super();
         this.mPlayer1 = new com.angrybirds.popups.custominvite.PlayerToInviteRenderer();
         this.mPlayer2 = new com.angrybirds.popups.custominvite.PlayerToInviteRenderer();
         addChild(this.mPlayer1);
         addChild(this.mPlayer2);
         this.mPlayer2.x = 300;
      }
      
      override public function set data(value:Object) : void
      {
         if(value)
         {
            this.mPlayer1.data = value[0];
            this.mPlayer2.data = value[1];
         }
      }
      
      override public function get height() : Number
      {
         return 35;
      }
   }
}

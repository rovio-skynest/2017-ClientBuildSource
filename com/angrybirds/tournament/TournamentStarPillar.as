package com.angrybirds.tournament
{
   import data.user.FacebookUserProgress;
   import com.angrybirds.states.tournament.StateTournamentLevelSelection;
   import com.angrybirds.data.UserTournamentScoreVO;
   import com.angrybirds.tournament.TournamentAvatar;
   import com.rovio.assets.AssetCache;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   
   public class TournamentStarPillar extends Sprite
   {
      private var tournamentScoreVO:UserTournamentScoreVO;
      
      private var frame:int = 0;
      
      private var starPillar:MovieClip;
      
      private var mAvatar:TournamentAvatar;
      
      public function TournamentStarPillar(userTournamentScoreVO:UserTournamentScoreVO, pillarType:int, starPillarOwn:String = "StarpillarOwn", starPillarEnemy:String = "StarpillarEnemy")
      {
         var starPillarCls:Class = null;
         super();
         this.tournamentScoreVO = userTournamentScoreVO;
         if(userTournamentScoreVO.userId == (AngryBirdsBase.singleton.dataModel.userProgress as FacebookUserProgress).userID)
         {
            starPillarCls = AssetCache.getAssetFromCache(starPillarOwn);
         }
         else
         {
            starPillarCls = AssetCache.getAssetFromCache(starPillarEnemy);
         }
         this.starPillar = new starPillarCls();
         addChild(this.starPillar);
         
         var pillarName:TextField = (this.starPillar.getChildByName("TextField_StarpillarOwn")).getChildByName("text");
         pillarName.text = userTournamentScoreVO.rank + ". " + userTournamentScoreVO.userName;
         
         var pillarScore:TextField = (this.starPillar.getChildByName("Textfield_StarpillarScore")).getChildByName("text");
         pillarScore.text = StateTournamentLevelSelection.numberFormat(userTournamentScoreVO.tournamentScore);
         
         this.frame = this.getFrameToStopAt(pillarType);
         this.mAvatar = new TournamentAvatar(this.starPillar,this.tournamentScoreVO);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onAddedToStage(e:Event) : void
      {
         /* this.starPillar.gotoAndPlay(1);
         if(!this.starPillar.hasEventListener(Event.ENTER_FRAME))
         {
            this.starPillar.addEventListener(Event.ENTER_FRAME,this.onEnterFrame,false,0,true);
         } */
      }
      
      private function onRemovedFromStage(e:Event) : void
      {
         // this.starPillar.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function getFrameToStopAt(param1:int) : int
      {
         switch(param1)
         {
            case 1:
               return 74;
            case 2:
               return 58;
            default:
               return 41;
         }
      }
      
      public function set currentFrame(param1:int) : void
      {
         if(this.starPillar)
         {
            this.starPillar.gotoAndStop(param1);
         }
      }
      
      public function get currentFrame() : int
      {
         if(this.starPillar)
         {
            return this.starPillar.currentFrame;
         }
         return 0;
      }
      
      public function dispose() : void
      {
         if(this.starPillar)
         {
            // this.starPillar.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            if(this.contains(this.starPillar))
            {
               removeChild(this.starPillar);
            }
            this.starPillar = null;
         }
         if(this.mAvatar)
         {
            this.mAvatar.dispose();
         }
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      /* private function onEnterFrame(e:Event) : void
      {
         if(this.starPillar.currentFrame >= this.frame)
         {
            this.starPillar.stop();
            this.starPillar.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      } */
   }
}

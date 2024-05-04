package com.angrybirds.tournament.campaign
{
   import com.rovio.utils.FacebookAnalyticsCollector;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class TournamentCampaignManager
   {
      
      private static var smCampaigns:Vector.<com.angrybirds.tournament.campaign.CampaignDefinition>;
      
      private static var smCampaignsLoaded:Boolean = false;
       
      
      private var mActivatedCampaign:com.angrybirds.tournament.campaign.CampaignDefinition;
      
      public function TournamentCampaignManager()
      {
         super();
      }
      
      public static function addCampaign(tournamentID:String, data:Object) : void
      {
         if(smCampaigns == null)
         {
            smCampaigns = new Vector.<com.angrybirds.tournament.campaign.CampaignDefinition>();
         }
         smCampaigns.push(new com.angrybirds.tournament.campaign.CampaignDefinition(tournamentID,data));
      }
      
      public static function loadCampaigns() : void
      {
         if(!smCampaignsLoaded)
         {
            smCampaignsLoaded = true;
         }
      }
      
      public function activateCampaign(campaignID:String) : com.angrybirds.tournament.campaign.CampaignDefinition
      {
         var campaign:com.angrybirds.tournament.campaign.CampaignDefinition = null;
         for each(campaign in smCampaigns)
         {
            if(campaign.id == campaignID)
            {
               this.mActivatedCampaign = campaign;
               return campaign;
            }
         }
         return null;
      }
      
      public function deActivateCurrentCampaign() : void
      {
         this.mActivatedCampaign = null;
      }
      
      public function campaignUIInteraction(eventName:String) : void
      {
         if(!this.mActivatedCampaign || !eventName)
         {
            return;
         }
         if(eventName == "TOURNAMENT_CAMPAIGN_CLICKED")
         {
            this.doCampaignAction();
         }
      }
      
      public function doCampaignAction() : void
      {
         if(!this.mActivatedCampaign)
         {
            return;
         }
         FacebookAnalyticsCollector.getInstance().trackBrandedButtonClick(this.mActivatedCampaign.id);
         this.openExternalLink(this.mActivatedCampaign.campaignURL);
      }
      
      private function openExternalLink(urlString:String) : void
      {
         var url:URLRequest;
         if(!urlString || urlString.length == 0)
         {
         }
         url = new URLRequest(urlString);
         try
         {
            AngryBirdsBase.singleton.exitFullScreen();
            navigateToURL(url,"_blank");
         }
         catch(e:Error)
         {
         }
      }
   }
}

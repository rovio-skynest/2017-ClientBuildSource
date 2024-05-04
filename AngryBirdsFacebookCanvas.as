package
{
   import com.rovio.utils.GoogleAnalyticsTracker;
   import com.rovio.utils.FacebookGoogleAnalyticsTracker;
   import com.rovio.ApplicationCanvas;
   import flash.events.Event;
   
   public class AngryBirdsFacebookCanvas extends ApplicationCanvas
   {
      public function AngryBirdsFacebookCanvas()
      {
         super();
         if(stage)
         {
            this.init();
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         }
      }
      
      private function init() : void
      {
         GoogleAnalyticsTracker.initFlashVersion(stage,"UA-23082676-15");
         FacebookGoogleAnalyticsTracker.initSampling();
         if(false)
         {
            loaderInfo.addEventListener(Event.COMPLETE,this.func1);
         }
         else
         {
            this.func2();
         }
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.init();
      }
      
      private function func1(param1:Event) : void
      {
         loaderInfo.removeEventListener(Event.COMPLETE,this.func1);
         this.func2();
      }
      
      protected function func2() : void
      {
		  new AngryBirdsFacebook(this);
      }
   }
}
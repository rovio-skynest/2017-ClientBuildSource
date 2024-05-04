package com.angrybirds.tips
{
   public class TipsManager
   {
      
      private static var sInstance:TipsManager = new TipsManager();
      
      private static var LEVEL_END_TIPS:Array = ["Use Power Potion to make Wingman even stronger!","The Blues are best at crashing glass!","Chuck breaks wood better than anyone!","Bomb beats stone, but can\'t handle wood!","Boomerang can be tricky - sometimes, a direct shot is best!","Use Wingman after flinging all your birds!","Jingle Sling adds a short-range scope to help you aim!","Use King Sling to improve damage and range!","Matilda drops an explosive egg and hits hard on her way out!","Use Wingman to smash levels and get amazing scores!","Bomb can be activated before OR after he hits!"];
      
      private static var LOADING_TIPS:Array = ["Use Inbox in the Sidebar to send free gifts to your friends!","Mystery gifts can hold Power-Ups and Bird Coins!","Get free Power-ups by inviting your friends to play!","Check back for special tournaments every month!","Slingshots are permanent - buy once, use forever!","These birds are actually able to survive drinking powerful chemicals. That's crazy.", "The eggs are actually unfertilized, but don't tell the birds we said that.", "I've done nothing but teleport bread for three days.", "Long time no see!", "You chose this path, now I have a surprise for you. Deploying surprise in 5.. 4..", "OH FIDDLESTICKS, What now?", "The number 7 doesn't exist and is just an illusion.", "Every Xbox you own comes with UNO - even the oldest Xbox known to man.", "They're waiting for you Gordon, in the tesssst chamber...", "Pro Tip: To defeat the Cyberpig, throw birds at it until it dies.", "No one knows where Minecon 2014 was held.", "The PS3 version of Minecraft is the best version.", "BANHAMMER! Cheating and exploitation is your one way ticket to Banville.", "Grenade party! Not a good 4-shot? Chuck some grenades.", "You can use your right mouse button to drag files. Try it and see what happens!", "You can check your Halo 2 game stats on your player profile on Bungie.net!", "New to Halo 2? Feel free to ask for help from your fellow teammates and they'll kindly assist you.", "BXR. Yeah, it's cheating.", "I’m using tilt controls!", "The right man in the wrong place can make all the difference in the world.", "This automated train is provided for the security and convenience of the Black Mesa Research Facility personnel.", "On May 8th, 2019, Rovio will end support for AB. But AB will be strong enough to support itself.", "Hey! Vsauce, Michael here. Where are your fingers?", "I am keeping these tip messages and there's nothing you can do about it.", "No matter how hard you try to say who asked, I'm always the person who asked.", "Angry Birds Epic is overrated.", "My wife left me because I play this game called AB Refresh.", "Want to go blind? Go on YouTube and type A W E S O M E while playing a video!", "This game was not sponsored by RAID: Shadow Legends™.", "Never gonna give you up, never gonna let you down, never gonna run around and desert you...", "https://discord.gg/Q63QU7qt5w", "Are Bird-O-Matic avatars NFTs? I don't know, man...", "ratio + L + didnt ask + dont care + wrong + unfunny + cry about it + skill issue", "How do I count to 3?"];
       
      
      public function TipsManager()
      {
         super();
         if(sInstance)
         {
            throw new Error("TipsManager is singleton");
         }
      }
      
      public static function get instance() : TipsManager
      {
         return sInstance;
      }
      
      public function getRandLevelEndTip() : String
      {
         return LEVEL_END_TIPS[this.randRange(0,LEVEL_END_TIPS.length - 1)];
      }
      
      public function getRandLoadingTip() : String
      {
         return LOADING_TIPS[this.randRange(0,LOADING_TIPS.length - 1)];
      }
      
      public function getTipAtIndex(index:int) : String
      {
         return LEVEL_END_TIPS[index];
      }
      
      public function get totalTips() : int
      {
         return LEVEL_END_TIPS.length;
      }
      
      private function randRange(minNum:Number, maxNum:Number) : Number
      {
         return Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum;
      }
   }
}

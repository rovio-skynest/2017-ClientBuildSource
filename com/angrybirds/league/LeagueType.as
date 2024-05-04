package com.angrybirds.league
{
   public class LeagueType
   {
      
      public static const STAR_LEAGUE_ID:String = "STAR";
      
      public static const STAR_LEAGUE_DESCRIPTION:String = "Star Player, rank ";
      
      public static const STAR_PLAYER_RATING_RANGE:int = 100;
      
      public static const sQualifierLeague:com.angrybirds.league.LeagueDefinition = new com.angrybirds.league.LeagueDefinition("QUALIFIER","Warm-up league","","");
      
      public static const sGlassLeague:com.angrybirds.league.LeagueDefinition = new com.angrybirds.league.LeagueDefinition("GLASS","Glass League","","");
      
      public static const sWoodLeague:com.angrybirds.league.LeagueDefinition = new com.angrybirds.league.LeagueDefinition("WOOD","Wood League","","league_promotion_wood");
      
      public static const sStoneLeague:com.angrybirds.league.LeagueDefinition = new com.angrybirds.league.LeagueDefinition("STONE","Stone League","","league_promotion_stone");
      
      public static const sBronzeLeague:com.angrybirds.league.LeagueDefinition = new com.angrybirds.league.LeagueDefinition("BRONZE","Bronze League","","league_promotion_bronze");
      
      public static const sSilverLeague:com.angrybirds.league.LeagueDefinition = new com.angrybirds.league.LeagueDefinition("SILVER","Silver League","","league_promotion_silver");
      
      public static const sGoldLeague:com.angrybirds.league.LeagueDefinition = new com.angrybirds.league.LeagueDefinition("GOLD","Gold League","","league_promotion_gold");
      
      public static const sDiamondLeague:com.angrybirds.league.LeagueDefinition = new com.angrybirds.league.LeagueDefinition("DIAMOND","Diamond League","","league_promotion_diamond");
      
      public static const sAllLeagues:Array = [sGlassLeague,sWoodLeague,sStoneLeague,sBronzeLeague,sSilverLeague,sGoldLeague,sDiamondLeague];
       
      
      public function LeagueType()
      {
         super();
      }
      
      public static function getLeagueById(id:String) : com.angrybirds.league.LeagueDefinition
      {
         var ld:com.angrybirds.league.LeagueDefinition = null;
         for each(ld in sAllLeagues)
         {
            if(ld.id == id)
            {
               return ld;
            }
         }
         return sQualifierLeague;
      }
      
      public static function getNextLeagueId(id:String) : com.angrybirds.league.LeagueDefinition
      {
         for(var index:int = 0; index < sAllLeagues.length; index++)
         {
            if(sAllLeagues[index].id == id)
            {
               if(index == sAllLeagues.length - 1)
               {
                  return sAllLeagues[index];
               }
               return sAllLeagues[index + 1];
            }
         }
         throw new Error("Can\'t find league ID: " + id);
      }
      
      public static function getPreviousLeagueId(id:String) : com.angrybirds.league.LeagueDefinition
      {
         for(var index:int = 0; index < sAllLeagues.length; index++)
         {
            if(sAllLeagues[index].id == id)
            {
               if(index == sAllLeagues.length - 1)
               {
                  return sAllLeagues[index];
               }
               return sAllLeagues[index - 1];
            }
         }
         return null;
      }
      
      public static function setLeagueDataFromServer(serverData:Object) : com.angrybirds.league.LeagueDefinition
      {
         var ld:com.angrybirds.league.LeagueDefinition = null;
         if(serverData)
         {
            for each(ld in sAllLeagues)
            {
               if(ld.id == serverData.tn)
               {
                  ld.name = serverData.ln;
                  return ld;
               }
            }
         }
         return null;
      }
      
      public static function injectLeagueConfig(data:Object) : void
      {
         var d:Object = null;
         var ld:com.angrybirds.league.LeagueDefinition = null;
         if(data)
         {
            for each(d in data)
            {
               ld = getLeagueById(d.n);
               if(ld)
               {
                  ld.reward = d.r;
                  ld.minRating = d.rm;
               }
            }
         }
      }
      
      public static function getLastLeagueName() : String
      {
         return sAllLeagues[sAllLeagues.length - 1].name;
      }
   }
}

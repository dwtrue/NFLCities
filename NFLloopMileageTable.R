NFLloopMileageTable<- function(NFLteamList) {
        for(x in 1:32) {
                Team1<-as.character(NFLteamList[x])
                for(y in 1:32) {
                        Team2<-as.character(NFLteamList[y])
                        PopMileageTable(Team1,Team2)
                }
        }
}
for(x in 1:32) {
        Team1<-as.character(NFLteamList[x,1])
        for(y in 1:32) {
                Team2<-as.character(NFLteamList[y,1])
                                    PopMileageTable(Team1,Team2)
        }
}
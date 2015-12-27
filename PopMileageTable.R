PopMileageTable<-function(Team1,Team2) {
        NFLmileageTable[Team1,Team2]<<-
                        DistancePerLatLong(
                                NFLcityLatLongData[Team1,"tLatD"],
                                NFLcityLatLongData[Team1,"tLatM"],
                                NFLcityLatLongData[Team1,"tLongD"],
                                NFLcityLatLongData[Team1,"tLongM"],
                                NFLcityLatLongData[Team2,"tLatD"],
                                NFLcityLatLongData[Team2,"tLatM"],
                                NFLcityLatLongData[Team2,"tLongD"],
                                NFLcityLatLongData[Team2,"tLongM"]
                                )
        NFLmileageTable[Team2,Team1]<<-NFLmileageTable[Team1,Team2]
}
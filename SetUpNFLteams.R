NFLteamListData<-read.csv("NFLteamList.csv",header=FALSE)
NFLteamList<-unlist(NFLteamListData)
#
NFLmileageTable<-matrix(0,ncol=32,nrow=32)
colnames(NFLmileageTable)<-NFLteamList
rownames(NFLmileageTable)<-NFLteamList
NFLmileageTable<-as.data.frame(NFLmileageTable)
# junk<-NFLmileageTable["WAS","BAL"] # method to access this dframe's cells
#
NFLcityLatLongData<-read.csv("NFLcityLatLongs.csv",header=FALSE)
colnames(NFLcityLatLongData)<-c("Team","tLatD","tLatM","tLongD","tLongM")
rownames(NFLcityLatLongData)<-NFLcityLatLongData[,1]
NFLcityLatLongData<-as.data.frame(NFLcityLatLongData)
# junk<-NFLcityLatLongData["ATL","tLatD"] # method to access this dframe's cells
#
source("DistancePerLatLong.R")
#
# DistancePerLatLong(lat1deg,lat1min,long1deg,long1min,
#                    lat2deg,lat2min,long2deg,long2min)
#
# The following shows how the NFLloopMileageTable.R script was designed
#
# Team1<-"BAL"
# Team2<-"NE"
# NFLmileageTable[Team1,Team2]<-
#         DistancePerLatLong(
#         NFLcityLatLongData[Team1,"tLatD"],
#         NFLcityLatLongData[Team1,"tLatM"],
#         NFLcityLatLongData[Team1,"tLongD"],
#         NFLcityLatLongData[Team1,"tLongM"],
#         NFLcityLatLongData[Team2,"tLatD"],
#         NFLcityLatLongData[Team2,"tLatM"],
#         NFLcityLatLongData[Team2,"tLongD"],
#         NFLcityLatLongData[Team2,"tLongM"]
#         )
# NFLmileageTable[Team2,Team1]<-NFLmileageTable[Team1,Team2]
#        
# Use NFLloopMileageTable.R to do the work
#
source("PopMileageTable.R")
source("NFLloopMileageTable.R")
NFLloopMileageTable(NFLteamList)
#
head(NFLmileageTable)
#
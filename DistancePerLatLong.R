DistancePerLatLong <- function (lat1deg,lat1min,long1deg,long1min,
                                lat2deg,lat2min,long2deg,long2min) {

        #  Decimal Degrees = Degrees + minutes/60 + seconds/3600
        # from: http://andrew.hedges.name/experiments/convert_lat_long/
        Latitude1<-lat1deg+lat1min/60
        Longitude1<-long1deg+long1min/60

        Latitude2<-lat2deg+lat2min/60
        Longitude2<-long2deg+long2min/60
        
        EarthRadiusMiles <- 3959 # miles

        # deg2rad(deg) >> return deg * (Math.PI/180)
        # from: http://stackoverflow.com/questions/27928
        # .../calculate-distance-between-two-latitude-longitude-points-haversine-formula

        dLat <- abs((Latitude2-Latitude1)*pi/180)
        dLong <- abs((Longitude2-Longitude1)*pi/180)
        
        # var a = 
        #        Math.sin(dLat/2) * Math.sin(dLat/2) +
        #        Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
        #        Math.sin(dLon/2) * Math.sin(dLon/2)
        # ; 
        # from: http://stackoverflow.com/questions/27928
        # .../calculate-distance-between-two-latitude-longitude-points-haversine-formula
        
        # a = (sin(dlat/2))^2 +
        # cos(lat1) * cos(lat2) * DOES NOT call for pi/180
        # (sin(dlon/2))^2
        # from: http://andrew.hedges.name/experiments/haversine/
        a<-(sin(dLat/2))^2+
                cos(Latitude1*pi/180)*cos(Latitude2*pi/180)*
                (sin(dLong/2))^2

        # c = 2 * atan2( sqrt(a), sqrt(1-a) )
        # from: http://andrew.hedges.name/experiments/haversine/
        c<-2*atan2(sqrt(a),sqrt(1-a))

        # d = R * c (where R is the radius of the Earth)
        DistanceMiles <- trunc((EarthRadiusMiles*c)+.5)
        DistanceMiles
}
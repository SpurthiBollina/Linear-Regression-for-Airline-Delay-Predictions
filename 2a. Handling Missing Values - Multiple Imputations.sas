Resetline;
dm 'clear log';

Title "&SYSUSERID - HW2";
%let libpath= E:\1. Ms Academics\3. Spring Courses\3. IDS 594 - SaS\Assign 2\sasdata\;
libname HW2 "&libpath."; 
%let pdfpath = E:\1. Ms Academics\3. Spring Courses\3. IDS 594 - SaS\Assign 2\;
ODS PDF FILE = "&pdfpath.\HW2_SpurthiBollina.pdf";
ODS TRACE ON;

%let droprenamemv = (drop = CRSDepTime DepTime CRSArrTime ArrTime FirstDepTime WheelsOff WheelsOn Div1WheelsOn Div1WheelsOff Div2WheelsOn 
Div2WheelsOff Div3WheelsOn Div3WheelsOff Div4WheelsOn Div4WheelsOff Div5WheelsOn Div5WheelsOff 
rename =(CRSDepTimeF=CRSDepTime DepTimeF=DepTime CRSArrTimeF=CRSArrTime ArrTimeF=ArrTime FirstDepTimeF=FirstDepTime 
WheelsOffF=WheelsOff WheelsOnF=WheelsOn Div1WheelsOnF=Div1WheelsOn Div1WheelsOffF=Div1WheelsOff Div2WheelsOnF=Div2WheelsOn 
Div2WheelsOffF=Div2WheelsOff Div3WheelsOnF=Div3WheelsOn Div3WheelsOffF=Div3WheelsOff Div4WheelsOnF=Div4WheelsOn 
Div4WheelsOffF=Div4WheelsOff Div5WheelsOnF=Div5WheelsOn Div5WheelsOffF=Div5WheelsOff) ) ;

%let lengthmv = length Year 4. Quarter 4. Month 4. DayofMonth 4. DayOfWeek 4. FlightDate 8. UniqueCarrier $8. AirlineID  $4. 
Carrier  $4. TailNum  $10. FlightNum  $4. OriginAirportID  $8. OriginAirportSeqID  $8. OriginCityMarketID  $6. Origin  $32. 
OriginCityName  $32. OriginState  $32. OriginStateFips  $32. OriginStateName  $32. OriginWac  $32. DestAirportID  $6. 
DestAirportSeqID  $6. DestCityMarketID  $6. Dest  $32. DestCityName  $32. DestState  $32. DestStateFips  $32. 
DestStateName  $32. DestWac  $32. CRSDepTime  $8. CRSDepTimeF 8. DepTime  $8. DepTimeF  8. DepDelay 4. DepDelayMinutes 4. 
DepDel15 4. DepartureDelayGroups 4. DepTimeBlk  $9. TaxiOut 4. WheelsOff  $8. WheelsOffF  8. WheelsOn  $8. WheelsOnF  8. 
TaxiIn 4. CRSArrTime  $8. CRSArrTimeF  8. ArrTime  $8. ArrTimeF  8. ArrDelay 4. ArrDelayMinutes 4. ArrDel15 4. 
ArrivalDelayGroups  4. ArrTimeBlk  $9. Cancelled 4. CancellationCode  $8. Diverted  4. CRSElapsedTime 4. ActualElapsedTime 4. 
AirTime 4. Flights 4. Distance 4. DistanceGroup 4. CarrierDelay 4. WeatherDelay 4. NASDelay 4. SecurityDelay 4. LateAircraftDelay 4. 
FirstDepTime  $8. FirstDepTimeF  8. TotalAddGTime 4. LongestAddGTime 4. DivAirportLandings 4. DivReachedDest 4. DivActualElapsedTime 4. DivArrDelay 4. 
DivDistance 4. Div1Airport  $8. Div1AirportID  $8. Div1AirportSeqID  $8. Div1WheelsOn  $8. Div1WheelsOnF  8. Div1TotalGTime 4. Div1LongestGTime 4. 
Div1WheelsOff  $8. Div1WheelsOffF  8. Div1TailNum  $8. Div2Airport  $8. Div2AirportID  $8. Div2AirportSeqID  $8. Div2WheelsOn  $8. Div2WheelsOnF  8. Div2TotalGTime 4. 
Div2LongestGTime 4. Div2WheelsOff  $8. Div2WheelsOffF  8. Div2TailNum  $8. Div3Airport  $8. Div3AirportID  $8. Div3AirportSeqID  $8. Div3WheelsOn  $8. Div3WheelsOnF  8. 
Div3TotalGTime 4. Div3LongestGTime 4. Div3WheelsOff  $8. Div3WheelsOffF  8. Div3TailNum  $8. Div4Airport  $8. Div4AirportID  $8. Div4AirportSeqID  $8. 
Div4WheelsOn  $8. Div4WheelsOnF  8. Div4TotalGTime 4. Div4LongestGTime 4. Div4WheelsOff  $8. Div4WheelsOffF  8. Div4TailNum  $8. Div5Airport  $8. Div5AirportID  $8. 
Div5AirportSeqID  $8. Div5WheelsOn  $8. Div5WheelsOnF  8. Div5TotalGTime 4. Div5LongestGTime 4. Div5WheelsOff  $8. Div5WheelsOffF  8. Div5TailNum   $8.  ; 

%let inputmv = input Year Quarter Month DayofMonth DayOfWeek FlightDate :yymmdd10. UniqueCarrier $ AirlineID $ Carrier $ TailNum $ FlightNum $ 
OriginAirportID $ OriginAirportSeqID $ OriginCityMarketID $ Origin $ OriginCityName $ OriginState $ OriginStateFips $ 
OriginStateName $ OriginWac $ DestAirportID $ DestAirportSeqID $ DestCityMarketID $ Dest $ DestCityName $ DestState $ 
DestStateFips $ DestStateName $ DestWac $ CRSDepTime $ DepTime $ DepDelay DepDelayMinutes DepDel15 DepartureDelayGroups 
DepTimeBlk $ TaxiOut WheelsOff $ WheelsOn $ TaxiIn CRSArrTime $ ArrTime $ ArrDelay ArrDelayMinutes ArrDel15 ArrivalDelayGroups 
ArrTimeBlk $ Cancelled CancellationCode $ Diverted CRSElapsedTime ActualElapsedTime AirTime Flights Distance DistanceGroup 
CarrierDelay WeatherDelay NASDelay SecurityDelay LateAircraftDelay FirstDepTime $ TotalAddGTime LongestAddGTime 
DivAirportLandings DivReachedDest DivActualElapsedTime DivArrDelay DivDistance Div1Airport $ Div1AirportID $ Div1AirportSeqID $ 
Div1WheelsOn $ Div1TotalGTime Div1LongestGTime Div1WheelsOff $ Div1TailNum $ Div2Airport $ Div2AirportID $ Div2AirportSeqID $ 
Div2WheelsOn $ Div2TotalGTime Div2LongestGTime Div2WheelsOff $ Div2TailNum $ Div3Airport $ Div3AirportID $ Div3AirportSeqID $ 
Div3WheelsOn $ Div3TotalGTime Div3LongestGTime Div3WheelsOff $ Div3TailNum $ Div4Airport $ Div4AirportID $ Div4AirportSeqID $ 
Div4WheelsOn $ Div4TotalGTime Div4LongestGTime Div4WheelsOff $ Div4TailNum $ Div5Airport $ Div5AirportID $ Div5AirportSeqID $ 
Div5WheelsOn $ Div5TotalGTime Div5LongestGTime Div5WheelsOff $ Div5TailNum  $ ;

%macro timevars ;
if CRSDepTime="2400" then do ;
	CRSDepTimeF=input("23:59", time5.) ; end ;
		else do ;
			format CRSDepTimeF time5. ;
			CRSDepTimeF=input(substr(CRSDepTime,1,2)||":"||substr(CRSDepTime,3,2), time5.) ; end ;

%mend ;

data Hw2.dataread ;
infile datalines firstobs=1 ;
length fil2read $120;
input fil2read $120.;
datalines;
E:\1. Ms Academics\3. Spring Courses\3. IDS 594 - SaS\Assign 2\On_Time_On_Time_Performance_2015_3.csv
;


data HW2.BTS201503 &droprenamemv. ;
set HW2.dataread ;
infile dummy filevar=fil2read end=done dsd delimiter=',' firstobs=2 obs=max ;
	&lengthmv. ;
do while(not done);
	&inputmv. ;
	%timevars ;
FlightNum_num=input(FlightNum, 4.) ;
output;
end;
run ;



proc sort data=HW2.BTS201503 ;
by Carrier TailNum FlightDate CRSDepTime FlightNum ;
run ;

/* One Period Lag*/
data HW2.BTS_lag_delays_201503 ;
retain DepDelayLag 0 DepDelayLagCum 0 ArrDelayLag ArrDelayLagCum 0 CancelledLag1 0 Carrier TailNum FlightDate DepDelay ArrDelay Cancelled; 
format flightdate yymmdd10. SeqNum DepDelayLagInd DepDelayLag DepDelayLagCum ArrDelayLagInd ArrDelayLag ArrDelayLagCum 4. ;
set HW2.BTS201503 ;
by Carrier TailNum FlightDate ;
if first.FlightDate=1 then do ;
	DepDelayLag=0 ;
	DepDelayLagInd=0 ;
	DepDelayLagCum=0 ;

	ArrDelayLag=0 ;
	ArrDelayLagInd=0 ;
	ArrDelayLagCum=0 ;

	/*DistanceLag1=0 ;
	DistanceLagCum=0 ;*/
	CancelledLag1=0 ;
	SeqNum=1 ;
end ;
else do ;
	SeqNum+1 ;
	/*DistanceLagCum+DistanceLag1 ;*/
	DepDelayLagInd=(DepDelayLag^=0) ;
	DepDelayLagCum+DepDelayLag ;
	ArrDelayLagInd=(ArrDelayLag^=0) ;
	ArrDelayLagCum+ArrDelayLag ;
end ;
output ;
DepDelayLag=DepDelay ;
ArrDelayLag=ArrDelay ;
/*DistanceLag1=Distance ; */
CancelledLag1=Cancelled ;
run ;


proc stdize data=HW2.BTS_lag_delays_201503 reponly missing=0 out=HW2.BTS201503REP ;
var DepDelayLagInd DepDelayLag DepDelayLagCum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ;
run ;

data HW2.BTS_201503;
retain DepDelayClass DepartureDelayGroups ;
format DepDelayClass 4.;
set HW2.BTS201503REP;
if DepartureDelayGroups <= 0 then do;
	DepDelayClass = 0;
end;
else if DepartureDelayGroups in (1,2,3) then do;
	DepDelayClass = 1;
end;
else if DepartureDelayGroups > 3 then do;
	DepDelayClass = 2;
end;
else do;
	DepDelayClass = DepartureDelayGroups;
end;
run;


/* 2 Period Lags */
data HW2.BTS_lag_delays2_201503 ;
retain DepDelayLag2 0 DepDelayLagCum2 0 ArrDelayLag2 ArrDelayLagCum2 0 DepDelayLag DepDelayLagCum ArrDelayLag ArrDelayLagCum  DepDelayLagInd2 ArrDelayLagInd2 SeqNum DepDelay ArrDelay Carrier TailNum FlightDate ;
format flightdate yymmdd10. DepDelayLagInd2 DepDelayLag2 DepDelayLagCum2 ArrDelayLagInd2 ArrDelayLag2 ArrDelayLagCum2 4.;
set HW2.BTS_201503 ;
by Carrier TailNum FlightDate ;
if SeqNum<=2 then do ;
	DepDelayLag2=0 ;
	DepDelayLagInd2=0 ;
	DepDelayLagCum2=0 ;

	ArrDelayLag2=0 ;
	ArrDelayLagInd2=0 ;
	ArrDelayLagCum2=0 ;
	CancelledLag2=0 ;

end ;
else do ;
	DepDelayLagInd2=(DepDelayLag2^=0) ;
	DepDelayLagCum2+DepDelayLag2 ;
	ArrDelayLagInd2=(ArrDelayLag2^=0) ;
	ArrDelayLagCum2+ArrDelayLag2 ;
end ;
output ;
DepDelayLag2=Lag(DepDelay) ;
ArrDelayLag2=Lag(ArrDelay) ;
run ;

*Handling missing values before logistic operation;

proc stdize data=HW2.BTS_lag_delays2_201503 reponly missing=0 out=HW2.BTS201503_Logistic ;
var DepDelayLag2 ArrDelayLag2 CancelledLag1 CRSDepTime ArrDelayLagInd ArrDelayLag ArrDelayLagCum DepDelayClass;
run ;


*2.a. Ensure that the reference level of the DV is its smallest value (0);

proc logistic data=HW2.BTS201503_Logistic ; *descending ;
class DepDelayClass (ref= '0')/param = ref;
model DepDelayClass = 
CRSDepTime
seqnum
ArrDelayLagInd
ArrDelayLag
ArrDelayLagCum
DepDelayLag2
ArrDelayLag2
CancelledLag1/link =logit;
where cancelled=0;
*by carrier;
run ; 
quit ;

filename WIN "E:\1. Ms Academics\3. Spring Courses\3. IDS 594 - SaS\Assign 2\Weather_ord_2015_miss.txt";


*3. Use appropriate SAS data step syntax to read the O'Hare 2015 weather file (Weather_ord_2015_miss.txt) into a SAS dataset. (Variables are Flight Date, Weather Station Name, Daily Precipitation (PRCP), Snow Depth on Ground (SNWD), Daily Snowfall (SNOW), Daily Low Temp (TEMPMIN), and  Daily High Temp (TEMPMAX)).;

DATA HW2.weather_ORD_201503 ;
length flightdate 8. Station_Name $42. PRCP 4. SNWD 4. SNOW 4. TEMPMIN 4. TEMPMAX 4. ;
INFILE WIN dsd delimiter='|' missover firstobs=2 obs=max ;
format flightdate yymmdd10. ;
INPUT flightdate :yymmdd10. Station_Name $ PRCP SNWD SNOW TEMPMIN TEMPMAX ;
RUN;


proc sort data = HW2.weather_ORD_201503;
by flightdate;
run;

proc sort data = HW2.BTS201503_Logistic;
by flightdate;
run;

data HW2.ORD_merge201503;
merge HW2.BTS201503_Logistic HW2.weather_ORD_201503;
by flightdate;
if origin='ORD' ;
run;


proc mi data=HW2.ORD_merge201503 nimpute=12 out=HW2.BTS201503_MI ;
FCS ; 
var SNOW TEMPMIN TEMPMAX  ;
run ;


proc sort data=HW2.BTS201503_MI ;
by _imputation_ ;
run ;


proc logistic data=HW2.BTS201503_MI outest=HW2.BTS201503_MI_ANALYZE COVOUT ;
class DepDelay (ref= '0')/param = ref;
model DepDelay = 
CRSDepTime
seqnum
ArrDelayLagInd
ArrDelayLag
ArrDelayLagCum
DepDelayLag2
ArrDelayLag2
CancelledLag1 
SNOW 
TEMPMIN 
TEMPMAX / link=logit ;
where cancelled=0 and origin='ORD' ;
by _imputation_ ;
ods exclude ResponseProfile;
run ; quit ;

/*proc to evaluate the Multiple Imputation parameter estimates for tempmin, tempmax, and snow.*/
proc mianalyze data=HW2.BTS201503_MI_ANALYZE ;
modeleffects SNOW TEMPMIN TEMPMAX ;
run ;


ods trace off;
ods pdf close;

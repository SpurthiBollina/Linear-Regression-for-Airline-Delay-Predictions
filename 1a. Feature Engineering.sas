Resetline;
dm 'clear log';

title "&sysuserid - HW1";
ods pdf file = "E:\1. Ms Academics\3. Spring Courses\3. IDS 594 - SaS\Assign 1\HW1_Q2_OutPut.pdf";
ods trace on;

filename in201506 "E:\1. Ms Academics\3. Spring Courses\3. IDS 594 - SaS\Assign 1\On_Time_On_Time_Performance_2015_6.csv";

data WORK.BTS201506
(drop = CRSDepTime DepTime CRSArrTime ArrTime FirstDepTime WheelsOff WheelsOn Div1WheelsOn Div1WheelsOff Div2WheelsOn 
Div2WheelsOff Div3WheelsOn Div3WheelsOff Div4WheelsOn Div4WheelsOff Div5WheelsOn Div5WheelsOff 
rename =(CRSDepTimeF=CRSDepTime DepTimeF=DepTime CRSArrTimeF=CRSArrTime ArrTimeF=ArrTime FirstDepTimeF=FirstDepTime 
WheelsOffF=WheelsOff WheelsOnF=WheelsOn Div1WheelsOnF=Div1WheelsOn Div1WheelsOffF=Div1WheelsOff Div2WheelsOnF=Div2WheelsOn 
Div2WheelsOffF=Div2WheelsOff Div3WheelsOnF=Div3WheelsOn Div3WheelsOffF=Div3WheelsOff Div4WheelsOnF=Div4WheelsOn 
Div4WheelsOffF=Div4WheelsOff Div5WheelsOnF=Div5WheelsOn Div5WheelsOffF=Div5WheelsOff) ) ;

infile in201506 dsd delimiter="," dlmstr=',' missover firstobs=2 obs=50 ;

length Year 4. Quarter 4. Month 4. DayofMonth 4. DayOfWeek 4. FlightDate 8. UniqueCarrier $8. AirlineID  $4. 
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

format flightdate yymmdd10. ;

input Year Quarter Month DayofMonth DayOfWeek FlightDate :yymmdd10. UniqueCarrier $ AirlineID $ Carrier $ TailNum $ FlightNum $ 
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

data BTS201506 &droprenamemv. ;
infile in201506 delimiter="," dsd dlmstr=',' missover firstobs=2 obs=550000 ;

&lengthmv. ;
format flightdate yymmdd10. ;
&inputmv. ;

%timevars ;

run ;

proc sort data=BTS201506 ;
by Carrier TailNum FlightDate DepTime;
run ;


data BTS_lag_delays_201506 ;
retain DepDelayLag 0 DepDelayLagCum 0 ArrDelayLag ArrDelayLagCum 0 Carrier TailNum FlightDate DepDelay ArrDelay ;
format flightdate yymmdd10. SeqNum DepDelayLagInd DepDelayLag DepDelayLagCum ArrDelayLagInd ArrDelayLag ArrDelayLagCum 4.;
set BTS201506 ;
by Carrier TailNum FlightDate ;
if first.FlightDate=1 then do ;
	DepDelayLag=0 ;
	DepDelayLagInd=0 ;
	DepDelayLagCum=0 ;

	ArrDelayLag=0 ;
	ArrDelayLagInd=0 ;
	ArrDelayLagCum=0 ;

	SeqNum=1 ;
end ;

else do ;
	SeqNum+1 ;
	DepDelayLagInd=(DepDelayLag^=0) ;
	DepDelayLagCum+DepDelayLag ;
	ArrDelayLagInd=(ArrDelayLag^=0) ;
	ArrDelayLagCum+ArrDelayLag ;
end ;
output ;
DepDelayLag=DepDelay ;
ArrDelayLag=ArrDelay ;
run ;


data BTS_lag_delays2_201506 ;
retain DepDelayLag2 0 DepDelayLagCum2 0 ArrDelayLag2 ArrDelayLagCum2 0 DepDelayLag DepDelayLagCum ArrDelayLag ArrDelayLagCum  DepDelayLagInd2 ArrDelayLagInd2 SeqNum DepDelay ArrDelay Carrier TailNum FlightDate ;
format flightdate yymmdd10. DepDelayLagInd2 DepDelayLag2 DepDelayLagCum2 ArrDelayLagInd2 ArrDelayLag2 ArrDelayLagCum2 4.;
set BTS_lag_delays_201506 ;
by Carrier TailNum FlightDate ;
if SeqNum<=2 then do ;
	DepDelayLag2=0 ;
	DepDelayLagInd2=0 ;
	DepDelayLagCum2=0 ;

	ArrDelayLag2=0 ;
	ArrDelayLagInd2=0 ;
	ArrDelayLagCum2=0 ;
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

proc UNIVARIATE data= BTS_lag_delays2_201506;
var ArrDelay ArrDelayLag ArrDelayLag2;
histogram ArrDelay ArrDelayLag ArrDelayLag2;
histogram ArrDelay ArrDelayLag ArrDelayLag2 / normal lognormal (Theta=est Color=Red); 
RUN;

ods graphics on;
proc corr data=BTS_lag_delays2_201506 nomiss outp=BTSCorr;
   var DepDelay ArrDelay ArrDelayLag ArrDelayLag2;
run;

proc print data = BTSCorr;
run;

/* Handling Missing Data*/

data Bts_missing (keep = CRSDepTime SeqNum DepDelayLagInd DepDelayLag DepDelayLagCum ArrDelayLagInd 
				 ArrDelayLag ArrDelayLagCum DepDelayLag2 ArrDelayLag2 ArrDelay DepDelay) ;
set BTS_lag_delays2_201506;
*array varbl(*) _NUMERIC_ ;
array varbl(*) CRSDepTime SeqNum DepDelayLagInd DepDelayLag DepDelayLagCum ArrDelayLagInd 
				 ArrDelayLag ArrDelayLagCum DepDelayLag2 ArrDelayLag2 ArrDelay DepDelay;
	do i = 1 to dim(varbl) ;
		if varbl(i) = . then do ;
			output ;
			leave ;
		end ;
	end ;
run ;

/*********************************************************************************
Which variables have the most missingness?
*********************************************************************************/
proc means data=Bts_missing n nmiss;
var _numeric_ ;
run ;


/********************************************************************************
Let's also look at the data points that have missing values
********************************************************************************/
data Bts_missing_detail ; * (keep = ArrDelay CRSDepTime seqnum DepDelay DepDelayLagInd DepDelayLag DepDelayLagCum ArrDelayLagInd ArrDelayLag ArrDelayLagCum) ;
set Bts_lag_delays_201506 ;
if ArrDelay = . ;
run ;

proc sort data=Bts_missing_detail ;
by cancelled ;
run ;

/************************************************************************************
Are there non-missing variables strongly associated with missingness?
************************************************************************************/

proc freq data=Bts_missing_detail ;
tables Cancelled ;
output out=BTS_miss_counts ;
run ;




/*OLS Regression Model*/
proc reg data=BTS_lag_delays2_201506 ;
model DepDelay = CRSDepTime SeqNum DepDelayLagInd DepDelayLag DepDelayLagCum ArrDelayLagInd 
				 ArrDelayLag ArrDelayLagCum DepDelayLag2 ArrDelayLag2 /vif;
where cancelled=0;
run ; 
quit ;

/*Logistic Regression*/
data BTS201506_Logistic;
retain DepDelayIND 0;
set BTS_lag_delays2_201506;
by carrier;
if DepDelay >15 then do;
	DepDelayIND =1;
	end;
else do;
	DepDelayIND=0;
	end;
run;

proc logistic data = BTS201506_Logistic ;
model DepDelayIND = CRSDepTime SeqNum DepDelayLagInd DepDelayLag DepDelayLagCum ArrDelayLagInd 
				 ArrDelayLag ArrDelayLagCum DepDelayLag2 ArrDelayLag2;
where cancelled=0;
by carrier;
run ; 
quit ;


ods trace off;
ods pdf close;

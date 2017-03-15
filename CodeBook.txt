
========
Codebook
========


Variable and description for tidy dataset (dt.tidy)
===================================================

-subject: The subject who performed the activity for each window sample. Its range is from 1 to 30.
-activityName: Activity name (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
-featDomain: Time domain signal or frequency domain signal (Freq, Time)
-featInstrument: Measuring instrument (Accelerometer, Gyroscope)
-featAcceleration: Acceleration signal (Body, Gravity)
-featVariable: Variable (Mean, Std)
-featJerk: Jerk signal
-featMagnitude: Magnitude of the signals calculated using the Euclidean norm
-featAxis:  3-axial signals in the X, Y and Z directions (X, Y, or Z) NA, X, Y, Z
-Count: Count of data points used to compute average
-Avg: Average of each variable for each activity and each subject


Data structure
==============

str(dt.tidy)

Classes ‘data.table’ and 'data.frame':	11880 obs. of  11 variables:
 $ subject         : int  1 1 1 1 1 1 1 1 1 1 ...
 $ activityName    : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ featDomain      : chr  "Freq" "Freq" "Freq" "Freq" ...
 $ featInstrument  : chr  "Accelerometer" "Accelerometer" "Accelerometer" "Accelerometer" ...
 $ featAcceleration: chr  "Body" "Body" "Body" "Body" ...
 $ featVariable    : chr  "Mean" "Mean" "Mean" "Mean" ...
 $ featJerk        : chr  NA NA NA NA ...
 $ featMagnitude   : chr  NA NA NA "Magnitude" ...
 $ featAxis        : chr  "X" "Y" "Z" NA ...
 $ count           : int  48 48 48 48 48 48 48 48 48 48 ...
 $ avg             : num  -0.977 -0.98 -0.984 -0.975 -0.986 ...
 - attr(*, "sorted")= chr  "subject" "activityName" "featDomain" "featInstrument" ...
 - attr(*, ".internal.selfref")=<externalptr> 


Sample dataset
==============

rbind(head(dt.tidy),tail(dt.tidy))

      subject     activityName featDomain featInstrument featAcceleration featVariable featJerk featMagnitude featAxis count         avg
1           1           LAYING       Freq  Accelerometer             Body         Mean     <NA>          <NA>        X    48 -0.97672506
2           1           LAYING       Freq  Accelerometer             Body         Mean     <NA>          <NA>        Y    48 -0.97980088
3           1           LAYING       Freq  Accelerometer             Body         Mean     <NA>          <NA>        Z    48 -0.98438098
4           1           LAYING       Freq  Accelerometer             Body         Mean     <NA>     Magnitude     <NA>    48 -0.97511020
5           1           LAYING       Freq  Accelerometer             Body         Mean     Jerk          <NA>        X    48 -0.98581363
6           1           LAYING       Freq  Accelerometer             Body         Mean     Jerk          <NA>        Y    48 -0.98276825
11875      30 WALKING_UPSTAIRS       Time      Gyroscope             <NA>          Std     <NA>          <NA>        Z    47  0.05171554
11876      30 WALKING_UPSTAIRS       Time      Gyroscope             <NA>          Std     <NA>     Magnitude     <NA>    47 -0.42023600
11877      30 WALKING_UPSTAIRS       Time      Gyroscope             <NA>          Std     Jerk          <NA>        X    47 -0.57354184
11878      30 WALKING_UPSTAIRS       Time      Gyroscope             <NA>          Std     Jerk          <NA>        Y    47 -0.60446960
11879      30 WALKING_UPSTAIRS       Time      Gyroscope             <NA>          Std     Jerk          <NA>        Z    47 -0.56414924
11880      30 WALKING_UPSTAIRS       Time      Gyroscope             <NA>          Std     Jerk     Magnitude     <NA>    47 -0.64772342



Variable summary
================

summary(dt.tidy)

    subject                 activityName   featDomain        featInstrument     featAcceleration   featVariable         featJerk         featMagnitude     
 Min.   : 1.0   LAYING            :1980   Length:11880       Length:11880       Length:11880       Length:11880       Length:11880       Length:11880      
 1st Qu.: 8.0   SITTING           :1980   Class :character   Class :character   Class :character   Class :character   Class :character   Class :character  
 Median :15.5   STANDING          :1980   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character  
 Mean   :15.5   WALKING           :1980                                                                                                                    
 3rd Qu.:23.0   WALKING_DOWNSTAIRS:1980                                                                                                                    
 Max.   :30.0   WALKING_UPSTAIRS  :1980                                                                                                                    
   featAxis             count             avg          
 Length:11880       Min.   : 25.00   Min.   :-0.99767  
 Class :character   1st Qu.: 47.00   1st Qu.:-0.96237  
 Mode  :character   Median : 55.00   Median :-0.46564  
                    Mean   : 57.22   Mean   :-0.48671  
                    3rd Qu.: 68.00   3rd Qu.:-0.08376  
                    Max.   :107.00   Max.   : 0.97453 


Feature descritive variables
============================

features.desc

   featNbr                    featName featCode featDomain featInstrument featAcceleration featVariable featJerk featMagnitude featAxis
1        1           tBodyAcc-mean()-X       V1       Time  Accelerometer             Body         Mean     <NA>          <NA>        X
2        2           tBodyAcc-mean()-Y       V2       Time  Accelerometer             Body         Mean     <NA>          <NA>        Y
3        3           tBodyAcc-mean()-Z       V3       Time  Accelerometer             Body         Mean     <NA>          <NA>        Z
4       41        tGravityAcc-mean()-X      V41       Time  Accelerometer          Gravity         Mean     <NA>          <NA>        X
5       42        tGravityAcc-mean()-Y      V42       Time  Accelerometer          Gravity         Mean     <NA>          <NA>        Y
6       43        tGravityAcc-mean()-Z      V43       Time  Accelerometer          Gravity         Mean     <NA>          <NA>        Z
7       81       tBodyAccJerk-mean()-X      V81       Time  Accelerometer             Body         Mean     Jerk          <NA>        X
8       82       tBodyAccJerk-mean()-Y      V82       Time  Accelerometer             Body         Mean     Jerk          <NA>        Y
9       83       tBodyAccJerk-mean()-Z      V83       Time  Accelerometer             Body         Mean     Jerk          <NA>        Z
10     121          tBodyGyro-mean()-X     V121       Time      Gyroscope             <NA>         Mean     <NA>          <NA>        X
11     122          tBodyGyro-mean()-Y     V122       Time      Gyroscope             <NA>         Mean     <NA>          <NA>        Y
12     123          tBodyGyro-mean()-Z     V123       Time      Gyroscope             <NA>         Mean     <NA>          <NA>        Z
13     161      tBodyGyroJerk-mean()-X     V161       Time      Gyroscope             <NA>         Mean     Jerk          <NA>        X
14     162      tBodyGyroJerk-mean()-Y     V162       Time      Gyroscope             <NA>         Mean     Jerk          <NA>        Y
15     163      tBodyGyroJerk-mean()-Z     V163       Time      Gyroscope             <NA>         Mean     Jerk          <NA>        Z
16     201          tBodyAccMag-mean()     V201       Time  Accelerometer             Body         Mean     <NA>     Magnitude     <NA>
17     214       tGravityAccMag-mean()     V214       Time  Accelerometer          Gravity         Mean     <NA>     Magnitude     <NA>
18     227      tBodyAccJerkMag-mean()     V227       Time  Accelerometer             Body         Mean     Jerk     Magnitude     <NA>
19     240         tBodyGyroMag-mean()     V240       Time      Gyroscope             <NA>         Mean     <NA>     Magnitude     <NA>
20     253     tBodyGyroJerkMag-mean()     V253       Time      Gyroscope             <NA>         Mean     Jerk     Magnitude     <NA>
21     266           fBodyAcc-mean()-X     V266       Freq  Accelerometer             Body         Mean     <NA>          <NA>        X
22     267           fBodyAcc-mean()-Y     V267       Freq  Accelerometer             Body         Mean     <NA>          <NA>        Y
23     268           fBodyAcc-mean()-Z     V268       Freq  Accelerometer             Body         Mean     <NA>          <NA>        Z
24     345       fBodyAccJerk-mean()-X     V345       Freq  Accelerometer             Body         Mean     Jerk          <NA>        X
25     346       fBodyAccJerk-mean()-Y     V346       Freq  Accelerometer             Body         Mean     Jerk          <NA>        Y
26     347       fBodyAccJerk-mean()-Z     V347       Freq  Accelerometer             Body         Mean     Jerk          <NA>        Z
27     424          fBodyGyro-mean()-X     V424       Freq      Gyroscope             <NA>         Mean     <NA>          <NA>        X
28     425          fBodyGyro-mean()-Y     V425       Freq      Gyroscope             <NA>         Mean     <NA>          <NA>        Y
29     426          fBodyGyro-mean()-Z     V426       Freq      Gyroscope             <NA>         Mean     <NA>          <NA>        Z
30     503          fBodyAccMag-mean()     V503       Freq  Accelerometer             Body         Mean     <NA>     Magnitude     <NA>
31     516  fBodyBodyAccJerkMag-mean()     V516       Freq  Accelerometer             Body         Mean     Jerk     Magnitude     <NA>
32     529     fBodyBodyGyroMag-mean()     V529       Freq      Gyroscope             <NA>         Mean     <NA>     Magnitude     <NA>
33     542 fBodyBodyGyroJerkMag-mean()     V542       Freq      Gyroscope             <NA>         Mean     Jerk     Magnitude     <NA>
34       4            tBodyAcc-std()-X       V4       Time  Accelerometer             Body          Std     <NA>          <NA>        X
35       5            tBodyAcc-std()-Y       V5       Time  Accelerometer             Body          Std     <NA>          <NA>        Y
36       6            tBodyAcc-std()-Z       V6       Time  Accelerometer             Body          Std     <NA>          <NA>        Z
37      44         tGravityAcc-std()-X      V44       Time  Accelerometer          Gravity          Std     <NA>          <NA>        X
38      45         tGravityAcc-std()-Y      V45       Time  Accelerometer          Gravity          Std     <NA>          <NA>        Y
39      46         tGravityAcc-std()-Z      V46       Time  Accelerometer          Gravity          Std     <NA>          <NA>        Z
40      84        tBodyAccJerk-std()-X      V84       Time  Accelerometer             Body          Std     Jerk          <NA>        X
41      85        tBodyAccJerk-std()-Y      V85       Time  Accelerometer             Body          Std     Jerk          <NA>        Y
42      86        tBodyAccJerk-std()-Z      V86       Time  Accelerometer             Body          Std     Jerk          <NA>        Z
43     124           tBodyGyro-std()-X     V124       Time      Gyroscope             <NA>          Std     <NA>          <NA>        X
44     125           tBodyGyro-std()-Y     V125       Time      Gyroscope             <NA>          Std     <NA>          <NA>        Y
45     126           tBodyGyro-std()-Z     V126       Time      Gyroscope             <NA>          Std     <NA>          <NA>        Z
46     164       tBodyGyroJerk-std()-X     V164       Time      Gyroscope             <NA>          Std     Jerk          <NA>        X
47     165       tBodyGyroJerk-std()-Y     V165       Time      Gyroscope             <NA>          Std     Jerk          <NA>        Y
48     166       tBodyGyroJerk-std()-Z     V166       Time      Gyroscope             <NA>          Std     Jerk          <NA>        Z
49     202           tBodyAccMag-std()     V202       Time  Accelerometer             Body          Std     <NA>     Magnitude     <NA>
50     215        tGravityAccMag-std()     V215       Time  Accelerometer          Gravity          Std     <NA>     Magnitude     <NA>
51     228       tBodyAccJerkMag-std()     V228       Time  Accelerometer             Body          Std     Jerk     Magnitude     <NA>
52     241          tBodyGyroMag-std()     V241       Time      Gyroscope             <NA>          Std     <NA>     Magnitude     <NA>
53     254      tBodyGyroJerkMag-std()     V254       Time      Gyroscope             <NA>          Std     Jerk     Magnitude     <NA>
54     269            fBodyAcc-std()-X     V269       Freq  Accelerometer             Body          Std     <NA>          <NA>        X
55     270            fBodyAcc-std()-Y     V270       Freq  Accelerometer             Body          Std     <NA>          <NA>        Y
56     271            fBodyAcc-std()-Z     V271       Freq  Accelerometer             Body          Std     <NA>          <NA>        Z
57     348        fBodyAccJerk-std()-X     V348       Freq  Accelerometer             Body          Std     Jerk          <NA>        X
58     349        fBodyAccJerk-std()-Y     V349       Freq  Accelerometer             Body          Std     Jerk          <NA>        Y
59     350        fBodyAccJerk-std()-Z     V350       Freq  Accelerometer             Body          Std     Jerk          <NA>        Z
60     427           fBodyGyro-std()-X     V427       Freq      Gyroscope             <NA>          Std     <NA>          <NA>        X
61     428           fBodyGyro-std()-Y     V428       Freq      Gyroscope             <NA>          Std     <NA>          <NA>        Y
62     429           fBodyGyro-std()-Z     V429       Freq      Gyroscope             <NA>          Std     <NA>          <NA>        Z
63     504           fBodyAccMag-std()     V504       Freq  Accelerometer             Body          Std     <NA>     Magnitude     <NA>
64     517   fBodyBodyAccJerkMag-std()     V517       Freq  Accelerometer             Body          Std     Jerk     Magnitude     <NA>
65     530      fBodyBodyGyroMag-std()     V530       Freq      Gyroscope             <NA>          Std     <NA>     Magnitude     <NA>
66     543  fBodyBodyGyroJerkMag-std()     V543       Freq      Gyroscope             <NA>          Std     Jerk     Magnitude     <NA>




rpub: http://rpubs.com/Rajwantmishra/mongolite

Package
=======


    library(tidyverse)
    library(RMySQL)
    library(DBI)
    library(gridExtra)
    library(mongolite)

Read/Write
==========

Read Data from MySQL
--------------------

``` r
# install.packages("RMySQL")

 con2 <- dbConnect(RMySQL::MySQL(), dbname = "flights", host="localhost", user="root",password= "")
 

dbListTables(con2)
```

    ## [1] "airlines"      "airports"      "flights"       "movies_master"
    ## [5] "movies_review" "planes"        "weather"

``` r
 # Database Operation 
con2 <- dbConnect(RMySQL::MySQL(), dbname = "flights", host="localhost", user="root",password= "")
query <- "SELECT * FROM movies_review"

tab1 <- dbSendQuery(con2,query)
suppressWarnings(rm(movies_review ))
movies_review <- dbFetch(tab1)

query <- "SELECT * FROM movies_master"

tab1 <- dbSendQuery(con2,query)
movies_master <- dbFetch(tab1)

movies_master
```

    ##   ID             Movie_Name Year
    ## 1  1          Bad Samaritan 2018
    ## 2  2 Avengers: Infinity War 2018
    ## 3  3                Rampage 2018
    ## 4  4          Truth or Dare 2018
    ## 5  5          Incredibles 2 2018
    ## 6  6         A Star Is Born 2018

``` r
movies_review
```

    ##      ID Movie_ID               User_Name Rating
    ## 1     1        1              TheTopDawg      8
    ## 2     2        1                 krice23      8
    ## 3     3        1        celestinoavilajr      8
    ## 4     4        1            dave-mcclain      8
    ## 5     5        1              neener3707      7
    ## 6     6        1        claudio_carvalho      8
    ## 7     7        1          george.schmidt      7
    ## 8     8        1          patrickc-76383      7
    ## 9     9        1       Stars-and-popcorn      6
    ## 10   10        1              pinemaples      8
    ## 11   11        1                 rgkarim      7
    ## 12   12        1             vhinzajhltb      9
    ## 13   13        1              natcalgary      7
    ## 14   14        1            ThomasDrufke      7
    ## 15   15        1                bdwyphil     10
    ## 16   16        1                 terry_z     10
    ## 17   17        1               IntoAvoid      4
    ## 18   18        1        cmharelson-62160      6
    ## 19   19        1            stevendbeard      7
    ## 20   20        1        spilledinkcinema      7
    ## 21   21        1     godsgirlfrombluford      9
    ## 22   22        1            Platypuschow      7
    ## 23   23        1  mind_killaz-256-895248      8
    ## 24   24        1                  Neymar      9
    ## 25   25        1                maruugaa      9
    ## 26   26        2         shawneofthedead     10
    ## 27   27        2                garethvk     10
    ## 28   28        2            kjames-26542     10
    ## 29   29        2           kevintgeisler      9
    ## 30   30        2          blparker-31738     10
    ## 31   31        2                   mto10     10
    ## 32   32        2          milleniumlogan      6
    ## 33   33        2                 BiiivAL      9
    ## 34   34        2                 pjgs200      7
    ## 35   35        2           oliverdimitri     10
    ## 36   36        2           eden-rabatsch      9
    ## 37   37        2     hawkins_saints_rock     10
    ## 38   38        2          upashnafuentes      9
    ## 39   39        2                 kuaci89     10
    ## 40   40        2             pranayjalvi      9
    ## 41   41        2              hotjanuary      7
    ## 42   42        2            robert-85923      4
    ## 43   43        2                idaustin      2
    ## 44   44        2                   Lursa      4
    ## 45   45        2              TheBigSick      2
    ## 46   46        2             rowpotdroid      1
    ## 47   47        2             dinhphuccdt      1
    ## 48   48        2            holgerscholl      1
    ## 49   49        2               derriivve     10
    ## 50   50        3              rupert-ian      7
    ## 51   51        3             jackgdemoss      7
    ## 52   52        3     facebook-923-997082      6
    ## 53   53        3        claudio_carvalho      6
    ## 54   54        3              TheTopDawg      8
    ## 55   55        3              Stig-12345      8
    ## 56   56        3              Scottizzle     10
    ## 57   57        3            TheTruthDoor     10
    ## 58   58        3               axlem2000      9
    ## 59   59        3      hasanbolkiah-91427      5
    ## 60   60        3               Blitz_Kid      4
    ## 61   61        3           mitchellbieds      9
    ## 62   62        3            siriusly1986      1
    ## 63   63        3                cruise01      9
    ## 64   64        3           Takethispunch     10
    ## 65   65        3        donkeykong-66104     10
    ## 66   66        3     danwatson_danwatson      9
    ## 67   67        3          inkthestreetac     10
    ## 68   68        3      Figgy66-915-598470     10
    ## 69   69        3   gabrielmorenocorredor     10
    ## 70   70        3               casmowill     10
    ## 71   71        3           kyairaburnett      1
    ## 72   72        3                  GOWBTW      9
    ## 73   73        3             pchin230371      9
    ## 74   74        3               seven-mod     10
    ## 75   75        4         treebeard-44735      6
    ## 76   76        4     jwwalrath-227-85487      7
    ## 77   77        4                 davkell      6
    ## 78   78        4                  asfurd      7
    ## 79   79        4           Jared_Andrews      2
    ## 80   80        4        claudio_carvalho      3
    ## 81   81        4                 kdero34      3
    ## 82   82        4               prayoften      8
    ## 83   83        4             channy_0130      6
    ## 84   84        4     sashachambers-03252      8
    ## 85   85        4         Sci-FiHorrorFan      7
    ## 86   86        4              neener3707      3
    ## 87   87        4               mawhinney      6
    ## 88   88        4             jameszxcvbn      2
    ## 89   89        4        justinwfirestone      4
    ## 90   90        4              martitah_1      2
    ## 91   91        4           vacantskies00      5
    ## 92   92        4              cjlove2523      2
    ## 93   93        4         matt_hall-18443      3
    ## 94   94        4         michaelrthomson      1
    ## 95   95        4                Java_Joe      1
    ## 96   96        4           SmashandNasty      3
    ## 97   97        4           stangpt-72073      7
    ## 98   98        4          Sleepin_Dragon      7
    ## 99   99        4               twmichael      1
    ## 100 100        5         NarniaIsAwesome      7
    ## 101 101        5                 Ajk2386      6
    ## 102 102        5                bornhard      8
    ## 103 103        5          randomStuff101      4
    ## 104 104        5             vengeance20      8
    ## 105 105        5              kressckerl      8
    ## 106 106        5         robertolavratti      2
    ## 107 107        5         jonathanc-20759      8
    ## 108 108        5            domdom-63818      1
    ## 109 109        5          ModishPictures      7
    ## 110 110        5            davispittman      8
    ## 111 111        5              travcycles      2
    ## 112 112        5               IsabelM11      1
    ## 113 113        5             admin-16582      2
    ## 114 114        5        andy_stone-18588      2
    ## 115 115        5            curiousmolar      3
    ## 116 116        5       ladawnclarepanton      2
    ## 117 117        5            mlpfim-17525      8
    ## 118 118        5            alexandrreis      1
    ## 119 119        5              sfgebel315      8
    ## 120 120        5        dezriknightangel      2
    ## 121 121        5                donumdei      6
    ## 122 122        5                 chcsola      2
    ## 123 123        5                tk-76190      3
    ## 124 124        5              corpse_man      2
    ## 125 125        6         silvaback-13517     10
    ## 126 126        6   ventourisspyros-68672     10
    ## 127 127        6            nancyldraper      7
    ## 128 128        6       johngiovannicorda      8
    ## 129 129        6      superdupersentinel      6
    ## 130 130        6    michaeljohnson-27597      9
    ## 131 131        6       mikeschmidt-75136      4
    ## 132 132        6                   nkbtw     10
    ## 133 133        6            Ed-Shullivan      4
    ## 134 134        6          charlesponchon      5
    ## 135 135        6            martimusross      4
    ## 136 136        6           mrsdoyle_2005      4
    ## 137 137        6                   rquku      1
    ## 138 138        6         Harrymiller1215      8
    ## 139 139        6          themadmovieman      7
    ## 140 140        6            athens-24109     10
    ## 141 141        6 peter-nichta-564-860549      2
    ## 142 142        6            josh_henry80      1
    ## 143 143        6             mitchelllim     10
    ## 144 144        6             sissyneck23      2
    ## 145 145        6       bob-the-movie-man      4
    ## 146 146        6              lorriejinx      1
    ## 147 147        6                plargreg      1
    ## 148 148        6              luke-solly      1
    ## 149 149        6                viraltux      4
    ##                                             Title
    ## 1                           Better than expected!
    ## 2                                           Sold!
    ## 3                                   Entertaining!
    ## 4                     an expectedly good thriller
    ## 5   Done Before, But Not Too Bad, A Little Extra 
    ## 6                     Surprisingly Great Thriller
    ## 7   Decent suspense thriller with one box of craz
    ## 8                                     Impressive!
    ## 9                 Bad Samaritan Plays it too Safe
    ## 10                          An unexpected thrill.
    ## 11         A Samaritan to the Crime Drama Formula
    ## 12    Had to sign up to make a Rating and Review!
    ## 13                            A pleasant surprise
    ## 14                                  Great B-Movie
    ## 15                                           WOW!
    ## 16                            LOVED this movie!!!
    ## 17     Hoping for a sleeper thriller? Abandon it.
    ## 18  An enjoyable and competently performed suspen
    ## 19                           Nice little Thriller
    ## 20                      Great Acting, So-So Story
    ## 21  Edge of your seat romp that keeps the viewer 
    ## 22                     Bad Samaritan Not half bad
    ## 23                    Pretty good - worth a watch
    ## 24  Bad Samaritan, somebody bad, doing a good her
    ## 25                                 I enjoyed this
    ## 26  This movie will blow your mind and break your
    ## 27  A Summer Film That IS Even Better Than The Hy
    ## 28  Unlike anything ever done in the history of c
    ## 29                                 Excellent Film
    ## 30  The amount of people that dont understand the
    ## 31      Epic conclusion to Marvels first 10 years
    ## 32                          Overrated and bloated
    ## 33                      Again a fight, but bigger
    ## 34   An objective review of Avengers Infinity War
    ## 35                THE BEST SUPERHERO MOVIE EVER!!
    ## 36  Great popcorn film, surprises the series with
    ## 37                Everything we couldve hoped for
    ## 38                             I need a Therapist
    ## 39                          ABOVE MY EXPECTATION.
    ## 40  Infinity War deserved to be the best and gran
    ## 41  Marvel needs to keep their characters true an
    ## 42       Too much and not enough at the same time
    ## 43         CGI drivel disguised as something epic
 
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Content
    ## 1                                                                                                                                                                                                                                                                                                                                                                                              For a B-grade film, this was surprisingly better than I expected. The acting was great by all cast members, the directing was on point, the writing was actually pretty good - without many plot issues one would normally expect, the cinematography perfect, the pacing was great, especially for the 107 min length, and the editing not too bad except for the flashbacks. My only critique was the terrible score, especially towards the last act. Had the score been more professional and consistent through out, the suspense would have been stellar instead of adequate. Overall an impressive film. A well deserved 8/10 from me.
    ## 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Original script. Believable cast. They make it work easily & all in all it looks like what a thriller should look like! For once Im not grumbling in disappointment over lack of continuity or missed opportunities.Several layers thick with multidimensional characters that behave unexpectantly individual and unique instead of plotted. A pleasant surprise, indeed.Perhaps I should have rated it a 9!?
    ## 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Good movie! Great plot! Edge of your seat twist and turns! Picture and acting 

Move to Mongo
-------------

We are creating two colelction for this data, one for Movie and
Movei\_Review

### Upload

``` r
# Using plain-text
URI = sprintf("mongodb+srv://%s:%s@%s/", USER, PASS, HOST)
OpenCon<- mongo(url = URI)

#Deault is Test colelction 
OpenCon
```

    ## <Mongo collection> 'test' 
    ##  $aggregate(pipeline = "{}", options = "{\"allowDiskUse\":true}", handler = NULL, pagesize = 1000, iterate = FALSE) 
    ##  $count(query = "{}") 
    ##  $disconnect(gc = TRUE) 
    ##  $distinct(key, query = "{}") 
    ##  $drop() 
    ##  $export(con = stdout(), bson = FALSE, query = "{}", fields = "{}", sort = "{\"_id\":1}") 
    ##  $find(query = "{}", fields = "{\"_id\":0}", sort = "{}", skip = 0, limit = 0, handler = NULL, pagesize = 1000) 
    ##  $import(con, bson = FALSE) 
    ##  $index(add = NULL, remove = NULL) 
    ##  $info() 
    ##  $insert(data, pagesize = 1000, stop_on_error = TRUE, ...) 
    ##  $iterate(query = "{}", fields = "{\"_id\":0}", sort = "{}", skip = 0, limit = 0) 
    ##  $mapreduce(map, reduce, query = "{}", sort = "{}", limit = 0, out = NULL, scope = NULL) 
    ##  $remove(query, just_one = FALSE) 
    ##  $rename(name, db = NULL) 
    ##  $replace(query, update = "{}", upsert = FALSE) 
    ##  $run(command = "{\"ping\": 1}", simplify = TRUE) 
    ##  $update(query, update = "{\"$set\":{}}", filters = NULL, upsert = FALSE, multiple = FALSE)

``` r
# Lets create new colection MOvie

CON_movie <- mongo("movie", db = "MSDS_Review",url=URI)


#Check what is in collection Movie
# empty the colelction
CON_movie$drop()         #Refresh the collection
CON_movie$count()        # COunt collection
```

    ## [1] 0

``` r
CON_movie$insert(movies_master)
```

    ## List of 5
    ##  $ nInserted  : num 6
    ##  $ nMatched   : num 0
    ##  $ nRemoved   : num 0
    ##  $ nUpserted  : num 0
    ##  $ writeErrors: list()

``` r
CON_movie$count()        # COunt collection
```

    ## [1] 6

``` r
CON_movie$disconnect()
CON_movie$count()
```

    ## Connection lost. Trying to reconnect with mongo...

    ## [1] 6

``` r
# Lets create new colection MOvieR for Movie Reviews

CON_movieR <- mongo("movie_review", db = "MSDS_Review",url=URI)
CON_movieR$drop()      #Refresh the collection
CON_movieR$count()     # COunt collection
```

    ## [1] 0

``` r
CON_movieR$insert(movies_review)
```

    ## List of 5
    ##  $ nInserted  : num 149
    ##  $ nMatched   : num 0
    ##  $ nRemoved   : num 0
    ##  $ nUpserted  : num 0
    ##  $ writeErrors: list()

``` r
CON_movieR$count()     # COunt collection
```

    ## [1] 149

### Query on Data

-   count
-   Find
-   Create Index

``` r
#View connection
CON_movie
```

    ## <Mongo collection> 'movie' 
    ##  $aggregate(pipeline = "{}", options = "{\"allowDiskUse\":true}", handler = NULL, pagesize = 1000, iterate = FALSE) 
    ##  $count(query = "{}") 
    ##  $disconnect(gc = TRUE) 
    ##  $distinct(key, query = "{}") 
    ##  $drop() 
    ##  $export(con = stdout(), bson = FALSE, query = "{}", fields = "{}", sort = "{\"_id\":1}") 
    ##  $find(query = "{}", fields = "{\"_id\":0}", sort = "{}", skip = 0, limit = 0, handler = NULL, pagesize = 1000) 
    ##  $import(con, bson = FALSE) 
    ##  $index(add = NULL, remove = NULL) 
    ##  $info() 
    ##  $insert(data, pagesize = 1000, stop_on_error = TRUE, ...) 
    ##  $iterate(query = "{}", fields = "{\"_id\":0}", sort = "{}", skip = 0, limit = 0) 
    ##  $mapreduce(map, reduce, query = "{}", sort = "{}", limit = 0, out = NULL, scope = NULL) 
    ##  $remove(query, just_one = FALSE) 
    ##  $rename(name, db = NULL) 
    ##  $replace(query, update = "{}", upsert = FALSE) 
    ##  $run(command = "{\"ping\": 1}", simplify = TRUE) 
    ##  $update(query, update = "{\"$set\":{}}", filters = NULL, upsert = FALSE, multiple = FALSE)

``` r
CON_movieR
```

    ## <Mongo collection> 'movie_review' 
    ##  $aggregate(pipeline = "{}", options = "{\"allowDiskUse\":true}", handler = NULL, pagesize = 1000, iterate = FALSE) 
    ##  $count(query = "{}") 
    ##  $disconnect(gc = TRUE) 
    ##  $distinct(key, query = "{}") 
    ##  $drop() 
    ##  $export(con = stdout(), bson = FALSE, query = "{}", fields = "{}", sort = "{\"_id\":1}") 
    ##  $find(query = "{}", fields = "{\"_id\":0}", sort = "{}", skip = 0, limit = 0, handler = NULL, pagesize = 1000) 
    ##  $import(con, bson = FALSE) 
    ##  $index(add = NULL, remove = NULL) 
    ##  $info() 
    ##  $insert(data, pagesize = 1000, stop_on_error = TRUE, ...) 
    ##  $iterate(query = "{}", fields = "{\"_id\":0}", sort = "{}", skip = 0, limit = 0) 
    ##  $mapreduce(map, reduce, query = "{}", sort = "{}", limit = 0, out = NULL, scope = NULL) 
    ##  $remove(query, just_one = FALSE) 
    ##  $rename(name, db = NULL) 
    ##  $replace(query, update = "{}", upsert = FALSE) 
    ##  $run(command = "{\"ping\": 1}", simplify = TRUE) 
    ##  $update(query, update = "{\"$set\":{}}", filters = NULL, upsert = FALSE, multiple = FALSE)

``` r
#Validation if data was moved successfuly to Mongo DB
ifelse(CON_movie$count()==nrow(movies_master),"movies_master All Data in Mongo","Something is not in Mongo")
```

    ## [1] "movies_master All Data in Mongo"

``` r
ifelse(CON_movieR$count()==nrow(movies_review),"movies_review All Data in Mongo","Something is not in Mongo")
```

    ## [1] "movies_review All Data in Mongo"

``` r
# Quick Way
CON_movieR$count()==nrow(movies_master)
```

    ## [1] FALSE

``` r
#The empty query {} means: select all data. 
# Get all records
CON_movieR$count('{}')
```

    ## [1] 149

``` r
## Read all the data back into R
CON_movieR$find()
```

    ##      ID Movie_ID               User_Name Rating
    ## 1     1        1              TheTopDawg      8
    ## 2     2        1                 krice23      8
    ## 3     3        1        celestinoavilajr      8
    ## 4     4        1            dave-mcclain      8
    ## 5     5        1              neener3707      7
    ## 6     6        1        claudio_carvalho      8
    ## 7     7        1          george.schmidt      7
    ## 8     8        1          patrickc-76383      7
    ## 9     9        1       Stars-and-popcorn      6
    ## 10   10        1              pinemaples      8
    ## 11   11        1                 rgkarim      7
    ## 12   12        1             vhinzajhltb      9
    ## 13   13        1              natcalgary      7

    ## 149 149        6                viraltux      4

    ##                                             Title
    ## 1                           Better than expected!
    ## 2                                           Sold!
    ## 3                                   Entertaining!
    ## 4                     an expectedly good thriller
    ## 5   Done Before, But Not Too Bad, A Little Extra 
    ## 6                     Surprisingly Great Thriller
    ## 7   Decent suspense thriller with one box of craz
    ## 8                                     Impressive!
    ## 9                 Bad Samaritan Plays it too Safe
    ## 10                          An unexpected thrill.
    ## 11         A Samaritan to the Crime Drama Formula
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Content
    ## 1                                                                                                                                                                                                                                                                                                                                                                                              For a B-grade film, this was surprisingly better than I expected. The acting was great by all cast members, the directing was on point, the writing was actually pretty good - without many plot issues one would normally expect, the cinematography perfect, the pacing was great, especially for the 107 min length, and the editing not too bad except for the flashbacks. My only critique was the terrible score, especially towards the last act. Had the score been more professional and consistent through out, the suspense would have been stellar instead of adequate. Overall an impressive film. A well deserved 8/10 from me.
    ## 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Original script. Believable cast. They make it work easily & all in all it looks like what a thriller should look like! For once Im not grumbling in disappointment over lack of continuity or missed opportunities.Several layers thick with multidimensional characters that behave unexpectantly individual and unique instead of plotted. A pleasant surprise, indeed.Perhaps I should have rated it a 9!?
    ## 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Good movie! Great plot! Edge of your seat twist and turns! Picture and acting qualities are excellent!.... If theirs anyone looking for good reviews and not sure of watching. Pay no mind to the bad reviews. If you like crime thrillers.. this is a good one!
    ## 4   "Bad Samaritan" R, 151 is a thriller directed by actor-turned-producer Dean Devlin "Geostorm", written by Brandon Boyce "Wicker Park" and starring television actor and erstwhile Dr. Who David Tennant. Theres a bit of horror in here too, but this film is primarily an intricately plotted thrill ride.The title character is named Sean Falco Irish actor Robert Sheehan, a young man whose step-father brought him and his mother to the U.S. because of a job opportunity for which Sean resents him. Sean is an aspiring photographer with a beautiful and intelligent college girlfriend named Riley Jacqueline Byers who knows nothing of Seans real passion - stealing. Sean and his best friend, De
    ## 149                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Unfortunately we dont have a reliable way to tell the true ratings of a movie.If it wasnt for the ridiculously overblown ratings I wouldnt mind, perhaps I would have watched it anyway because I like Bradley Cooper, but being lured into watching this thing expecting a 8-9 star movie... not cool. This is a movie just for Lady Gaga hardcore fans, anybody else expect a every average product.

``` r
CON_movieR$find('{}')
```

    ##      ID Movie_ID               User_Name Rating
    ## 1     1        1              TheTopDawg      8
    ## 2     2        1                 krice23      8
    ## 3     3        1        celestinoavilajr      8
    ## 4     4        1            dave-mcclain      8
    ## 5     5        1              neener3707      7
    ## 6     6        1        claudio_carvalho      8
    ## 7     7        1          george.schmidt      7
    ## 8     8        1          patrickc-76383      7
    ## 9     9        1       Stars-and-popcorn      6
    ## 10   10        1              pinemaples      8
    ## 11   11        1                 rgkarim      7
    ## 12   12        1             vhinzajhltb      9
    ## 13   13        1              natcalgary      7
    ## 14   14        1            ThomasDrufke      7
    ## 15   15        1                bdwyphil     10
    ## 16   16        1                 terry_z     10
    ## 17   17        1               IntoAvoid      4
 
    ## 10                                                                                                                                                                                                                                                                                                                                                                                                                                                   I didnt expect much of a movie with a name like Bad Samaritan, I didnt expect to find something to enjoy about it besides David Tennant playing the villain, and I certainly didnt expect to find a great movie. The only real complaint I have is that the bad guys backstory was dumb, and honestly would have been better off unexplained. I havent seen a movie this consistently intense since The Infiltrator came out two years ago. I was especially impressed with the continuity and attention to detail, and MY GOSH can David Tennant pull off a fantastic American accent.
    ## 11  With the success of the Avengers last weekend, it is hard for other movies to try and take follow such an impressive record. Still, another week comes with movies that are going to try and fight for their place in the silver screen. My first movie of the week is the latest Horror/Thriller to try and keep you on edge. Robbie K here with another round of writing to help you guys with your movie choices. Sit back and read on as I review Movie Bad Samaritan Director Dean DevlinWriter Brandon Boyce screenplay Stars Kerry Condon, David Tennant, Robert Sheehan LIKESDecent Pacing If youve read my work, you know I like movies that movie, which Bad Samaritan does. Ill admit it takes a while to lift off in an attempt to set the stage, but as the robbery goes bad and the thrills start, things start to pick up. From then on, it seems to move, only hitting rough patches of diverging slowness for small amounts before looping back to the story. Acting Another plus here, the cast has quite an art to he
    ## 12                                                                                                                                                                                                                 This movie was unexpectedly amazed me. It just completes my day. Im watching like you cant get off the screen not to miss any scenes cuz you dont know what will happens next. This was been one of the best thriller movie I have seen realizing how good the camera and background sounds was all set up in accordingly. Also plus points for the casts they really gave justice to their own role. One thing Im lacking in this movie is how it ends that Ive just thought it will show the FBI finding out all the burried dead bodies at the backyard then it will be aired on the news and soon Seans gf and his family will finally understand what he had gone through in his situation, thats it.Thumbs up and hi5 for the director and producers of this movie. Hoping for more upcoming movie genre like this.
    ## 13                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       I didnt expect much from this but I was deff, impressed. The acting was very good, and the plot well thought out. There were a few parts that were a bit unbelievable, but for the most part it actually seemed like something that could happen for real which made it that much more chilling.7.3
    ## 14                                                                                                                                                                                            Bad Samaritan is a film that I simply did not know was even being released until I 
``` r
## To query all rows where User_Name == "TheTopDawg" AND Rating > 5 



CON_movieR$find('{"User_Name" : "TheTopDawg" ,"Rating":{"$gt":5}}')
```

    ##   ID Movie_ID  User_Name Rating
    ## 1  1        1 TheTopDawg      8
    ## 2 54        3 TheTopDawg      8
    ##                                           Title
    ## 1                         Better than expected!
    ## 2 Appreciate this film for what it is fun, mind
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Content
    ## 1 For a B-grade film, this was surprisingly better than I expected. The acting was great by all cast members, the directing was on point, the writing was actually pretty good - without many plot issues one would normally expect, the cinematography perfect, the pacing was great, especially for the 107 min length, and the editing not too bad except for the flashbacks. My only critique was the terrible score, especially towards the last act. Had the score been more professional and consistent through out, the suspense would have been stellar instead of adequate. Overall an impressive film. A well deserved 8/10 from me.
    ## 2                                                                        Appreciate this film for what it is fun, mindless, action-filled entertainment. No need to dissect, analyse or compare this. My only few complaints are that the writing was too loose and should have been edited down by 15-20 mins to keep the pace more elevated throughout. Also, not a fan of the Energyne CEO sister and brother characters - they were way too cheesy and annoying and cheapened the film. All other actors were cast and performed great, and Dwayne entertained as always. The SFX/VFX were also great. A fun and well deserved 8/10 from me

``` r
#Read rating for Movie_ID = 1 and rating less than 5

subsetRevie  <- CON_movieR$find('{"Movie_ID" : 1 ,"Rating":{"$lt":5}}')

subsetRevie
```

    ##   ID Movie_ID User_Name Rating                                      Title
    ## 1 17        1 IntoAvoid      4 Hoping for a sleeper thriller? Abandon it.
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Content
    ## 1 Two young men hit upon the idea of using their valet jobs to rob homes. When the owners go in, one valet drives to their house using information stored on the vehicle to lead them straight to the next target. The more reluctant of the two decides to take one such patsys Maserati after the owner rags on both hoodlums with a boorish attitude. Inside the house, a woman is found tied-up, not in a kinky way. Also a roomful of cutlery is discovered.As the dinner was cut short, the car is returned before the woman can be rescued by our good-hearted thief. A phone call is made to the Police, but Mr. Evil is one step ahead, and the home isnt even searched.The lad fesses up to his crime of trespassing to get the Police more involved in a house search; again nothing awry and the kids dismissed with a warning. But not before a suspicious L.E.O. begins to wonder about missing women and this coincidental story of home break-ins.So goes "Bad Samaritan" a tale of a trust fund man who gets his jollies

``` r
#Using In , find all the movie rating for 1 and 2 where rating is less than 5  
subsetRevie12  <- CON_movieR$find('{"Movie_ID" :{"$in":[1,2]} ,"Rating":{"$lt":5}}')

subsetRevie12
```

    ##   ID Movie_ID    User_Name Rating
    ## 1 17        1    IntoAvoid      4
    ## 2 42        2 robert-85923      4
    ## 3 43        2     idaustin      2
    ## 4 44        2        Lursa      4
    ## 5 45        2   TheBigSick      2
    ## 6 46        2  rowpotdroid      1
    ## 7 47        2  dinhphuccdt      1
    ## 8 48        2 holgerscholl      1
    ##                                           Title
    ## 1    Hoping for a sleeper thriller? Abandon it.
    ## 2      Too much and not enough at the same time
    ## 3        CGI drivel disguised as something epic
    ## 4 Plot Holes, Jumbled Action Sequences, & A Big
    ## 5                  A tedious and dependent film
    ## 6                         Please stop the Hype!
    ## 7              Sorry marvel fans, this is trash
    ## 8                          Utterly disappointed
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Content
    ## 1 Two young men hit upon the idea of using their valet jobs to rob homes. When the owners go in, one valet drives to their house using information stored on the vehicle to lead them straight to the next target. The more reluctant of the two decides to take one such patsys Maserati after the owner rags on both hoodlums with a boorish attitude. Inside the house, a woman is found tied-up, not in a kinky way. Also a roomful of cutlery is discovered.As the dinner was cut short, the car is returned before the woman can be rescued by our good-hearted thief. A phone call is made to the Police, but Mr. Evil is one step ahead, and the home isnt even searched.The lad fesses up to his crime of trespassing to get the Police more involved in a house search; again nothing awry and the kids dismissed with a warning. But not before a suspicious L.E.O. begins to wonder about missing women and this coincidental story of home break-ins.So goes "Bad Samaritan" a tale of a trust fund man who gets his jollies 
    ## 2                                                                                                                                                                                                                     Im probably going against the general reception for this film but for me this film was just too much and not enough at the same time. Marvel fans will probably disagree with me. There is a star studded cast and clearly a lot of money has been spent to make this film a real spectacular.However, for me there were too many obvious special effects, too many leading characters and far far far too much action. It just keeps coming at you relentlessly. At the same time theres not enough real story and characterisation, not enough time to take in whats going on and definitely not enough warmth or comedy which is the hallmark of many Marvel films Ive seen before. I just wanted it to end but it kept dragging on for yet another battle... When it finally did end I felt cheated of the time.
    ## 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                         In order to explain current mass appeal, I have to quote Senator Gracchus in Gladiator "Rome is the mob. Conjure magic for them and theyll be distracted."And thats what this is, conjured magic meant to distract the masses, and by gosh, thats what its done. No real plot. Overlapping storylines that go nowhere, computer animated trash, and thats the point. Give the masses what they want, come up with the formula, spend $350 to develop, and presto, $2b in receipts from the mob, who cant distinguish between art and trash. Wash, rinse, repeat.
    ## 4 SPOILER ALERT!!I am a Marvel Chick. I totally dig the whole Marvel Verse and wave my fangirl flag proudly. I was looking forward to this movie so much...then something happened. I went to see it today. I did not read any of the reviews before I went. I never do. I always view a film without input from folk that usually dont know what I like. So there I was, popcorn and coke in hand. Two rows back from the screen cause Im into total immersion, okay in my reclining seat. Ten minutes in and I know were in trouble. Its not the fact that two of my favorite characters didnt survive the opening credits. This is Infinity War, right? People are gonna die. Its just seemed so pointless. Loki dies but Thor survives? How is that fair? Hemdall dies saving Hulk of all people?? Not that Im hatin on Hulk...but come on, Hemdall! You have sworn an oath to the Thone of Asgard and you dont save EITHER of the princes? Really?? I know Hulk is refusing to come out after Thanos kicks his butt that no one ever 
    ## 5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              SPOILER The plot is simple that the supervillian succeeds, but Russo brothers waste too much time on piling up the superheroes. The film is just too long, and you keep looking at the watch to see when it will end. There are too many characters, and if you did not view the previous Marvel films, you would hardly get any sense of who they are. It is an OK film for Marvel fans, but chaos for a general audience.
    ## 6                        Suffering hype fatigue, over a year of industry talk about this movie in pre release. It takes away from viewing the movie. In the end its just more of the same computer generated over the top smash and bash that appeals to 12 year olds or those that are stuck at that age. The first avengers was original. But now what Hollywood movie makers due best, take an original movie concept to cash in until death in franchising occurs. Sorry about raining on your Hollywood comic book Heroes block borer. But the only hero I can see is someone to say enough comic book sequels. Theyve become boring and predictable recycles. I spent more time thinking about how uncomfortable the theater seat was than being interested in the things blowing up in the movie. Seems Hollywood is addicted to CGI for making movies that shouldnt be made. If they keep going this way they could probably try selling a film of things just blowing up, no story, plot or actors acting just things blowing up.
    ## 7 Another avengers movie, another crappy one. It is extremely overrated, overhyped, disappointed. The middle of the movie is slow and no intensity at all. The final battles are just tasteless, emotionless. I dont know why people cry or sad for this kind of ending. It is just tasteless. Honestly if Ironman died by being stabbed by Thanos, that would be emotional, because he fought hard and would die a real hero. But he didnt die, and the ending scene, dozens of heroes die one by one, like a natural death, I dont even think that they died fighting, and its too fast to be emotional. Its obvious that they will be revived in the next movie, why would I cry?. I felt the ending scene was just trying to get some tears from audience and set up for second part, which will definitely steal tons of money from marvels fan again.LASTLY, the motivation of Thanos to acquire 6 stones is the dumbest thing I have ever heard, even worst than my politicians. How killing half population of the universe solve 
    ## 8 So, this was it, the culmination of a decade of Marvel movies preparing and leading up to this final showdown? Well, I could not be more disappointed.Here is whyYes, the film brings together many different story lines. But it does so in pretty predictable ways. A few mildly funny scenes when the heroes of different movies meet for the first time. But thats it. Thats about the only good thing I can say about the story.Yes, CGI and FX are top notch. But as the story is pretty simple in itself until the end, thats not saving the day.The story in deed is very lame and to a large extend either predictable or stupid. There are quite some inconsistencies such as humans breathing on Titan, Thor talking in space and such. Not the ingredients of a fantastic climax movie.A few examples Spoilers!!!Thanos kills almost all Asgardians, but Thor. Thor proves he can survive and even talk in outer space, survive the fire of a star. Wow, really? Lame.Thanos is so powerful, you wonder why he hasnt collect

``` r
# using Qury and Fields 
MR_Query_Fields <- CON_movieR$find(
  query = '{"Movie_ID" : 1 , "Rating" : {"$gt":5 }}', 
  fields = '{"ID" : true, "Rating" : true,"User_Name" : true,"Movie_ID":true}',
  limit = 5
)
print(MR_Query_Fields)
```

    ##                        _id ID Movie_ID        User_Name Rating
    ## 1 5cbd2903364ca62e000044b8  1        1       TheTopDawg      8
    ## 2 5cbd2903364ca62e000044b9  2        1          krice23      8
    ## 3 5cbd2903364ca62e000044ba  3        1 celestinoavilajr      8
    ## 4 5cbd2903364ca62e000044bb  4        1     dave-mcclain      8
    ## 5 5cbd2903364ca62e000044bc  5        1       neener3707      7

``` r
#sort by rating IN dESCENDING ORDER for Movie_ID = 1

CON_movieR$find('{"Movie_ID" : 1}' , sort = '{"Rating": -1}')   
```

    ##    ID Movie_ID              User_Name Rating
    ## 1  15        1               bdwyphil     10
    ## 2  16        1                terry_z     10
    ## 3  12        1            vhinzajhltb      9
    ## 4  21        1    godsgirlfrombluford      9
    ## 5  24        1                 Neymar      9
    ## 6  25        1               maruugaa      9
    ## 7   1        1             TheTopDawg      8
    ## 8   2        1                krice23      8
    ## 9   3        1       celestinoavilajr      8
    ## 10  4        1           dave-mcclain      8
    ## 11  6        1       claudio_carvalho      8
    ## 12 10        1             pinemaples      8
    ## 13 23        1 mind_killaz-256-895248      8
    ## 14  5        1             neener3707      7
    ## 15  7        1         george.schmidt      7
    ## 16  8        1         patrickc-76383      7
    ## 17 11        1                rgkarim      7
    ## 18 13        1             natcalgary      7
    ## 19 14        1           ThomasDrufke      7
    ## 20 19        1           stevendbeard      7
    ## 21 20        1       spilledinkcinema      7
    ## 22 22        1           Platypuschow      7
    ## 23  9        1      Stars-and-popcorn      6
    ## 24 18        1       cmharelson-62160      6
    ## 25 17        1              IntoAvoid      4
    ##                                            Title
    ## 1                                           WOW!
    ## 2                            LOVED this movie!!!
    ## 3    Had to sign up to make a Rating and Review!
    ## 4  Edge of your seat romp that keeps the viewer 
    ## 5  Bad Samaritan, somebody bad, doing a good her
    ## 6                                 I enjoyed this
    ## 7                          Better than expected!
    ## 8                                          Sold!
    ## 9                                  Entertaining!
    ## 10                   an expectedly good thriller
    ## 11                   Surprisingly Great Thriller
    ## 12                         An unexpected thrill.
    ## 13                   Pretty good - worth a watch
    ## 14 Done Before, But Not Too Bad, A Little Extra 
    ## 15 Decent suspense thriller with one box of craz
    ## 16                                   Impressive!
    ## 17        A Samaritan to the Crime Drama Formula
    ## 18                           A pleasant surprise
    ## 19                                 Great B-Movie
    ## 20                          Nice little Thriller
    ## 21                     Great Acting, So-So Story
    ## 22                    Bad Samaritan Not half bad
    ## 23               Bad Samaritan Plays it too Safe
    ## 24 An enjoyable and competently performed suspen
    ## 25    Hoping for a sleeper thriller? Abandon it.
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Content
    ## 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   As my wife abhors any form of violence, I normally dont see films like Bad Samaritan. Its been a long time since Ive been scared in a movie. This film certainly gave me the chills and made my hair stand on end. If youre looking for some thrills with the addition of a moral dilemma, this should be right up your own dark alley.
    ## 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Production was outstanding, story was outstanding, acting was outstanding. There was nothing to dislike. The suspense was palpable throughout. Phenomenal film!!!
    ## 3                                                                                                                                                                                                                 This movie was unexpectedly amazed me. It just completes my day. Im watching like you cant get off the screen not to miss any scenes cuz you dont know what will happens next. This was been one of the best thriller movie I have seen realizing how good the camera and background sounds was all set up in accordingly. Also plus points for the casts they really gave justice to their own role. One thing Im lacking in this movie is how it ends that Ive just thought it will show the FBI finding out all the burried dead bodies at the backyard then it will be aired on the news and soon Seans gf and his family will finally understand what he had gone through in his situation, thats it.Thumbs up and hi5 for the director and producers of this movie. Hoping for more upcoming movie genre like this.
    ## 4  Bad Samaritan is an edge of your seat romp that keeps the viewer guessing what will happen next.Sean Falco Robert Sheehan is a part-time photographer and the burglar who finds a woman being held captive in the home of Cale Erendreich David Tennant. Sean has a moral compass that guides his thievery and does not steal from "good people". Cale is a sociopath, lacking any conscience for the things he does wrong. Katie Kerry Condon is the tortured victim, taken and kept against her will.I felt for Seans plight, trying to save Katie. His desperation on-screen to bring Cale to justice and help Katie was palpable. I wanted to see him those he went to help him make all of this possible. I liked how his character was willing to do whatever it took to do what was necessary.Katie was a completely believable character. From the moment I met her, I wanted to jump through the screen and help her. She was nice and sweet, assisting Sean in any way she could. I hated seeing her treated as she was.Cale w
    ## 5  Bad Samaritan is a very interesting title. How can a samaritan be bad? Well this show says it all.2 Thieves stumbled upon a very rich psychopaths home and found out dark chilling secrets about this psychopath. 1 of the thieves did what a samaritan should do, going all out to save the live he felt he had to save, putting his own life into danger.The show first set in a very beautiful typical European scene Scotland i think?, kinda puts you into the life of the main actor. A poor artist, having a pretty girlfriend, and doing "sideline". Working as a "valet" at night with his best buddy. The pace of the show was good, showing at least 1 failed attempt of their "sideline", before the encounteringthe psychopath. No rush of pace at all.It also slowly puts the show into mystery and suspense, as they move into the psychopaths life. Audience will start to wonder, what kind of pscyhopath he is, how strong would he be, etc. What i like about this psychopath is, unlike some other psychopaths show 
    ## 6  Ill be honest, I had never heard of this movie. I went to the movies for the sake of going to the movies and Isle of Dogs wasnt playing for another 3 hours and Id seen everything else, so I went and saw this.It has a really good story line. The main character is a criminal, and normally you think of criminals of just overall bad people. But you see that despite being a thief, or what society would call a "bad person" he still has compassion, empathy, and general human decency.Some of it was a little unrealistic. Such as, if youre a burglar, youre not going to drive a bright orange Volkswagen from 30 years ago, because thats too obvious. Likewise, youre not going to leave someone bloodied and tied up in the back of a Maserati. Thats like a $300K car.I enjoy the ending, because its not a happy one. The problem gets resolved, but its not a happy ending at all. It makes you wonder if, while the main characterSean was acting out of good and compassion, if it was really worth it given all th
    ## 7                                                                                                                                                                                                                                                                                                                                                                                             For a B-grade film, this was surprisingly better than I expected. The acting was great by all cast members, the directing was on point, the writing was actually pretty good - without many plot issues one would normally expect, the cinematography perfect, the pacing was great, especially for the 107 min length, and the editing not too bad except for the flashbacks. My only critique was the terrible score, especially towards the last act. Had the score been more professional and consistent through out, the suspense would have been stellar instead of adequate. Overall an impressive film. A well deserved 8/10 from me.
    ## 8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Original script. Believable cast. They make it work easily & all in all it looks like what a thriller should look like! For once Im not grumbling in disappointment over lack of continuity or missed opportunities.Several layers thick with multidimensional characters that behave unexpectantly individual and unique instead of plotted. A pleasant surprise, indeed.Perhaps I should have rated it a 9!?
    ## 9                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Good movie! Great plot! Edge of your seat twist and turns! Picture and acting qualities are excellent!.... If theirs anyone looking for good reviews and not sure of watching. Pay no mind to the bad reviews. If you like crime thrillers.. this is a good one!
    ## 10 "Bad Samaritan" R, 151 is a thriller directed by actor-turned-producer Dean Devlin "Geostorm", written by Brandon Boyce "Wicker Park" and starring television actor and erstwhile Dr. Who David Tennant. Theres a bit of horror in here too, but this film is primarily an intricately plotted thrill ride.The title character is named Sean Falco Irish actor Robert Sheehan, a young man whose step-father brought him and his mother to the U.S. because of a job opportunity for which Sean resents him. Sean is an aspiring photographer with a beautiful and intelligent college girlfriend named Riley Jacqueline Byers who knows nothing of Seans real passion - stealing. Sean and his best friend, Derek Carlito Olivero work as valets at an expensive Italian restaurant... which is where they choose their marks. As one of them mans the valet stand, the other uses the vehicles, GPS devices and garage door openers of their unsuspecting customers to rob the patrons homes, while theyre just trying to have a nice 
    ## 11 In Portland, the amateurish photographer Sean Falco Robert Sheehan works with his best friend Derek Sandoval Kerry Condon as valet at a fancy restaurant. His girlfriend Riley Seabrook Jacqueline Byers studies in a university and he is estranged of his stepfather. Sean and Derek are also smalltime burglars, stealing the houses of the costumers while they are eating in the restaurant. One day, the obnoxious client Cale Erendreich David Tennant arrives at the restaurant driving a Maserati and Sean drives his car back to his house using the computer and Derek watches Cale in the restaurant. While snooping around the house, Sean finds a locked room and when he opens the door, he stumbles upon a woman tied to a chair with chains and gagged. He unsuccessfully tries to release her but he is forced to return to the restaurant with the Maserati. Sean decides to call the police, but Cale lures the police officers and turns SeanÂ´s life upside-down. "Bad Samaritan" is a surprisingly great thriller
    ## 12                                                                                                                                                                                                                                                                                                                                                                                                                                                  I didnt expect much of a movie with a name like Bad Samaritan, I didnt expect to find something to enjoy about it besides David Tennant playing the villain, and I certainly didnt expect to find a great movie. The only real complaint I have is that the bad guys backstory was dumb, and honestly would have been better off unexplained. I havent seen a movie this consistently intense since The Infiltrator came out two years ago. I was especially impressed with the continuity and attention to detail, and MY GOSH can David Tennant pull off a fantastic American accent.
    ## 13                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    It started off just a little slow, but escalated quickly and went non-stop from there. Not the very best, but I really have no complaints. Good story, good action. Pretty good acting! Not the very best, but much better than a lot of movies youve never heard of.
    ## 14 Over all not too shabby, definitely better than I expected. So yes its been done many times before, person or in this case; people break in to someones house for some ulterior motive, only to discover the home owner is either hiding something or is some sort of killer. But it throws a little extra into the formula, some works, the emphasis on the killer and his story was refreshing. But is it scary? Is it a horror movie? Because lately so called "horror" movies are indeed not scary at all. And as far as this film is concerned, Im not sure what I want to say, because some of it was effective, and some of it wasnt. First of all, I like how they expanded on the typical story line they were telling, and without giving to much away, it creates this admittedly tense cat and mouse chaotic situation for all parties involved, so I liked how it just didnt stick 100% to the "Rear Window" and "Disturbia" formulas.But was it scary? Id say it was in places and was not in some, it was as simple as th
    ## 15                                                                                                                                                                                                                                                                                                                                                                  BAD SAMARITAN 2018 1/2 David Tennant, Robert Sheehan, Jacqueline Byers, Lisa Brenner, Carlito Olivero, Kerry Condon, Rob Nagle, Hannah Barefoot. Decent suspense thriller with Sheehans petty thief stumbling upon a victim-to-be of a serial killer when he attempts to rob the home and winds up in the crosshairs of an ultimate grudge match/cat-and-mouse with a few good jolts delivered and one box of crazy turn Tennant as the seriously fd up creepazoid. Director Dean Devlin and Brandon Boyces clever script combine for enough popcorn pleasing moments of meta-scream-at-the-screen scenes and even a few canny self-asides to aforementioned sequences.
    ## 16                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                This movie takes you on an rollercoaster-like adventure that is suspenseful while also favorably is unpredictable. That being said, another thing this movie does well with is its realism. Each scene you see feels natural and true to life. In addition, this movie doesnt cut any corners in the storytelling; there arent any holes in the plot that you wonder about later while watching the movie.In conclusion, this is a very well executed thriller and I would honestly recommend this movie!
    ## 17 With the success of the Avengers last weekend, it is hard for other movies to try and take follow such an impressive record. Still, another week comes with movies that are going to try and fight for their place in the silver screen. My first movie of the week is the latest Horror/Thriller to try and keep you on edge. Robbie K here with another round of writing to help you guys with your movie choices. Sit back and read on as I review Movie Bad Samaritan Director Dean DevlinWriter Brandon Boyce screenplay Stars Kerry Condon, David Tennant, Robert Sheehan LIKESDecent Pacing If youve read my work, you know I like movies that movie, which Bad Samaritan does. Ill admit it takes a while to lift off in an attempt to set the stage, but as the robbery goes bad and the thrills start, things start to pick up. From then on, it seems to move, only hitting rough patches of diverging slowness for small amounts before looping back to the story. Acting Another plus here, the cast has quite an art to he
    ## 18                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      I didnt expect much from this but I was deff, impressed. The acting was very good, and the plot well thought out. There were a few parts that were a bit unbelievable, but for the most part it actually seemed like something that could happen for real which made it that much more chilling.7.3
    ## 19                                                                                                                                                                                           Bad Samaritan is a film that I simply did not know was even being released until I looked on Fandango and checked what movies I could go see yesterday. And besides David Tennant, theres really no big name here at all and there wasnt a single bit of marketing that I saw, so theres that. Really, Bad Samaritan will likely be a film that comes and goes and never knows that it existed. However, I actually thought it was a pretty well made film. Granted, it starts to fall apart after the hour mark, but if youre just looking for a cheap thrill with some fun performances, creepy imagery, and good time at the theater, then look no further than Bad Samaritan. The film has no place making some of the third act decisions it does however, it never fully jumps the proverbial shark, and its always entertaining. 7.3/10
    ## 20 I saw "Bad Samaritan", starring David Tennant-Jessica Jones_tv, Doctor Who_tv; Robert Sheehan-Geostorm, The Mortal InstrumentsCity of Bones; Carlito Olivero-East Los High_tv, Blood Heist and Kerry Condon-Three Billboards Outside Ebbing Missouri, Better Call Saul_tv.This is a nice little thriller about a psycho serial killer. Robert and Carlito are two guys that work as valet parking attendants that are not on the up & up. They park your car and then steal anything they can find. Sometimes, they grab stuff left in the car and sometimes they go to the owners house and burglarize it-hey, they are eating and will be gone for an hour or so. Up comes David. Driving a fancy car and just being rather snotty to the guys. Robert decides to check out Davids house and finds, among other things, Kerry, chained to a chair, with a gag in her mouth and signs of being beaten and tortured. What to do, what to do. Robert tries to set her loose but it is chains bolted to the floor. If he calls the police,
    ## 21                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Im a fan of David Tennant, so I cant complain, even if it seems hes a bit typecasted for the bad guy lately. This was all around solid acting film with some dumb choices and a little too convenient plot twists.
    ## 22 David Tennant stars as the movies antagonist in a clever little thriller that deserves more recognition than it appears to have recieved.It tells the story of two friends who through their valet job proceed to rob people while they are at the restaurant. But on this occasion one of them finds a little more than he expected as the home contains a chained up woman.Now Bad Samaritan immediatly suffers from a flaw that a lot of movies have have lately. Namely protagonists that I cant care for. Why am I supposed to root for criminals? These people are robbing folks, why am I supposed to care about them? Sadly this has been a big thing lately and really badly needs to stop.The story is great, David Tennant is excellent As always and it all plays out really well. But our lead being a thief just kept nagging at me and bothered me considerably more than it perhaps should.Putting that aside I can confidently say Bad Samaritan is a smart little film, well constructed and well performed so if the 
    ## 23 Bad Samaritan is a movie that Ive been looking forward to for a few months. Ever since David Tennant gave his incredible performance as Kilgrave on the Marvel Netflix series Jessica Jones. The idea of him playing a totally demented psychopath had me giddy with anticipation. However, when it comes to this film thats about where the fun ends. Even with David Tennant playing the big bad wolf, he stumbles too much to save Bad Samaritan from being, well, a bad movie.I really wanted to like Bad Samaritan, especially because Im a sucker for a good horror movie that can make your skin crawl. There are definitely some moments in the film that will make audiences jump and cringe. However, a lot of those scenes that make you cringe are the ones where David Tennants American accent starts to slip. Im not sure why they decided to make his character American, possibly to make Robert Sheehans Irish accent stand out more, but its definitely not one of Tennants strong suits. There are plenty of other t
    ## 24                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       For the most part, this film was well shot, very well acted, and well paced. My only real criticism for the film is the elements I felt were a bit over the top. These would include a bizarrely done flashback snippet, some odd plot occurrences, and a score that I felt elevated the cartoonish nature of the film. Still, would recommend a watch for those who like cat and mouse thrillers.
    ## 25 Two young men hit upon the idea of using their valet jobs to rob homes. When the owners go in, one valet drives to their house using information stored on the vehicle to lead them straight to the next target. The more reluctant of the two decides to take one such patsys Maserati after the owner rags on both hoodlums with a boorish attitude. Inside the house, a woman is found tied-up, not in a kinky way. Also a roomful of cutlery is discovered.As the dinner was cut short, the car is returned before the woman can be rescued by our good-hearted thief. A phone call is made to the Police, but Mr. Evil is one step ahead, and the home isnt even searched.The lad fesses up to his crime of trespassing to get the Police more involved in a house search; again nothing awry and the kids dismissed with a warning. But not before a suspicious L.E.O. begins to wonder about missing women and this coincidental story of home break-ins.So goes "Bad Samaritan" a tale of a trust fund man who gets his jollies

``` r
# Check time , since by default Mongo has _id is the only index, and other field would be costly to the db 

system.time(CON_movieR$find('{"Movie_ID" : 1}' , sort = '{"Rating": -1}') )
```

    ##    user  system elapsed 
    ##    0.00    0.00    0.03

``` r
system.time(CON_movieR$find('{"Movie_ID" : 1}' , sort = '{"_id": -1}') )
```

    ##    user  system elapsed 
    ##    0.00    0.00    0.05

``` r
#lets add Movie_ID as Index 

CON_movieR$index(add = '{"Movie_ID" : 1}')
```

    ##   v key._id key.Movie_ID       name                       ns
    ## 1 2       1           NA       _id_ MSDS_Review.movie_review
    ## 2 2      NA            1 Movie_ID_1 MSDS_Review.movie_review

``` r
# Lets see how many index we have
CON_movieR$index()
```

    ##   v key._id key.Movie_ID       name                       ns
    ## 1 2       1           NA       _id_ MSDS_Review.movie_review
    ## 2 2      NA            1 Movie_ID_1 MSDS_Review.movie_review

``` r
# Check sysetm time taken for excecution now
system.time(CON_movieR$find('{"Movie_ID" : 1}' , sort = '{"Rating": -1}') )
```

    ##    user  system elapsed 
    ##    0.00    0.00    0.04

### iterate

``` r
# Lets use iterate to read data 
CON_movieR$find()
```

    ##      ID Movie_ID               User_Name Rating
    ## 1     1        1              TheTopDawg      8
    ## 2     2        1                 krice23      8
    ## 3     3        1        celestinoavilajr      8
    ## 4     4        1            dave-mcclain      8
    ## 5     5        1              neener3707      7
    ## 6     6        1        claudio_carvalho      8
    ## 7     7        1          george.schmidt      7
    ## 8     8        1          patrickc-76383      7
    ##                                             Title
    ## 1                           Better than expected!
    ## 2                                           Sold!
    ## 3                                   Entertaining!
    ## 4                     an expectedly good thriller
    ## 5   Done Before, But Not Too Bad, A Little Extra 
    ## 6                     Surprisingly Great Thriller
    ## 7   Decent suspense thriller with one box of craz
    ## 8                                     Impressive!
    ## 9                 Bad Samaritan Plays it too Safe
    ## 10                          An unexpected thrill.
    ## 11         A Samaritan to the Crime Drama Formula
    ## 12    Had to sign up to make a Rating and Review!
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Content
    ## 1                                                                                                                                                                                                                                                                                                                                                                                              For a B-grade film, this was surprisingly better than I expected. The acting was great by all cast members, the directing was on point, the writing was actually pretty good - without many plot issues one would normally expect, the cinematography perfect, the pacing was great, especially for the 107 min length, and the editing not too bad except for the flashbacks. My only critique was the terrible score, especially towards the last act. Had the score been more professional and consistent through out, the suspense would have been stellar instead of adequate. Overall an impressive film. A well deserved 8/10 from me.
    ## 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Original script. Believable cast. They make it work easily & all in all it looks like what a thriller should look like! For once Im not grumbling in disappointment over lack of continuity or missed opportunities.Several layers thick with multidimensional characters that behave unexpectantly individual and unique instead of plotted. A pleasant surprise, indeed.Perhaps I should have rated it a 9!?
    ## 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Good movie! Great plot! Edge of your seat twist and turns! Picture and acting qualities are excellent!.... If theirs anyone looking for good reviews and not sure of watching. Pay no mind to the bad reviews. If you like crime thrillers.. this is a good one!
    ## 4   "Bad Samaritan" R, 151 is a thriller directed by actor-turned-producer Dean Devlin "Geostorm", written by Brandon Boyce "Wicker Park" and starring television actor and erstwhile Dr. Who David Tennant. Theres a bit of horror in here too, but this film is primarily an intricately plotted thrill ride.The title character is named Sean Falco Irish actor Robert Sheehan, a young man whose step-father brought him and his mother to the U.S. because of a job opportunity for which Sean resents him. Sean is an aspiring photographer with a beautiful and intelligent college girlfriend named Riley Jacqueline Byers who knows nothing of Seans real passion - stealing. Sean and his best friend, Derek Carlito Olivero work as valets at an expensive Italian restaurant... which is where they choose their marks. As one of them mans the valet stand, the other uses the vehicles, GPS devices and garage door openers of their unsuspecting customers to rob the patrons homes, while theyre just trying to have a nice 
    ## 5   Over all not too shabby, definitely better than I expected. So yes its been done many times before, person or in this case; people break in to someones house for some ulterior motive, only to discover the home owner is either hiding something or is some sort of killer. But it throws a little extra into the formula, some works, the emphasis on the killer and his story was refreshing. But is it scary? Is it a horror movie? Because lately so called "horror" movies are indeed not scary at all. And as far as this film is concerned, Im not sure what I want to say, because some of it was effective, and some of it wasnt. First of all, I like how they expanded on the typical story line they were telling, and without giving to much away, it creates this admittedly tense cat and mouse chaotic situation for all parties involved, so I liked how it just didnt stick 100% to the "Rear Window" and "Disturbia" formulas.But was it scary? Id say it was in places and was not in some, it was as simple as th
    ## 6   In Portland, the amateurish photographer Sean Falco Robert Sheehan works with his best friend Derek Sandoval Kerry Condon as valet at a fancy restaurant. His girlfriend Riley Seabrook Jacqueline Byers studies in a university and he is estranged of his stepfather. Sean and Derek are also smalltime burglars, stealing the houses of the costumers while they are eating in the restaurant. One day, the obnoxious client Cale Erendreich David Tennant arrives at the restaurant driving a Maserati and Sean drives his car back to his house using the computer and Derek watches Cale in the restaurant. While snooping around the house, Sean finds a locked room and when he opens the door, he stumbles upon a woman tied to a chair with chains and gagged. He unsuccessfully tries to release her but he is forced to return to the restaurant with the Maserati. Sean decides to call the police, but Cale lures the police officers and turns SeanÂ´s life upside-down. "Bad Samaritan" is a surprisingly great thriller
    ## 7                                                                                                                                                                                                                                                                                                                                                                    BAD SAMARITAN 2018 1/2 David Tennant, Robert Sheehan, Jacqueline Byers, Lisa Brenner, Carlito Olivero, Kerry Condon, Rob Nagle, Hannah Barefoot. Decent suspense thriller with Sheehans petty thief stumbling upon a victim-to-be of a serial killer when he attempts to rob the home and winds up in the crosshairs of an ultimate grudge match/cat-and-mouse with a few good jolts delivered and one box of crazy turn Tennant as the seriously fd up creepazoid. Director   ## 149                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Unfortunately we dont have a reliable way to tell the true ratings of a movie.If it wasnt for the ridiculously overblown ratings I wouldnt mind, perhaps I would have watched it anyway because I like Bradley Cooper, but being lured into watching this thing expecting a 8-9 star movie... not cool. This is a movie just for Lady Gaga hardcore fans, anybody else expect a every average product.

``` r
Review_Iter <- CON_movieR$iterate('{"Movie_ID" : 1}', sort = '{"Rating": -1}', limit = 7)

# read records from  the iterator
while(!is.null(x <- Review_Iter$one())){
  cat(sprintf("Found Movie ID %s for USER : %s\n", x$Movie_ID, x$User_Name))
}
```

    ## Found Movie ID 1 for USER : bdwyphil
    ## Found Movie ID 1 for USER : terry_z
    ## Found Movie ID 1 for USER : vhinzajhltb
    ## Found Movie ID 1 for USER : godsgirlfrombluford
    ## Found Movie ID 1 for USER : Neymar
    ## Found Movie ID 1 for USER : maruugaa
    ## Found Movie ID 1 for USER : TheTopDawg

### Remove

``` r
# Lets say I want to remove all the rating of 4 for Movie 1
# 1 list those record
CON_movieR$find('{"Movie_ID" : 1,"Rating":{"$eq":4}}') 
```

    ##   ID Movie_ID User_Name Rating                                      Title
    ## 1 17        1 IntoAvoid      4 Hoping for a sleeper thriller? Abandon it.
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Content
    ## 1 Two young men hit upon the idea of using their valet jobs to rob homes. When the owners go in, one valet drives to their house using information stored on the vehicle to lead them straight to the next target. The more reluctant of the two decides to take one such patsys Maserati after the owner rags on both hoodlums with a boorish attitude. Inside the house, a woman is found tied-up, not in a kinky way. Also a roomful of cutlery is discovered.As the dinner was cut short, the car is returned before the woman can be rescued by our good-hearted thief. A phone call is made to the Police, but Mr. Evil is one step ahead, and the home isnt even searched.The lad fesses up to his crime of trespassing to get the Police more involved in a house search; again nothing awry and the kids dismissed with a warning. But not before a suspicious L.E.O. begins to wonder about missing women and this coincidental story of home break-ins.So goes "Bad Samaritan" a tale of a trust fund man who gets his jollies

``` r
# 2 : Remvoe 
CON_movieR$remove('{"Movie_ID" : 1,"Rating":{"$eq":4}}')

# 3 : Valdiate 
CON_movieR$find('{"Movie_ID" : 1,"Rating":{"$eq":4}}') 
```

    ## data frame with 0 columns and 0 rows

``` r
CON_movieR$find('{"Movie_ID" : 1,"Rating":{"$ne":4}}') # not equal to 4
```

    ##    ID Movie_ID              User_Name Rating
    ## 1   1        1             TheTopDawg      8
    ## 2   2        1                krice23      8
    ## 3   3        1       celestinoavilajr      8
    ## 4   4        1           dave-mcclain      8
    ## 5   5        1             neener3707      7
    ## 6   6        1       claudio_carvalho      8
    ## 7   7        1         george.schmidt      7
    ## 8   8        1         patrickc-76383      7
    ## 9   9        1      Stars-and-popcorn      6
    ## 10 10        1             pinemaples      8
    ## 11 11        1                rgkarim      7
    ## 12 12        1            vhinzajhltb      9
    ## 13 13        1             natcalgary      7
    ## 14 14        1           ThomasDrufke      7
    ## 15 15        1               bdwyphil     10
    ## 16 16        1                terry_z     10
    ## 17 18        1       cmharelson-62160      6
    ## 18 19        1           stevendbeard      7
    ## 19 20        1       spilledinkcinema      7
    ## 20 21        1    godsgirlfrombluford      9
    ## 21 22        1           Platypuschow      7
    ## 22 23        1 mind_killaz-256-895248      8
    ## 23 24        1                 Neymar      9
    ## 24 25        1               maruugaa      9
    ##                                            Title
    ## 1                          Better than expected!
    ## 2                                          Sold!
    ## 3                                  Entertaining!
    ## 4                    an expectedly good thriller
    ## 5  Done Before, But Not Too Bad, A Little Extra 
    ## 6                    Surprisingly Great Thriller
    ## 7  Decent suspense thriller with one box of craz
    ## 8                                    Impressive!
    ## 9                Bad Samaritan Plays it too Safe
    ## 10                         An unexpected thrill.
    ## 11        A Samaritan to the Crime Drama Formula
    ## 12   Had to sign up to make a Rating and Review!
    ## 13                           A pleasant surprise
    ## 14                                 Great B-Movie
    ## 15                                          WOW!
    ## 16                           LOVED this movie!!!
    ## 17 An enjoyable and competently performed suspen
    ## 18                          Nice little Thriller
    ## 19                     Great Acting, So-So Story
    ## 20 Edge of your seat romp that keeps the viewer 
    ## 21                    Bad Samaritan Not half bad
    ## 22                   Pretty good - worth a watch
    ## 23 Bad Samaritan, somebody bad, doing a good her
    ## 24                                I enjoyed this
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     Content
    ## 1                                                                                                                                                                                                                                                                                                                                                                                             For a B-grade film, this was surprisingly better than I expected. The acting was great by all cast members, the directing was on point, the writing was actually pretty good - without many plot issues one would normally expect, the cinematography perfect, the pacing was great, especially for the 107 min length, and the editing not too bad except for the flashbacks. My only critique was the terrible score, especially towards the last act. Had the score been more professional and consistent through out, the suspense would have been stellar instead of adequate. Overall an impressive film. A well deserved 8/10 from me.
    ## 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Original script. Believable cast. They make it work easily & all in all it looks like what a thriller should look like! For once Im not grumbling in disappointment over lack of continuity or missed opportunities.Several layers thick with multidimensional characters that behave unexpectantly individual and unique instead of plotted. A pleasant surprise, indeed.Perhaps I should have rated it a 9!?
    ## 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Good movie! Great plot! Edge of your seat twist and turns! Picture and acting qualities are excellent!.... If theirs anyone looking for good reviews and not sure of watching. Pay no mind to the bad reviews. If you like crime thrillers.. this is a good one!
    ## 4  "Bad Samaritan" R, 151 is a thriller directed by actor-turned-producer Dean Devlin "Geostorm", written by Brandon Boyce "Wicker Park" and starring television actor and erstwhile Dr. Who David Tennant. Theres a bit of horror in here too, but this film is primarily an intricately plotted thrill ride.The title character is named Sean Falco Irish actor Robert Sheehan, a young man whose step-father brought him and his mother to the U.S. because of a job opportunity for which Sean resents him. Sean is an aspiring photographer with a beautiful and intelligent college girlfriend named Riley Jacqueline Byers who knows nothing of Seans real passion - stealing. Sean and his best friend, Derek Carlito Olivero work as valets at an expensive Italian restaurant... which is where they choose their marks. As one of them mans the valet stand, the other uses the vehicles, GPS devices and garage door openers of their unsuspecting customers to rob the patrons homes, while theyre just trying to have a nice 
    ## 5  Over all not too shabby, definitely better than I expected. So yes its been done many times before, person or in this case; people break in to someones house for some ulterior motive, only to discover the home owner is either hiding something or is some sort of killer. But it throws a little extra into the formula, some works, the emphasis on the killer and his story was refreshing. But is it scary? Is it a horror movie? Because lately so called "horror" movies are indeed not scary at all. And as far as this film is concerned, Im not sure what I want to say, because some of it was effective, and some of it wasnt. First of all, I like how they expanded on the typical story line they were telling, and without giving to much away, it creates this admittedly tense cat and mouse chaotic situation for all parties involved, so I liked how it just didnt stick 100% to the "Rear Window" and "Disturbia" formulas.But was it scary? Id say it was in places and was not in some, it was as simple as th
    ## 6  In Portland, the amateurish photographer Sean Falco Robert Sheehan works with his best friend Derek Sandoval Kerry Condon as valet at a fancy restaurant. His girlfriend Riley Seabrook Jacqueline Byers studies in a university and he is estranged of his stepfather. Sean and Derek are also smalltime burglars, stealing the houses of the costumers while they are eating in the restaurant. One day, the obnoxious client Cale Erendreich David Tennant arrives at the restaurant driving a Maserati and Sean drives his car back to his house using the computer and Derek watches Cale in the restaurant. While snooping around the house, Sean finds a locked room and when he opens the door, he stumbles upon a woman tied to a chair with chains and gagged. He unsuccessfully tries to release her but he is forced to return to the restaurant with the Maserati. Sean decides to call the police, but Cale lures the police officers and turns SeanÂ´s life upside-down. "Bad Samaritan" is a surprisingly great thriller
    ## 7                                                                                                                                                                                                                                                                                                                                                                   BAD SAMARITAN 2018 1/2 David Tennant, Robert Sheehan, Jacqueline Byers, Lisa Brenner, Carlito Olivero, Kerry Condon, Rob Nagle, Hannah Barefoot. Decent suspense thriller with Sheehans petty thief stumbling upon a victim-to-be of a serial killer when he attempts to rob the home and winds up in the crosshairs of an ultimate grudge match/cat-and-mouse with a few good jolts delivered and one box of crazy turn Tennant as the seriously fd up creepazoid. Director Dean Devlin and Brandon Boyces clever script combine for enough popcorn pleasing moments of meta-scream-at-the-screen scenes and even a few canny self-asides to aforementioned sequences.
    ## 8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 This movie takes you on an rollercoaster-like adventure that is suspenseful while also favorably is unpredictable. That being said, another thing this movie does well with is its realism. Each scene you see feels natural and true to life. In addition, this movie doesnt cut any corners in the storytelling; there arent any holes in the plot that you wonder about later while watching the movie.In conclusion, this is a very well executed thriller and I would honestly recommend this movie!
    ## 9  Bad Samaritan is a movie that Ive been looking forward to for a few months. Ever since David Tennant gave his incredible performance as Kilgrave on the Marvel Netflix series Jessica Jones. The idea of him playing a totally demented psychopath had me giddy with anticipation. However, when it comes to this film thats about where the fun ends. Even with David Tennant playing the big bad wolf, he stumbles too much to save Bad Samaritan from being, well, a bad movie.I really wanted to like Bad Samaritan, especially because Im a sucker for a good horror movie that can make your skin crawl. There are definitely some moments in the film that will make audiences jump and cringe. However, a lot of those scenes that make you cringe are the ones where David Tennants American accent starts to slip. Im not sure why they decided to make his character American, possibly to make Robert Sheehans Irish accent stand out more, but its definitely not one of Tennants strong suits. There are plenty of other t
    ## 10                                                                                                                                                                                                                                                                                                                                                                                                                                                  I didnt expect much of a movie with a name like Bad Samaritan, I didnt expect to find something to enjoy about it besides David Tennant playing the villain, and I certainly didnt expect to find a great movie. The only real complaint I have is that the bad guys backstory was dumb, and honestly would have been better off unexplained. I havent seen a movie this consistently intense since The Infiltrator came out two years ago. I was especially impressed with the continuity and attention to detail, and MY GOSH can David Tennant pull off a fantastic American accent.
    ## 11 With the success of the Avengers last weekend, it is hard for other movies to try and take follow such an impressive record. Still, another week comes with movies that are going to try and fight for their place in the silver screen. My first movie of the week is the latest Horror/Thriller to try and keep you on edge. Robbie K here with another round of writing to help you guys with your movie choices. Sit back and read on as I review Movie Bad Samaritan Director Dean DevlinWriter Brandon Boyce screenplay Stars Kerry Condon, David Tennant, Robert Sheehan LIKESDecent Pacing If youve read my work, you know I like movies that movie, which Bad Samaritan does. Ill admit it takes a while to lift off in an attempt to set the stage, but as the robbery goes bad and the thrills start, things start to pick up. From then on, it seems to move, only hitting rough patches of diverging slowness for small amounts before looping back to the story. Acting Another plus here, the cast has quite an art to he
    ## 12                                                                                                                                                                                                                This movie was unexpectedly amazed me. It just completes my day. Im watching like you cant get off the screen not to miss any scenes cuz you dont know what will happens next. This was been one of the best thriller movie I have seen realizing how good the camera and background sounds was all set up in accordingly. Also plus points for the casts they really gave justice to their own role. One thing Im lacking in this movie is how it ends that Ive just thought it will show the FBI finding out all the burried dead bodies at the backyard then it will be aired on the news and soon Seans gf and his family will finally understand what he had gone through in his situation, thats it.Thumbs up and hi5 for the director and producers of this movie. Hoping for more upcoming movie genre like this.
    ## 13                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      I didnt expect much from this but I was deff, impressed. The acting was very good, and the plot well thought out. There were a few parts that were a bit unbelievable, but for the most part it actually seemed like something that could happen for real which made it that much more chilling.7.3
    ## 14                                                                                                                                                                                           Bad Samaritan is a film that I simply did not know was even being released until I looked on Fandango and checked what movies I could go see yesterday. And besides David Tennant, theres really no big name here at all and there wasnt a single bit of marketing that I saw, so theres that. Really, Bad Samaritan will likely be a film that comes and goes and never knows that it existed. However, I actually thought it was a pretty well made film. Granted, it starts to fall apart after the hour mark, but if youre just looking for a cheap thrill with some fun performances, creepy imagery, and good time at the theater, then look no further than Bad Samaritan. The film has no place making some of the third act decisions it does however, it never fully jumps the proverbial shark, and its always entertaining. 7.3/10
    ## 15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  As my wife abhors any form of violence, I normally dont see films like Bad Samaritan. Its been a long time since Ive been scared in a movie. This film certainly gave me the chills and made my hair stand on end. If youre looking for some thrills with the addition of a moral dilemma, this should be right up your own dark alley.
    ## 16                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Production was outstanding, story was outstanding, acting was outstanding. There was nothing to dislike. The suspense was palpable throughout. Phenomenal film!!!
    ## 17                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       For the most part, this film was well shot, very well acted, and well paced. My only real criticism for the film is the elements I felt were a bit over the top. These would include a bizarrely done flashback snippet, some odd plot occurrences, and a score that I felt elevated the cartoonish nature of the film. Still, would recommend a watch for those who like cat and mouse thrillers.
    ## 18 I saw "Bad Samaritan", starring David Tennant-Jessica Jones_tv, Doctor Who_tv; Robert Sheehan-Geostorm, The Mortal InstrumentsCity of Bones; Carlito Olivero-East Los High_tv, Blood Heist and Kerry Condon-Three Billboards Outside Ebbing Missouri, Better Call Saul_tv.This is a nice little thriller about a psycho serial killer. Robert and Carlito are two guys that work as valet parking attendants that are not on the up & up. They park your car and then steal anything they can find. Sometimes, they grab stuff left in the car and sometimes they go to the owners house and burglarize it-hey, they are eating and will be gone for an hour or so. Up comes David. Driving a fancy car and just being rather snotty to the guys. Robert decides to check out Davids house and finds, among other things, Kerry, chained to a chair, with a gag in her mouth and signs of being beaten and tortured. What to do, what to do. Robert tries to set her loose but it is chains bolted to the floor. If he calls the police,
    ## 19                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Im a fan of David Tennant, so I cant complain, even if it seems hes a bit typecasted for the bad guy lately. This was all around solid acting film with some dumb choices and a little too convenient plot twists.
    ## 20 Bad Samaritan is an edge of your seat romp that keeps the viewer guessing what will happen next.Sean Falco Robert Sheehan is a part-time photographer and the burglar who finds a woman being held captive in the home of Cale Erendreich David Tennant. Sean has a moral compass that guides his thievery and does not steal from "good people". Cale is a sociopath, lacking any conscience for the things he does wrong. Katie Kerry Condon is the tortured victim, taken and kept against her will.I felt for Seans plight, trying to save Katie. His desperation on-screen to bring Cale to justice and help Katie was palpable. I wanted to see him those he went to help him make all of this possible. I liked how his character was willing to do whatever it took to do what was necessary.Katie was a completely believable character. From the moment I met her, I wanted to jump through the screen and help her. She was nice and sweet, assisting Sean in any way she could. I hated seeing her treated as she was.Cale w
    ## 21 David Tennant stars as the movies antagonist in a clever little thriller that deserves more recognition than it appears to have recieved.It tells the story of two friends who through their valet job proceed to rob people while they are at the restaurant. But on this occasion one of them finds a little more than he expected as the home contains a chained up woman.Now Bad Samaritan immediatly suffers from a flaw that a lot of movies have have lately. Namely protagonists that I cant care for. Why am I supposed to root for criminals? These people are robbing folks, why am I supposed to care about them? Sadly this has been a big thing lately and really badly needs to stop.The story is great, David Tennant is excellent As always and it all plays out really well. But our lead being a thief just kept nagging at me and bothered me considerably more than it perhaps should.Putting that aside I can confidently say Bad Samaritan is a smart little film, well constructed and well performed so if the 
    ## 22                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    It started off just a little slow, but escalated quickly and went non-stop from there. Not the very best, but I really have no complaints. Good story, good action. Pretty good acting! Not the very best, but much better than a lot of movies youve never heard of.
    ## 23 Bad Samaritan is a very interesting title. How can a samaritan be bad? Well this show says it all.2 Thieves stumbled upon a very rich psychopaths home and found out dark chilling secrets about this psychopath. 1 of the thieves did what a samaritan should do, going all out to save the live he felt he had to save, putting his own life into danger.The show first set in a very beautiful typical European scene Scotland i think?, kinda puts you into the life of the main actor. A poor artist, having a pretty girlfriend, and doing "sideline". Working as a "valet" at night with his best buddy. The pace of the show was good, showing at least 1 failed attempt of their "sideline", before the encounteringthe psychopath. No rush of pace at all.It also slowly puts the show into mystery and suspense, as they move into the psychopaths life. Audience will start to wonder, what kind of pscyhopath he is, how strong would he be, etc. What i like about this psychopath is, unlike some other psychopaths show 
    ## 24 Ill be honest, I had never heard of this movie. I went to the movies for the sake of going to the movies and Isle of Dogs wasnt playing for another 3 hours and Id seen everything else, so I went and saw this.It has a really good story line. The main character is a criminal, and normally you think of criminals of just overall bad people. But you see that despite being a thief, or what society would call a "bad person" he still has compassion, empathy, and general human decency.Some of it was a little unrealistic. Such as, if youre a burglar, youre not going to drive a bright orange Volkswagen from 30 years ago, because thats too obvious. Likewise, youre not going to leave someone bloodied and tied up in the back of a Maserati. Thats like a $300K car.I enjoy the ending, because its not a happy one. The problem gets resolved, but its not a happy ending at all. It makes you wonder if, while the main characterSean was acting out of good and compassion, if it was really worth it given all th

``` r
CON_movieR$count() # Count got reduced .
```

    ## [1] 148

``` r
#Let update rating from 8 to 9

CON_movieR$find('{"Movie_ID" : 1,"User_Name":"krice23"}') 
```

    ##   ID Movie_ID User_Name Rating Title
    ## 1  2        1   krice23      8 Sold!
    ##                                                                                                                                                                                                                                                                                                                                                                                                          Content
    ## 1 Original script. Believable cast. They make it work easily & all in all it looks like what a thriller should look like! For once Im not grumbling in disappointment over lack of continuity or missed opportunities.Several layers thick with multidimensional characters that behave unexpectantly individual and unique instead of plotted. A pleasant surprise, indeed.Perhaps I should have rated it a 9!?

``` r
CON_movieR$update('{"Movie_ID" : 1,"User_Name":"krice23"}','{"$set":{"Rating":9}}')
```

    ## List of 3
    ##  $ modifiedCount: int 1
    ##  $ matchedCount : int 1
    ##  $ upsertedCount: int 0

``` r
CON_movieR$find('{"Movie_ID" : 1,"User_Name":"krice23"}') 
```

    ##   ID Movie_ID User_Name Rating Title
    ## 1  2        1   krice23      9 Sold!
    ##                                                                                                                                                                                                                                                                                                                                                                                                          Content
    ## 1 Original script. Believable cast. They make it work easily & all in all it looks like what a thriller should look like! For once Im not grumbling in disappointment over lack of continuity or missed opportunities.Several layers thick with multidimensional characters that behave unexpectantly individual and unique instead of plotted. A pleasant surprise, indeed.Perhaps I should have rated it a 9!?

``` r
# we should using multiple = TRUE if we want to udpate more that one record.


CON_movieR$find('{"User_Name":"TheTopDawg"}') 
```

    ##   ID Movie_ID  User_Name Rating
    ## 1  1        1 TheTopDawg      8
    ## 2 54        3 TheTopDawg      8
    ##                                           Title
    ## 1                         Better than expected!
    ## 2 Appreciate this film for what it is fun, mind
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Content
    ## 1 For a B-grade film, this was surprisingly better than I expected. The acting was great by all cast members, the directing was on point, the writing was actually pretty good - without many plot issues one would normally expect, the cinematography perfect, the pacing was great, especially for the 107 min length, and the editing not too bad except for the flashbacks. My only critique was the terrible score, especially towards the last act. Had the score been more professional and consistent through out, the suspense would have been stellar instead of adequate. Overall an impressive film. A well deserved 8/10 from me.
    ## 2                                                                        Appreciate this film for what it is fun, mindless, action-filled entertainment. No need to dissect, analyse or compare this. My only few complaints are that the writing was too loose and should have been edited down by 15-20 mins to keep the pace more elevated throughout. Also, not a fan of the Energyne CEO sister and brother characters - they were way too cheesy and annoying and cheapened the film. All other actors were cast and performed great, and Dwayne entertained as always. The SFX/VFX were also great. A fun and well deserved 8/10 from me

``` r
CON_movieR$update('{"User_Name":"TheTopDawg"}','{"$set":{"Rating":9}}')
```

    ## List of 3
    ##  $ modifiedCount: int 1
    ##  $ matchedCount : int 1
    ##  $ upsertedCount: int 0

``` r
CON_movieR$find('{"User_Name":"TheTopDawg"}') 
```

    ##   ID Movie_ID  User_Name Rating
    ## 1  1        1 TheTopDawg      9
    ## 2 54        3 TheTopDawg      8
    ##                                           Title
    ## 1                         Better than expected!
    ## 2 Appreciate this film for what it is fun, mind
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Content
    ## 1 For a B-grade film, this was surprisingly better than I expected. The acting was great by all cast members, the directing was on point, the writing was actually pretty good - without many plot issues one would normally expect, the cinematography perfect, the pacing was great, especially for the 107 min length, and the editing not too bad except for the flashbacks. My only critique was the terrible score, especially towards the last act. Had the score been more professional and consistent through out, the suspense would have been stellar instead of adequate. Overall an impressive film. A well deserved 8/10 from me.
    ## 2                                                                        Appreciate this film for what it is fun, mindless, action-filled entertainment. No need to dissect, analyse or compare this. My only few complaints are that the writing was too loose and should have been edited down by 15-20 mins to keep the pace more elevated throughout. Also, not a fan of the Energyne CEO sister and brother characters - they were way too cheesy and annoying and cheapened the film. All other actors were cast and performed great, and Dwayne entertained as always. The SFX/VFX were also great. A fun and well deserved 8/10 from me

``` r
# multiple = TRUE if we want to udpate more that one record.
CON_movieR$update('{"User_Name":"TheTopDawg"}','{"$set":{"Rating":7}}',multiple = TRUE)
```

    ## List of 3
    ##  $ modifiedCount: int 2
    ##  $ matchedCount : int 2
    ##  $ upsertedCount: int 0

``` r
CON_movieR$find('{"User_Name":"TheTopDawg"}') 
```

    ##   ID Movie_ID  User_Name Rating
    ## 1  1        1 TheTopDawg      7
    ## 2 54        3 TheTopDawg      7
    ##                                           Title
    ## 1                         Better than expected!
    ## 2 Appreciate this film for what it is fun, mind
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Content
    ## 1 For a B-grade film, this was surprisingly better than I expected. The acting was great by all cast members, the directing was on point, the writing was actually pretty good - without many plot issues one would normally expect, the cinematography perfect, the pacing was great, especially for the 107 min length, and the editing not too bad except for the flashbacks. My only critique was the terrible score, especially towards the last act. Had the score been more professional and consistent through out, the suspense would have been stellar instead of adequate. Overall an impressive film. A well deserved 8/10 from me.
    ## 2                                                                        Appreciate this film for what it is fun, mindless, action-filled entertainment. No need to dissect, analyse or compare this. My only few complaints are that the writing was too loose and should have been edited down by 15-20 mins to keep the pace more elevated throughout. Also, not a fan of the Energyne CEO sister and brother characters - they were way too cheesy and annoying and cheapened the film. All other actors were cast and performed great, and Dwayne entertained as always. The SFX/VFX were also great. A fun and well deserved 8/10 from me

### Export and other function

Mongo stores data in BSON , we can get BSON output by passing BSON =
true

``` r
CON_movie$export()
```

    ## { "_id" : { "$oid" : "5cbd2903364ca62e000044b2" }, "ID" : 1, "Movie_Name" : "Bad Samaritan", "Year" : "2018" }
    ## { "_id" : { "$oid" : "5cbd2903364ca62e000044b3" }, "ID" : 2, "Movie_Name" : "Avengers: Infinity War", "Year" : "2018" }
    ## { "_id" : { "$oid" : "5cbd2903364ca62e000044b4" }, "ID" : 3, "Movie_Name" : "Rampage", "Year" : "2018" }
    ## { "_id" : { "$oid" : "5cbd2903364ca62e000044b5" }, "ID" : 4, "Movie_Name" : "Truth or Dare", "Year" : "2018" }
    ## { "_id" : { "$oid" : "5cbd2903364ca62e000044b6" }, "ID" : 5, "Movie_Name" : "Incredibles 2", "Year" : "2018" }
    ## { "_id" : { "$oid" : "5cbd2903364ca62e000044b7" }, "ID" : 6, "Movie_Name" : "A Star Is Born", "Year" : "2018" }

``` r
CON_movie$export(file("mr.bson"),bson = TRUE)


OpenCon$run('{"listCollections":1}')
```

    ## $cursor
    ## $cursor$id
    ## [1] 0
    ## 
    ## $cursor$ns
    ## [1] "test.$cmd.listCollections"
    ## 
    ## $cursor$firstBatch
    ##        name       type info.readOnly
    ## 1 week9msds collection         FALSE
    ## 2      book collection         FALSE
    ## 3     users collection         FALSE
    ## 4  fs.files collection         FALSE
    ## 5 fs.chunks collection         FALSE
    ##                                                        info.uuid idIndex.v
    ## 1 c7, c8, 84, 9c, 97, 98, 4c, a2, 92, e9, 7b, 86, ba, 19, 75, 99         2
    ## 2 b3, e0, 85, bb, 07, 0c, 43, 76, a2, 2e, f6, 33, ae, c0, 85, e5         2
    ## 3 18, 40, 84, 18, 57, c0, 4b, e3, 81, fe, 8d, bb, dc, 6c, 9e, 4a         2
    ## 4 7c, 33, 08, 49, fd, 51, 48, 06, b6, 92, e4, c5, c5, 62, 13, ba         2
    ## 5 7a, 0a, 2a, ac, 3b, cd, 43, 62, a3, 5d, 20, bb, 65, 36, 36, 3d         2
    ##   idIndex._id idIndex.name     idIndex.ns
    ## 1           1         _id_ test.week9msds
    ## 2           1         _id_      test.book
    ## 3           1         _id_     test.users
    ## 4           1         _id_  test.fs.files
    ## 5           1         _id_ test.fs.chunks
    ## 
    ## 
    ## $ok
    ## [1] 1
    ## 
    ## $operationTime
    ## $operationTime$t
    ## [1] 1555900680
    ## 
    ## $operationTime$i
    ## [1] 10
    ## 
    ## 
    ## $`$clusterTime`
    ## $`$clusterTime`$clusterTime
    ## $`$clusterTime`$clusterTime$t
    ## [1] 1555900680
    ## 
    ## $`$clusterTime`$clusterTime$i
    ## [1] 10
    ## 
    ## 
    ## $`$clusterTime`$signature
    ## $`$clusterTime`$signature$hash
    ##  [1] 3a 8f c3 48 fd 35 3b 81 bd b3 91 42 e2 11 63 00 ca 99 98 f9
    ## attr(,"type")
    ## [1] 00
    ## 
    ## $`$clusterTime`$signature$keyId
    ## [1] 6.659713e+18

``` r
CON_admin <- admin <- mongo(db = "admin",url = URI)
CON_admin$run('{"listDatabases":1}')
```

    ## $databases
    ##           name sizeOnDisk empty
    ## 1   606Project      24576 FALSE
    ## 2           MS     229376 FALSE
    ## 3  MSDS_Review      32768 FALSE
    ## 4   MSProject3    3239936 FALSE
    ## 5        Week9      24576 FALSE
    ## 6         test     212992 FALSE
    ## 7   testSUNDAY      98304 FALSE
    ## 8    week9msds      24576 FALSE
    ## 9        admin     245760 FALSE
    ## 10       local 3534430208 FALSE
    ## 
    ## $totalSize
    ## [1] 3538563072
    ## 
    ## $ok
    ## [1] 1
    ## 
    ## $operationTime
    ## $operationTime$t
    ## [1] 1555900680
    ## 
    ## $operationTime$i
    ## [1] 10
    ## 
    ## 
    ## $`$clusterTime`
    ## $`$clusterTime`$clusterTime
    ## $`$clusterTime`$clusterTime$t
    ## [1] 1555900680
    ## 
    ## $`$clusterTime`$clusterTime$i
    ## [1] 10
    ## 
    ## 
    ## $`$clusterTime`$signature
    ## $`$clusterTime`$signature$hash
    ##  [1] 3a 8f c3 48 fd 35 3b 81 bd b3 91 42 e2 11 63 00 ca 99 98 f9
    ## attr(,"type")
    ## [1] 00
    ## 
    ## $`$clusterTime`$signature$keyId
    ## [1] 6.659713e+18

### Distinct

``` r
NOSQL_CON = mongo(collection = "movie", db = "MSDS_Review", url = URI) # create connection, database and collection
NOSQL_CON$index()
```

    ##   v _id name                ns
    ## 1 2   1 _id_ MSDS_Review.movie

``` r
NOSQL_CON$count()
```

    ## [1] 6

``` r
NOSQL_CON$distinct("Movie_Name")
```

    ## [1] "Bad Samaritan"          "Avengers: Infinity War"
    ## [3] "Rampage"                "Truth or Dare"         
    ## [5] "Incredibles 2"          "A Star Is Born"

``` r
NOSQL_CON$find()
```

    ##   ID             Movie_Name Year
    ## 1  1          Bad Samaritan 2018
    ## 2  2 Avengers: Infinity War 2018
    ## 3  3                Rampage 2018
    ## 4  4          Truth or Dare 2018
    ## 5  5          Incredibles 2 2018
    ## 6  6         A Star Is Born 2018

``` r
NOSQL_CON$iterate()$one()
```

    ## $ID
    ## [1] 1
    ## 
    ## $Movie_Name
    ## [1] "Bad Samaritan"
    ## 
    ## $Year
    ## [1] "2018"

``` r
# Find Movie with name "Incredibles 2"
# USe count to get the count of matching record . 
# use find to get the data

NOSQL_CON$count('{"Movie_Name" : "Incredibles 2"  }')
```

    ## [1] 1

``` r
NOSQL_CON$count('{"Movie_Name" : "Incredibles2"  }') # Note space missing between name `Incredibles 2`.
```

    ## [1] 0

``` r
NOSQL_CON$find('{"Movie_Name" : "Incredibles 2"  }')
```

    ##   ID    Movie_Name Year
    ## 1  5 Incredibles 2 2018

``` r
MOview_Rating <- NOSQL_CON$find('{"ID" : 1}')
print(MOview_Rating)
```

    ##   ID    Movie_Name Year
    ## 1  1 Bad Samaritan 2018

Compare Nosql and MYSQL
=======================

<table class="table table-bordered table-striped">
<tbody>
<tr>
<th>
SQL Database
</th>
<th>
NoSQL Database (MongoDB)
</th>
</tr>
<tr>
<td>
Relational database
</td>
<td>
Non-relational database
</td>
</tr>
<tr>
<td>
Supports SQL query language
</td>
<td>
Supports JSON query language
</td>
</tr>
<tr>
<td>
Table based
</td>
<td>
Collection based and key-value pair
</td>
</tr>
<tr>
<td>
Row based
</td>
<td>
Document based
</td>
</tr>
<tr>
<td>
Column based
</td>
<td>
Field based
</td>
</tr>
<tr>
<td>
Support foreign key
</td>
<td>
No support for foreign key
</td>
</tr>
<tr>
<td>
Support for triggers
</td>
<td>
No Support for triggers
</td>
</tr>
<tr>
<td>
Contains schema which is predefined
</td>
<td>
Contains dynamic schema
</td>
</tr>
<tr>
<td>
Not fit for hierarchical data storage
</td>
<td>
Best fit for hierarchical data storage
</td>
</tr>
<tr>
<td>
Vertically scalable - increasing RAM
</td>
<td>
Horizontally scalable - add more servers
</td>
</tr>
<tr>
<td>
Emphasizes on ACID properties (Atomicity, Consistency, Isolation and
Durability)
</td>
<td>
Emphasizes on CAP theorem (Consistency, Availability and Partition
tolerance)
</td>
</tr>
</tbody>
</table>
MongoDB is an open source document-oriented NoSQL database which stores
data in the form of JSON-like objects. Hence a collection in MongoDB is
equivalent to Table in relational database And a document in a
collection in MongoDB is equivalent to a row in relational database
table.

If we were using a relational database, we could perform a join on users
and stores, and get all our objects in a single query. But MongoDB does
not support joins and so, at times, requires bit of denormalization

NoSQL and relational databses differ in the manner they represent data.
While a row stores data in columns, document stores in JSON like
structure.

MongoDB documents support dynamic schema, i.e. documents in same
collection can have different schema , one can have 5 fileds , while
other can have more or less than five. This allows complex hierarchical
/tree structured schemas is be efficiently stored in MongoDB.

Relationships in relational databse can be achieved through primary key
/foreign key constraints ; No such mapping is present in MongoDB other
than linking / emnbedding of documents .

Ref
===

-   <https://jeroen.github.io/mongolite/manipulate-data.html>
-   <https://cran.r-project.org/web/packages/mongolite/mongolite.pdf>

#Class Project - Tammy Walker

#Step 1 - Clearly state the goals for the project as well as the hypothesis you hope to prove (or disprove).

#The main goal of the project is to understand the variables that impact the gross box office revenues for films released from 2010 to 2019
#and to predict and to predict the profits of a film given a new value for one of the predictors.



#Step 2 - Data access: download the data set into your R environment (write the R code for data access).

#Read in the data files
movies <- read.csv("./data/IMDb movies.csv")
ratings <- read.csv("./data/IMDb ratings.csv")
principals <- read.csv("./data/IMDb title_principals.csv")
names <- read.csv("./data/IMDb names.csv")
boxOffice <- read.csv("./data/boxoffice.csv")

#Preview the data sets
head(movies)
head(ratings)
head(boxOffice)
head(principals)
head(names)



#Step 3 - Use the data repository to get a definition of all the variables in the data set. 
#Perform feature engineering to select variables that support your hypothesis.

#Step 3.1 - Definition of variables in movies data set
names(movies) #print the variables in the movies data set
#[1] "imdb_title_id"         "title"                 "original_title"        "year"                  "date_published"        "genre"                 "duration"             
#[8] "country"               "language"              "director"              "writer"                "production_company"    "actors"                "description"          
#[15] "avg_vote"              "votes"                 "oldBudgetTEXT"         "budgetFORMULA"         "budget"                "usa_gross_income"      "worlwide_gross_income"
#[22] "metascore"             "reviews_from_users"    "reviews_from_critics

str(movies) #list the structure of data in the movies data set

#'data.frame':	81273 obs. of  24 variables:
#$ imdb_title_id        : chr  "tt0000574" "tt0001892" "tt0002101" "tt0002130" ...
#$ title                : chr  "The Story of the Kelly Gang" "Den sorte dr√∏m" "Cleopatra" "L'Inferno" ...
#$ original_title       : chr  "The Story of the Kelly Gang" "Den sorte dr√∏m" "Cleopatra" "L'Inferno" ...
#$ year                 : int  1906 1911 1912 1911 1912 1919 1913 1912 1912 1913 ...
#$ date_published       : chr  "12/26/1906" "8/19/1911" "11/13/1912" "3/6/1911" ...
#$ genre                : chr  "Biography, Crime, Drama" "Drama" "Drama, History" "Adventure, Drama, Fantasy" ...
#$ duration             : int  70 53 100 68 60 85 120 120 55 121 ...
#$ country              : chr  "Australia" "Germany, Denmark" "USA" "Italy" ...
#$ language             : chr  "" "" "English" "Italian" ...
#$ director             : chr  "Charles Tait" "Urban Gad" "Charles L. Gaskill" "Francesco Bertolini, Adolfo Padovan" ...
#$ writer               : chr  "Charles Tait" "Urban Gad, Gebhard Sch√§tzler-Perasini" "Victorien Sardou" "Dante Alighieri" ...
#$ production_company   : chr  "J. and N. Tait" "Fotorama" "Helen Gardner Picture Players" "Milano Film" ...
#$ actors               : chr  "Elizabeth Tait, John Tait, Norman Campbell, Bella Cola, Will Coyne, Sam Crewes, Jack Ennis, John Forde, Vera Li"| __truncated__ "Asta Nielsen, Valdemar Psilander, Gunnar Helsengreen, Emil Albes, Hugo Flink, Mary Hagen" "Helen Gardner, Pearl Sindelar, Miss Fielding, Miss Robson, Helene Costello, Charles Sindelar, Mr. Howard, James"| __truncated__ "Salvatore Papa, Arturo Pirovano, Giuseppe de Liguoro, Pier Delle Vigne, Augusto Milla, Attilio Motta, Emilise Beretta" ...
#$ description          : chr  "True story of notorious Australian outlaw Ned Kelly (1855-80)." "Two men of high rank are both wooing the beautiful and famous equestrian acrobat Stella. While Stella ignores t"| __truncated__ "The fabled queen of Egypt's affair with Roman general Marc Antony is ulimately disastrous for both of them." "Loosely adapted from Dante's Divine Comedy and inspired by the illustrations of Gustav Dor√© the original silen"| __truncated__ ...
#$ avg_vote             : num  6.1 5.9 5.2 7 5.7 6.8 6.2 6.7 5.5 6.7 ...
#$ votes                : int  537 171 420 2019 438 709 241 187 211 310 ...
#$ oldBudgetTEXT        : chr  "$2,250 " "" "$45,000 " "" ...
#$ budgetFORMULA        : chr  "$2,250 " "$0 " "$45,000 " "$0 " ...
#$ budget               : num  2250 0 45000 0 0 0 45000 400000 30000 0 ...
#$ usa_gross_income     : chr  "" "" "" "" ...
#$ worlwide_gross_income: chr  "" "" "" "" ...
#$ metascore            : int  NA NA NA NA NA NA NA NA NA NA ...
#$ reviews_from_users   : int  7 4 24 28 12 11 6 3 7 9 ...
#$ reviews_from_critics : int  7 2 3 14 5 9 4 1 1 9 ...


#Step 3.2 - Definition of variables in the ratings data set
names(ratings) #print the variables in the movies ratings data set
#[1] "imdb_title_id"             "weighted_average_vote"     "total_votes"               "mean_vote"                 "median_vote"               "votes_10"                 
#[7] "votes_9"                   "votes_8"                   "votes_7"                   "votes_6"                   "votes_5"                   "votes_4"                  
#[13] "votes_3"                   "votes_2"                   "votes_1"                   "allgenders_0age_avg_vote"  "allgenders_0age_votes"     "allgenders_18age_avg_vote"
#[19] "allgenders_18age_votes"    "allgenders_30age_avg_vote" "allgenders_30age_votes"    "allgenders_45age_avg_vote" "allgenders_45age_votes"    "males_allages_avg_vote"   
#[25] "males_allages_votes"       "males_0age_avg_vote"       "males_0age_votes"          "males_18age_avg_vote"      "males_18age_votes"         "males_30age_avg_vote"     
#[31] "males_30age_votes"         "males_45age_avg_vote"      "males_45age_votes"         "females_allages_avg_vote"  "females_allages_votes"     "females_0age_avg_vote"    
#[37] "females_0age_votes"        "females_18age_avg_vote"    "females_18age_votes"       "females_30age_avg_vote"    "females_30age_votes"       "females_45age_avg_vote"   
#[43] "females_45age_votes"       "top1000_voters_rating"     "top1000_voters_votes"      "us_voters_rating"          "us_voters_votes"           "non_us_voters_rating"     
#[49] "non_us_voters_votes" 


str(ratings) #list the structure of data in the ratings data set
#'data.frame':	81273 obs. of  49 variables:
#$ imdb_title_id            : chr  "tt0000574" "tt0001892" "tt0002101" "tt0002130" ...
#$ weighted_average_vote    : num  6.1 5.9 5.2 7 5.7 6.8 6.2 6.7 5.5 6.7 ...
#$ total_votes              : int  537 171 420 2019 438 709 241 187 211 310 ...
#$ mean_vote                : num  6.3 6.1 5.2 6.9 5.8 6.8 6.2 7.1 5.4 6.6 ...
#$ median_vote              : num  6 6 5 7 6 7 6 7 6 7 ...
#$ votes_10                 : int  54 5 12 194 28 79 13 51 9 18 ...
#$ votes_9                  : int  17 6 8 208 15 63 8 7 6 22 ...
#$ votes_8                  : int  55 17 16 386 42 99 27 21 22 63 ...
#$ votes_7                  : int  121 41 60 571 75 198 63 35 31 88 ...
#$ votes_6                  : int  122 52 89 308 114 127 60 27 49 61 ...
#$ votes_5                  : int  98 24 111 153 70 73 35 19 34 21 ...
#$ votes_4                  : int  25 14 58 59 28 25 18 12 22 9 ...
#$ votes_3                  : int  18 5 26 37 18 12 6 6 8 8 ...
#$ votes_2                  : int  12 4 24 19 15 5 2 3 4 5 ...
#$ votes_1                  : int  15 3 16 84 33 28 9 6 26 15 ...
#$ allgenders_0age_avg_vote : num  6 NA NA 7 NA NA NA NA NA NA ...
#$ allgenders_0age_votes    : num  1 NA NA 2 NA NA NA NA NA NA ...
#$ allgenders_18age_avg_vote: num  6.2 5.7 4.6 7 5.7 6.5 5.9 7.2 5.1 6.2 ...
#$ allgenders_18age_votes   : num  126 25 24 429 38 65 34 29 16 36 ...
#$ allgenders_30age_avg_vote: num  5.9 6 5.1 7 5.6 6.6 6.3 6.7 5.5 6.7 ...
#$ allgenders_30age_votes   : num  209 60 104 783 156 264 84 98 88 114 ...
#$ allgenders_45age_avg_vote: num  6.4 6.3 5.3 7.1 5.9 7 6.2 6.6 5.8 7 ...
#$ allgenders_45age_votes   : num  100 58 180 430 147 255 64 35 62 89 ...
#$ males_allages_avg_vote   : num  6.1 6 5 7 5.8 6.7 6.2 6.7 5.5 6.6 ...
#$ males_allages_votes      : num  393 131 278 1464 318 ...
#$ males_0age_avg_vote      : num  6 NA NA 8 NA NA NA NA NA NA ...
#$ males_0age_votes         : num  1 NA NA 1 NA NA NA NA NA NA ...
#$ males_18age_avg_vote     : num  6.2 5.8 4.6 7 5.8 6.5 5.9 7.3 5.4 6.4 ...
#$ males_18age_votes        : num  112 21 20 371 34 49 28 24 15 30 ...
#$ males_30age_avg_vote     : num  5.9 6 5.1 7 5.7 6.5 6.4 6.6 5.3 6.6 ...
#$ males_30age_votes        : num  186 56 89 701 142 220 73 87 80 100 ...
#$ males_45age_avg_vote     : num  6.4 6.3 5.2 7 5.8 6.9 6.2 6.5 5.7 6.8 ...
#$ males_45age_votes        : num  85 50 159 346 131 217 59 29 56 75 ...
#$ females_allages_avg_vote : num  6.1 5.7 5.8 7.2 5.4 7.4 6.1 6.7 6.5 7 ...
#$ females_allages_votes    : num  48 16 39 205 29 93 20 20 15 34 ...
#$ females_0age_avg_vote    : num  NA NA NA 6 NA NA NA NA NA NA ...
#$ females_0age_votes       : num  NA NA NA 1 NA NA NA NA NA NA ...
#$ females_18age_avg_vote   : num  5.7 5.8 4.5 6.8 5 6.3 5.5 5.8 1 4.5 ...
#$ females_18age_votes      : num  14 4 4 53 4 15 6 5 1 6 ...
#$ females_30age_avg_vote   : num  6 5.8 5.5 7.3 4.8 7.2 6.2 7 7.2 6.6 ...
#$ females_30age_votes      : num  19 4 14 74 10 40 9 9 8 13 ...
#$ females_45age_avg_vote   : num  6.6 6.5 6.2 7.4 6.5 8.1 6.2 6.8 9.7 8.1 ...
#$ females_45age_votes      : num  14 8 20 75 15 35 5 6 6 14 ...
#$ top1000_voters_rating    : num  6.3 5.9 4.9 7 5.7 6.3 5.6 5.3 5.3 6.3 ...
#$ top1000_voters_votes     : num  64 29 57 126 56 91 42 25 35 35 ...
#$ us_voters_rating         : num  6 6.2 5.5 7.1 5.9 6.7 5.8 6.7 5.8 7 ...
#$ us_voters_votes          : num  89 27 197 452 161 133 37 23 102 65 ...
#$ non_us_voters_rating     : num  6.2 6 4.7 7 5.7 6.8 6.3 6.7 5.3 6.6 ...
#$ non_us_voters_votes      : num  309 114 103 1076 164 ...


#Step 3.3 - Definition of variables in the boxOffice data set
names(boxOffice) #print the variables in the boxOffice data set
#[1] "rank"           "title"          "studio"         "lifetime_gross" "year" 

str(boxOffice)  #list the structure of data in the boxOffice data set
#'data.frame':	15743 obs. of  5 variables:
#$ rank          : int  1 2 3 4 5 6 7 8 9 10 ...
#$ title         : chr  "Star Wars: The Force Awakens" "Avatar" "Black Panther" "Avengers: Infinity War" ...
#$ studio        : chr  "BV" "Fox" "BV" "BV" ...
#$ lifetime_gross: int  936662225 760507625 700059566 678681680 659363944 652270625 623357910 620181382 597066966 534858444 ...
#$ year          : int  2015 2009 2018 2018 1997 2015 2012 2017 2018 2008 ...


#Step 3.4 Definition of variables in the principals set
names(principals) #print the variables in the principals data set
#[1] "imdb_title_id" "ordering"      "imdb_name_id"  "category"      "job"           "characters"  

str(principals)  #list the structure of data in the principals data set
#data.frame':	377848 obs. of  6 variables:
# $ imdb_title_id: chr  "tt0000574" "tt0000574" "tt0000574" "tt0000574" ...
# $ ordering     : int  1 2 3 4 5 6 7 8 9 10 ...
# $ imdb_name_id : chr  "nm0846887" "nm0846894" "nm3002376" "nm0170118" ...
# $ category     : chr  "actress" "actor" "actor" "actress" ...
# $ job          : chr  "" "" "" "" ...
# $ characters   : chr  "[\"Kate Kelly\"]" "[\"School Master\"]" "[\"Steve Hart\"]" "" ...


#Step 3.5 - Definition of variables in the names data set
names(names)  #print the variables in the names data set
#[1] "imdb_name_id"          "name"                  "birth_name"            "height"                "bio"                   "birth_details"         "birth_year"           
#[8] "date_of_birth"         "place_of_birth"        "death_details"         "death_year"            "date_of_death"         "place_of_death"        "reason_of_death"      
#[15] "spouses"               "divorces"              "spouses_with_children" "children"              "primary_profession"    "known_for_titles"                        

str(names) #list the structure of data in the names data set
#'data.frame':	175719 obs. of  101 variables:
#$ imdb_name_id         : chr  "nm0000001" "nm0000002" "nm0000003" "nm0000004" ...
#$ name                 : chr  "Fred Astaire" "Lauren Bacall" "Brigitte Bardot" "John Belushi" ...
#$ birth_name           : chr  "Frederic Austerlitz Jr." "Betty Joan Perske" "Brigitte Bardot" "John Adam Belushi" ...
#$ height               : chr  "177" "174" "166" "173" ...
#$ bio                  : chr  "Fred Astaire was born in Omaha, Nebraska, to Johanna (Geilus) and Fritz Austerlitz, a brewer. Fred entered show"| __truncated__ "Lauren Bacall was born Betty Joan Perske on September 16, 1924, in New York City. She was the daughter of Natal"| __truncated__ "Brigitte Bardot was born on September 28, 1934 in Paris, France. Her father had an engineering degree and worke"| __truncated__ "John Belushi was born in Chicago, Illinois, USA, on January 24, 1949, to Agnes Demetri (Samaras) and Adam Anast"| __truncated__ ...
#$ birth_details        : chr  "May 10, 1899 in¬ Omaha, Nebraska, USA" "September 16, 1924 in¬ The Bronx, New York City, New York, USA" "September 28, 1934 in¬ Paris, France" "January 24, 1949 in¬ Chicago, Illinois, USA" ...
#$ birth_year           : chr  "1899" "1924" "1934" "1949" ...
#$ date_of_birth        : chr  "1899-05-10" "9/16/1924" "9/28/1934" "1/24/1949" ...
#$ place_of_birth       : chr  "Omaha, Nebraska, USA" "The Bronx, New York City, New York, USA" "Paris, France" "Chicago, Illinois, USA" ...
#$ death_details        : chr  "June 22, 1987 in¬ Los Angeles, California, USA ¬ (pneumonia)" "August 12, 2014 in¬ New York City, New York, USA ¬ (stroke)" "" "March 5, 1982 in¬ Hollywood, Los Angeles, California, USA ¬ (acute cocaine and heroin intoxication)" ...
#$ death_year           : chr  "1987" "2014" "" "1982" ...
#$ date_of_death        : chr  "6/22/1987" "8/12/2014" "" "3/5/1982" ...
#$ place_of_death       : chr  "Los Angeles, California, USA ¬ " "New York City, New York, USA ¬ " "" "Hollywood, Los Angeles, California, USA ¬ " ...
#$ reason_of_death      : chr  "pneumonia" "stroke" "" "acute cocaine and heroin intoxication" ...
#$ spouses              : chr  "2" "2" "4" "1" ...
#$ divorces             : chr  "0" "1" "3" "0" ...
#$ spouses_with_children: chr  "1" "2" "1" "0" ...
#$ children             : chr  "2" "3" "1" "0" ...
#$ primary_profession   : chr  "soundtrack,actor,miscellaneous" "actress,soundtrack" "actress,soundtrack,producer" "actor,writer,soundtrack" ...
#$ known_for_titles     : chr  "tt0050419,tt0053137,tt0072308,tt0043044" "tt0037382,tt0038355,tt0117057,tt0071877" "tt0054452,tt0059956,tt0057345,tt0049189" "tt0078723,tt0072562,tt0080455,tt0077975" ...



#Step 4 - Perform any data transformations you feel are necessary to achieve the desired goals.

#Step 4.1 - Subset the 4 imported files and join them into one data frame

#Step 4.1.1 - Subset the 4 imported files

#Subset 4.1.1.1: Subset movies produced in the USA, and with a minimum budget and number of votes
allFilms <- subset(movies,country == "USA" &
                      votes > 1000 &
                      budget > 5000, 
                    select = c(imdb_title_id, title,year, budget, reviews_from_critics, votes,avg_vote, director, genre, country))

library(dplyr) #load dplyr to use the arrange function
head(arrange(allFilms,desc(budget), desc(reviews_from_critics),desc(avg_vote), desc(votes))) #print head rows in descending order
tail(arrange(allFilms,desc(budget), desc(reviews_from_critics),desc(avg_vote), desc(votes)))#print tail rows in descending order

#> head(arrange(allFilms,desc(budget), desc(reviews_from_critics),desc(avg_vote), desc(votes)))
#imdb_title_id                                    title   budget reviews_from_critics  votes avg_vote year                      genre country
#1     tt4154796                        Avengers: Endgame 3.56e+08                  531 602792      8.5 2019   Action, Adventure, Drama     USA
#2     tt4154756                   Avengers: Infinity War 3.21e+08                  591 725138      8.5 2018  Action, Adventure, Sci-Fi     USA
#3     tt2527336  Star Wars: Episode VIII - The Last Jedi 3.17e+08                  690 482896      7.1 2017 Action, Adventure, Fantasy     USA
#4     tt0449088 Pirates of the Caribbean: At World's End 3.00e+08                  324 566300      7.1 2007 Action, Adventure, Fantasy     USA
#5     tt3778644                  Solo: A Star Wars Story 2.75e+08                  529 242506      6.9 2018  Action, Adventure, Sci-Fi     USA
#6     tt0348150                         Superman Returns 2.70e+08                  443 263165      6.0 2006             Action, Sci-Fi     USA

#> tail(arrange(allFilms,desc(budget), desc(reviews_from_critics),desc(avg_vote), desc(votes)))
#     imdb_title_id                           title budget reviews_from_critics votes avg_vote year                     genre country
#6362     tt2149360                           Found   8000                  108  3489      5.8 2012   Drama, Horror, Thriller     USA
#6363     tt4028134                   Cypress Creek   8000                   10  1778      4.4 2014            Comedy, Horror     USA
#6364     tt0163984 Blood, Guts, Bullets and Octane   7300                   30  1019      5.3 1998     Action, Comedy, Crime     USA
#6365     tt0390384                          Primer   7000                  128 91588      6.9 2004   Drama, Sci-Fi, Thriller     USA
#6366     tt0067055                         Equinox   6500                   63  2658      5.3 1970 Action, Adventure, Horror     USA
#6367     tt2272350                     The Battery   6000                  116  7759      6.4 2012  Adventure, Drama, Horror     USA


#Subset 4.1.1.2: Subset ratings and select the age of movie voters by age range with a minimum number of votes
ratingsbyGenderAge <- subset(ratings, total_votes > 1 & total_votes >1000, 
                             select = c(imdb_title_id, mean_vote, total_votes, 
                                        females_45age_avg_vote, males_45age_avg_vote,
                                        females_30age_avg_vote,males_30age_avg_vote,
                                        females_18age_avg_vote, males_18age_avg_vote,
                                        females_0age_avg_vote,  males_0age_avg_vote))
head(arrange(ratingsbyGenderAge, desc(mean_vote, total_votes)))
tail(arrange(ratingsbyGenderAge, desc(mean_vote, total_votes)))


#> head(arrange(ratingsbyGenderAge, desc(mean_vote, total_votes)))
#  imdb_title_id mean_vote total_votes females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote females_0age_avg_vote males_0age_avg_vote
#1     tt6735740      10.0        2360                   10.0                  9.3                     10                 10.0                   10.0                  7.9                    10                  NA
#2     tt6058226       9.7        2622                    9.7                  4.9                     10                  7.2                    9.9                  9.7                    10                  10
#3     tt9526826       9.7        1176                     NA                  1.0                     NA                  7.2                    8.0                  8.2                    NA                  10
#4     tt0383702       9.6        1030                    3.0                  1.3                      7                  3.5                     NA                  5.2                    NA                  NA
#5     tt0925130       9.6        1148                    2.5                  1.0                     NA                  2.4                   10.0                  4.8                    NA                  NA
#6     tt0929620       9.6        1195                    1.0                  1.4                      4                  3.4                   10.0                  4.3                    NA                  NA

#> tail(arrange(ratingsbyGenderAge, desc(mean_vote, total_votes)))
#      imdb_title_id mean_vote total_votes females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote females_0age_avg_vote males_0age_avg_vote
#28309     tt6038600       1.7        7432                    2.2                  1.9                    1.4                  1.4                    1.8                  1.4                     1                 3.7
#28310     tt0314134       1.6        1132                    2.0                  1.3                    1.5                  1.2                    1.2                  1.5                     1                  NA
#28311     tt2495980       1.6        2558                    5.0                  1.9                    2.8                  1.8                    3.2                  1.3                    NA                 1.0
#28312     tt4404474       1.6        6284                    3.0                  2.1                    2.3                  1.3                    2.4                  1.2                     1                 1.1
#28313     tt1557843       1.5        1292                    3.0                  2.1                    2.7                  2.2                    7.5                  4.8                    NA                 4.0
#28314     tt0074260       1.3        2945                    5.9                  5.1                    2.6                  4.0                    1.0                  2.8                    NA                  NA

#Subset 4.1.1.3: Subset principals and include the IMDB movie title id, the talent ID, and their role on the film
keyTalent <- subset(principals, select = c(imdb_title_id,imdb_name_id,category))
head(keyTalent)

#> head(keyTalent)
#  imdb_title_id imdb_name_id category
#1     tt0000574    nm0846887  actress
#2     tt0000574    nm0846894    actor
#3     tt0000574    nm3002376    actor
#4     tt0000574    nm0170118  actress
#5     tt0000574    nm0846879 director
#6     tt0000574    nm0317210 producer


#Subset 4.1.1.4: Subset the names data set to remove variables not needed
#as will later need only the names of the writers and directors once joined with the principals data frame
allNames <-subset(names, select = c(imdb_name_id, name, known_for_titles))
head(allNames)

#> head(allNames)
#  imdb_name_id            name                        known_for_titles
#1    nm0000001    Fred Astaire tt0050419,tt0053137,tt0072308,tt0043044
#2    nm0000002   Lauren Bacall tt0037382,tt0038355,tt0117057,tt0071877
#3    nm0000003 Brigitte Bardot tt0054452,tt0059956,tt0057345,tt0049189
#4    nm0000004    John Belushi tt0078723,tt0072562,tt0080455,tt0077975
#5    nm0000005  Ingmar Bergman tt0050976,tt0083922,tt0069467,tt0050986
#6    nm0000006  Ingrid Bergman tt0038109,tt0036855,tt0077711,tt0038787

#Use the stringr library to remove the first 2 letters of the imdb_name_id, so that this variable can be 
#converted to a numeric and used in quantitative calculations for machine learning
library(stringr)
allNames$last_7_stringName  <- str_sub(allNames$imdb_name_id,-7)
head(allNames)

#  imdb_name_id            name                        known_for_titles last_7_stringName
#1    nm0000001    Fred Astaire tt0050419,tt0053137,tt0072308,tt0043044           0000001
#2    nm0000002   Lauren Bacall tt0037382,tt0038355,tt0117057,tt0071877           0000002
#3    nm0000003 Brigitte Bardot tt0054452,tt0059956,tt0057345,tt0049189           0000003
#4    nm0000004    John Belushi tt0078723,tt0072562,tt0080455,tt0077975           0000004
#5    nm0000005  Ingmar Bergman tt0050976,tt0083922,tt0069467,tt0050986           0000005
#6    nm0000006  Ingrid Bergman tt0038109,tt0036855,tt0077711,tt0038787           0000006

#Subset 4.1.1.5: Trim the box office; main variable will be life_time gross for machine learning
#note: The trim also excludes the year as this produces a second year variable in later joins without doing so
trimBoxOffice <- subset(boxOffice, select = c(title,lifetime_gross, studio)) 
head(arrange(trimBoxOffice, desc(lifetime_gross)))
tail(arrange(trimBoxOffice, desc(lifetime_gross)))

#> head(arrange(trimBoxOffice, desc(lifetime_gross)))
#                         title lifetime_gross studio
#1 Star Wars: The Force Awakens      936662225     BV
#2                       Avatar      760507625    Fox
#3                Black Panther      700059566     BV
#4       Avengers: Infinity War      678681680     BV
#5                      Titanic      659363944   Par.
#6               Jurassic World      652270625   Uni.

#> tail(arrange(trimBoxOffice, desc(lifetime_gross)))
#                                     title lifetime_gross studio
#15738                        The Objective             95    IFC
#15739                          Dog Eat Dog             80    IFC
#15740                       Paranoid Girls             78    N/A
#15741 Confession of a Child of the Century             74  Cohen
#15742                           Storage 24             72  Magn.
#15743                          Zyzzyx Road             30   Reg.


#Step 4.2 - Join the 4 data frames subsetted in Step 4.1
#Join the all four data data frames associated with movies, ratings, principals, and box office

#Join 4.2.1: Join allFilms in subset 4.1.1.1 with ratingsbyGenderAge in subset 4.1.1.2
moviesRatings <- left_join(allFilms,ratingsbyGenderAge, by = 'imdb_title_id' ) 
head(moviesRatings)

#Join 4.2.2: Join movieRatings with the keyTalent data frame in subset 4.1.1.3
movieRatingsPrincipals <- left_join(moviesRatings, keyTalent, by = 'imdb_title_id') 
head(movieRatingsPrincipals)

#Join 4.2.3: Join movieRatingsPrincipals with the allNames data frame in subset 4.1.1.4
movieRatingsPrincipalsNames <- left_join(movieRatingsPrincipals, allNames, by = 'imdb_name_id')
head(movieRatingsPrincipalsNames)

#Join 4.2.4: Join movieRatingsPrincipalsNames with the trimBoxOffice data frame in subset 4.1.1.5
movieRatingsPrincipalsNamesBoxOffice <- left_join(movieRatingsPrincipalsNames, trimBoxOffice, by = 'title')
head(movieRatingsPrincipalsNamesBoxOffice)

#Step 4.2.5 - Print Joins 4.2.1 to 4.2.4
head(arrange(movieRatingsPrincipalsNamesBoxOffice, desc(lifetime_gross)))
tail(arrange(movieRatingsPrincipalsNamesBoxOffice, desc(lifetime_gross)))

#> head(arrange(movieRatingsPrincipalsNamesBoxOffice, desc(lifetime_gross)))
#  imdb_title_id         title year   budget reviews_from_critics   votes avg_vote      director                      genre country mean_vote total_votes females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote females_0age_avg_vote males_0age_avg_vote imdb_name_id category              name                        known_for_titles last_7_stringName lifetime_gross studio
#1     tt0499549        Avatar 2009 2.37e+08                  727 1066602      7.8 James Cameron Action, Adventure, Fantasy     USA       7.8     1066602                    7.9                  7.9                    7.8                  7.9                    7.6                  7.7                   7.7                 7.6         <NA>     <NA>              <NA>                                    <NA>              <NA>      760507625    Fox
#2     tt1825683 Black Panther 2018 2.00e+08                  664  551245      7.3  Ryan Coogler  Action, Adventure, Sci-Fi     USA       7.4      551245                    7.8                  7.0                    7.6                  7.0                    7.9                  7.3                   8.2                 7.6    nm1569276    actor  Chadwick Boseman tt0453562,tt1825683,tt4154756,tt3498820           1569276      700059566     BV
#3     tt1825683 Black Panther 2018 2.00e+08                  664  551245      7.3  Ryan Coogler  Action, Adventure, Sci-Fi     USA       7.4      551245                    7.8                  7.0                    7.6                  7.0                    7.9                  7.3                   8.2                 7.6    nm0430107    actor Michael B. Jordan tt2334649,tt1502712,tt3076658,tt1825683           0430107      700059566     BV
#4     tt1825683 Black Panther 2018 2.00e+08                  664  551245      7.3  Ryan Coogler  Action, Adventure, Sci-Fi     USA       7.4      551245                    7.8                  7.0                    7.6                  7.0                    7.9                  7.3                   8.2                 7.6    nm2143282  actress    Lupita Nyong'o tt2024544,tt3040964,tt1825683,tt2488496           2143282      700059566     BV
#5     tt1825683 Black Panther 2018 2.00e+08                  664  551245      7.3  Ryan Coogler  Action, Adventure, Sci-Fi     USA       7.4      551245                    7.8                  7.0                    7.6                  7.0                    7.9                  7.3                   8.2                 7.6    nm1775091  actress      Danai Gurira tt0857191,tt4154756,tt4154796,tt1825683           1775091      700059566     BV
#6     tt1825683 Black Panther 2018 2.00e+08                  664  551245      7.3  Ryan Coogler  Action, Adventure, Sci-Fi     USA       7.4      551245                    7.8                  7.0                    7.6                  7.0                    7.9                  7.3                   8.2                 7.6    nm3363032 director      Ryan Coogler tt3076658,tt2334649,tt6343314,tt1825683           3363032      700059566     BV

#> tail(arrange(movieRatingsPrincipalsNamesBoxOffice, desc(lifetime_gross)))
#      imdb_title_id title year budget reviews_from_critics votes avg_vote               director  genre country mean_vote total_votes females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote females_0age_avg_vote males_0age_avg_vote imdb_name_id        category                 name                        known_for_titles last_7_stringName lifetime_gross studio
#33854     tt9354944  Jexi 2019  5e+06                   24  3674      6.6 Jon Lucas, Scott Moore Comedy     USA       7.4        3674                    6.1                  5.7                      6                  5.8                    5.9                  5.6                    NA                 5.3    nm0524190        director            Jon Lucas tt1119646,tt1711425,tt6359956,tt4651520           0524190             NA   <NA>
#33855     tt9354944  Jexi 2019  5e+06                   24  3674      6.6 Jon Lucas, Scott Moore Comedy     USA       7.4        3674                    6.1                  5.7                      6                  5.8                    5.9                  5.6                    NA                 5.3    nm0601859        director          Scott Moore tt1488555,tt1119646,tt1711425,tt4651520           0601859             NA   <NA>
#33856     tt9354944  Jexi 2019  5e+06                   24  3674      6.6 Jon Lucas, Scott Moore Comedy     USA       7.4        3674                    6.1                  5.7                      6                  5.8                    5.9                  5.6                    NA                 5.3    nm0865297        producer         Suzanne Todd tt0445922,tt0209144,tt0102070,tt0181984           0865297             NA   <NA>
#33857     tt9354944  Jexi 2019  5e+06                   24  3674      6.6 Jon Lucas, Scott Moore Comedy     USA       7.4        3674                    6.1                  5.7                      6                  5.8                    5.9                  5.6                    NA                 5.3    nm0501999        composer Christopher Lennertz tt1190634,tt1700841,tt4765284,tt5232792           0501999             NA   <NA>
#33858     tt9354944  Jexi 2019  5e+06                   24  3674      6.6 Jon Lucas, Scott Moore Comedy     USA       7.4        3674                    6.1                  5.7                      6                  5.8                    5.9                  5.6                    NA                 5.3    nm2149175        composer         Philip White tt7054636,tt8097306,tt0460681,tt9354944           2149175             NA   <NA>
#33859     tt9354944  Jexi 2019  5e+06                   24  3674      6.6 Jon Lucas, Scott Moore Comedy     USA       7.4        3674                    6.1                  5.7                      6                  5.8                    5.9                  5.6                    NA                 5.3    nm1266267 cinematographer         Ben Kutchins tt3502172,tt5071412,tt2064968,tt3268340           1266267             NA   <NA>


#Step 4.3 Trim and arrange the data frame joined in step 4.2; convert characters to numeric class for machine learning

#Step 4.3.1 - Subset the data frame joined in step 4.2
trimmedFilms <- subset(movieRatingsPrincipalsNamesBoxOffice, country == "USA" &
                         votes > 3000 &
                         avg_vote > 7 &
                         year > 2010 &
                         budget > 1000 &
                         lifetime_gross > 1000000,
                        select = c(title, genre, name, director, year,lifetime_gross, budget, 
                                   reviews_from_critics,votes, avg_vote,
                                   females_45age_avg_vote, males_45age_avg_vote,
                                   females_30age_avg_vote,males_30age_avg_vote,
                                   females_18age_avg_vote, males_18age_avg_vote,
                                   females_0age_avg_vote,  males_0age_avg_vote))
                        

head(arrange(trimmedFilms, desc(lifetime_gross)))
tail(arrange(trimmedFilms, desc(lifetime_gross)))

#> head(arrange(trimmedFilms, desc(lifetime_gross)))

#> head(arrange(orderProfitColumn,desc(profitMargin), desc(lifetime_gross),desc(budget),desc(avg_vote), desc(reviews_from_critics)))
#               title                     genre              name                director profitMargin lifetime_gross budget year reviews_from_critics votes avg_vote females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote
#1  Fruitvale Station Biography, Drama, Romance              <NA>            Ryan Coogler    0.9441040       16101339  9e+05 2013                  322 69507      7.5                    7.6                  7.1                    7.4                  7.3                    7.8                  7.7
#2 I Can Only Imagine  Biography, Drama, Family J. Michael Finley Andrew Erwin, Jon Erwin    0.9161499       83482352  7e+06 2018                   50 12244      7.4                    8.4                  7.3                    7.7                  6.8                    8.0                  7.2
#3 I Can Only Imagine  Biography, Drama, Family  Madeline Carroll Andrew Erwin, Jon Erwin    0.9161499       83482352  7e+06 2018                   50 12244      7.4                    8.4                  7.3                    7.7                  6.8                    8.0                  7.2
#4 I Can Only Imagine  Biography, Drama, Family      Dennis Quaid Andrew Erwin, Jon Erwin    0.9161499       83482352  7e+06 2018                   50 12244      7.4                    8.4                  7.3                    7.7                  6.8                    8.0                  7.2
#5 I Can Only Imagine  Biography, Drama, Family      Trace Adkins Andrew Erwin, Jon Erwin    0.9161499       83482352  7e+06 2018                   50 12244      7.4                    8.4                  7.3                    7.7                  6.8                    8.0                  7.2
#6 I Can Only Imagine  Biography, Drama, Family      Andrew Erwin Andrew Erwin, Jon Erwin    0.9161499       83482352  7e+06 2018                   50 12244      7.4                    8.4                  7.3                    7.7                  6.8                    8.0                  7.2

#> tail(arrange(orderProfitColumn,desc(profitMargin), desc(lifetime_gross),desc(budget),desc(avg_vote), desc(reviews_from_critics)))
#                title                   genre         name           director profitMargin lifetime_gross  budget year reviews_from_critics  votes avg_vote females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote
#873          99 Homes                   Drama Justin Nappi      Ramin Bahrani    -4.666015        1411927 8.0e+06 2014                  210  27471      7.1                    7.1                  7.0                    7.0                  7.0                    7.0                  7.3
#874          99 Homes                   Drama  Kevin Turen      Ramin Bahrani    -4.666015        1411927 8.0e+06 2014                  210  27471      7.1                    7.1                  7.0                    7.0                  7.0                    7.0                  7.3
#875     A Better Life          Drama, Romance         <NA>        Chris Weitz    -4.684234        1759252 1.0e+07 2011                   92  14738      7.2                    7.4                  7.1                    7.3                  7.1                    7.6                  7.3
#876        Disconnect         Drama, Thriller         <NA>   Henry Alex Rubin    -5.959427        1436900 1.0e+07 2012                  128  70769      7.5                    7.6                  7.4                    7.4                  7.5                    7.7                  7.7
#877    A Star Is Born   Drama, Music, Romance         <NA>     Bradley Cooper    -7.302644        4335968 3.6e+07 2018                  458 284195      7.7                    7.9                  7.5                    7.7                  7.5                    7.8                  7.8
#878 Kill the Irishman Biography, Crime, Drama         <NA> Jonathan Hensleigh    -9.099361        1188194 1.2e+07 2011                   83  42699      7.1                    7.2                  7.0                    6.7                  7.1                    7.0                  7.3


#Step 4.3.2 - Convert to the data frame to numeric to prepare for EDA and machine learning
trimmedFilms[5:16] <- lapply(trimmedFilms[5:16], as.numeric) 


#Step 4.3.3 - Calculate the profit margin for each film
trimmedFilms$profitMargin <- (trimmedFilms$lifetime_gross - trimmedFilms$budget) / trimmedFilms$lifetime_gross

#Step 4.3.4 - Rearrange the columns of trimmed films to move profit margin nearest the budget; removed votes from ages 17 and under as there were numerous missing values
orderProfitColumn <- subset(trimmedFilms, lifetime_gross > 1000000,
                       select = c(title, genre, name, director,profitMargin,lifetime_gross,budget, year,
                       reviews_from_critics,votes, avg_vote,
                       females_45age_avg_vote, males_45age_avg_vote,
                       females_30age_avg_vote,males_30age_avg_vote,
                       females_18age_avg_vote, males_18age_avg_vote))


#Step 4.3.6 - Arrange and sort the data subsetted in step 4.3.4 to view the films with the highest profit margin from 2010 to 2019 and gross above $1M
library(dplyr) #load dplyr to use the arrange function
head(arrange(orderProfitColumn,desc(profitMargin), desc(lifetime_gross),desc(budget),desc(avg_vote), desc(reviews_from_critics))) 
tail(arrange(orderProfitColumn,desc(profitMargin), desc(lifetime_gross),desc(budget),desc(avg_vote), desc(reviews_from_critics)))

#               title                     genre              name                director profitMargin lifetime_gross budget year reviews_from_critics votes avg_vote females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote
#1  Fruitvale Station Biography, Drama, Romance              <NA>            Ryan Coogler    0.9441040       16101339  9e+05 2013                  322 69507      7.5                    7.6                  7.1                    7.4                  7.3                    7.8                  7.7
#2 I Can Only Imagine  Biography, Drama, Family J. Michael Finley Andrew Erwin, Jon Erwin    0.9161499       83482352  7e+06 2018                   50 12244      7.4                    8.4                  7.3                    7.7                  6.8                    8.0                  7.2
#3 I Can Only Imagine  Biography, Drama, Family  Madeline Carroll Andrew Erwin, Jon Erwin    0.9161499       83482352  7e+06 2018                   50 12244      7.4                    8.4                  7.3                    7.7                  6.8                    8.0                  7.2
#4 I Can Only Imagine  Biography, Drama, Family      Dennis Quaid Andrew Erwin, Jon Erwin    0.9161499       83482352  7e+06 2018                   50 12244      7.4                    8.4                  7.3                    7.7                  6.8                    8.0                  7.2
#5 I Can Only Imagine  Biography, Drama, Family      Trace Adkins Andrew Erwin, Jon Erwin    0.9161499       83482352  7e+06 2018                   50 12244      7.4                    8.4                  7.3                    7.7                  6.8                    8.0                  7.2
#6 I Can Only Imagine  Biography, Drama, Family      Andrew Erwin Andrew Erwin, Jon Erwin    0.9161499       83482352  7e+06 2018                   50 12244      7.4                    8.4                  7.3                    7.7                  6.8                    8.0                  7.2

#> tail(arrange(orderProfitColumn,desc(profitMargin), desc(lifetime_gross),desc(budget),desc(avg_vote), desc(reviews_from_critics)))
#                title                   genre         name           director profitMargin lifetime_gross  budget year reviews_from_critics  votes avg_vote females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote
#873          99 Homes                   Drama Justin Nappi      Ramin Bahrani    -4.666015        1411927 8.0e+06 2014                  210  27471      7.1                    7.1                  7.0                    7.0                  7.0                    7.0                  7.3
#874          99 Homes                   Drama  Kevin Turen      Ramin Bahrani    -4.666015        1411927 8.0e+06 2014                  210  27471      7.1                    7.1                  7.0                    7.0                  7.0                    7.0                  7.3
#875     A Better Life          Drama, Romance         <NA>        Chris Weitz    -4.684234        1759252 1.0e+07 2011                   92  14738      7.2                    7.4                  7.1                    7.3                  7.1                    7.6                  7.3
#876        Disconnect         Drama, Thriller         <NA>   Henry Alex Rubin    -5.959427        1436900 1.0e+07 2012                  128  70769      7.5                    7.6                  7.4                    7.4                  7.5                    7.7                  7.7
#877    A Star Is Born   Drama, Music, Romance         <NA>     Bradley Cooper    -7.302644        4335968 3.6e+07 2018                  458 284195      7.7                    7.9                  7.5                    7.7                  7.5                    7.8                  7.8
#878 Kill the Irishman Biography, Crime, Drama         <NA> Jonathan Hensleigh    -9.099361        1188194 1.2e+07 2011                   83  42699      7.1                    7.2                  7.0                    6.7                  7.1                    7.0                  7.3



#Step 5 - Use various EDA and simple statistical analysis techniques to gain a deep understanding for the data.

#Step 5.1 Understand the scope of the data set of both qualitative and quantitative data

#Step 5.1.1 Understand the qualitative variables and values

#Step 5.1.1.1 Understand the levels of genres and variations
genreLevels <- factor(orderProfitColumn$genre) #Shows that there are 54 levels and variations of genre
genreLevels

#54 Levels: Action, Adventure, Comedy Action, Adventure, Fantasy Action, Adventure, Sci-Fi Action, Biography, Drama Action, Comedy, Crime Action, Crime, Drama Action, Crime, Thriller ... Sci-Fi, Thriller

table(genreLevels) #Shows the frequency of the factor values, and in this case, the number of occurrences of genres. In this case, the highest 
#frequencies were in Action, Adventure, Sci-Fi (81), Drama (73), Animation, Adventure, Comedy (46),  Comedy, Drama, Romance (44), and Action, Adventure, Comedy (43).

#Action, Adventure, Comedy   Action, Adventure, Fantasy    Action, Adventure, Sci-Fi     Action, Biography, Drama        Action, Comedy, Crime         Action, Crime, Drama      Action, Crime, Thriller        Action, Drama, Sci-Fi  Adventure, Biography, Drama 
#                       43                           10                           81                           11                           20                           12                           20                           10                           10 
#Adventure, Comedy, Drama    Adventure, Comedy, Family    Adventure, Drama, Fantasy   Adventure, Family, Fantasy Animation, Action, Adventure Animation, Adventure, Comedy Animation, Adventure, Family    Animation, Comedy, Family     Biography, Comedy, Drama 
#                      18                            1                           10                            1                           33                           46                            1                            1                           21 
#Biography, Crime, Drama             Biography, Drama     Biography, Drama, Family    Biography, Drama, History      Biography, Drama, Music    Biography, Drama, Musical    Biography, Drama, Romance      Biography, Drama, Sport   Biography, Drama, Thriller 
#                     23                           21                           11                           12                            1                           10                            1                           33                           10 
#Biography, Family, Sport         Comedy, Crime, Drama                Comedy, Drama        Comedy, Drama, Family       Comedy, Drama, Fantasy         Comedy, Drama, Music       Comedy, Drama, Romance       Comedy, Music, Romance                 Crime, Drama 
#                       1                            2                           26                           10                           10                           10                           44                           10                           31 
#Crime, Drama, History        Crime, Drama, Mystery       Crime, Drama, Thriller                        Drama       Drama, Horror, Mystery        Drama, Horror, Sci-Fi      Drama, Horror, Thriller                 Drama, Music        Drama, Music, Romance 
#                    1                           20                           31                           73                           11                           10                           10                           10                            1 
#Drama, Mystery, Thriller               Drama, Romance                 Drama, Sport              Drama, Thriller               Drama, Western     Family, Fantasy, Musical    Horror, Mystery, Thriller                        Music             Sci-Fi, Thriller 
#                      10                           11                            2                           22                           20                            1                           10                           10                           10 
 
unclass(genreLevels)
#[1] "Action, Adventure, Comedy"    "Action, Adventure, Fantasy"   "Action, Adventure, Sci-Fi"    "Action, Biography, Drama"     "Action, Comedy, Crime"        "Action, Crime, Drama"         "Action, Crime, Thriller"      "Action, Drama, Sci-Fi"        "Adventure, Biography, Drama" 
#[10] "Adventure, Comedy, Drama"     "Adventure, Comedy, Family"    "Adventure, Drama, Fantasy"    "Adventure, Family, Fantasy"   "Animation, Action, Adventure" "Animation, Adventure, Comedy" "Animation, Adventure, Family" "Animation, Comedy, Family"    "Biography, Comedy, Drama"    
#[19] "Biography, Crime, Drama"      "Biography, Drama"             "Biography, Drama, Family"     "Biography, Drama, History"    "Biography, Drama, Music"      "Biography, Drama, Musical"    "Biography, Drama, Romance"    "Biography, Drama, Sport"      "Biography, Drama, Thriller"  
#[28] "Biography, Family, Sport"     "Comedy, Crime, Drama"         "Comedy, Drama"                "Comedy, Drama, Family"        "Comedy, Drama, Fantasy"       "Comedy, Drama, Music"         "Comedy, Drama, Romance"       "Comedy, Music, Romance"       "Crime, Drama"                
#[37] "Crime, Drama, History"        "Crime, Drama, Mystery"        "Crime, Drama, Thriller"       "Drama"                        "Drama, Horror, Mystery"       "Drama, Horror, Sci-Fi"        "Drama, Horror, Thriller"      "Drama, Music"                 "Drama, Music, Romance"       
#[46] "Drama, Mystery, Thriller"     "Drama, Romance"               "Drama, Sport"                 "Drama, Thriller"              "Drama, Western"               "Family, Fantasy, Musical"     "Horror, Mystery, Thriller"    "Music"                        "Sci-Fi, Thriller"  


#Step 5.1.1.2 - Select drama genres to understand profits and target audience (gender and age) for this genre
dramaticFilms <- subset(orderProfitColumn, lifetime_gross > 1000000 & 
                              genre == "Drama" | genre == "Biography, Comedy, Drama" |
                              genre ==  "Comedy, Drama" | genre == "Biography, Drama, History" | genre == "Biography, Drama",
                              select = c(title, genre, name, director, year,profitMargin,lifetime_gross,budget,
                                       reviews_from_critics,votes, avg_vote,
                                       females_45age_avg_vote, males_45age_avg_vote,
                                       females_30age_avg_vote,males_30age_avg_vote,
                                       females_18age_avg_vote, males_18age_avg_vote))

head(arrange(dramaticFilms,desc(profitMargin), desc(lifetime_gross),desc(budget),desc(avg_vote), desc(reviews_from_critics))) 
tail(arrange(dramaticFilms,desc(profitMargin), desc(lifetime_gross),desc(budget),desc(avg_vote), desc(reviews_from_critics))) 


#> head(arrange(dramaticFilms,desc(profitMargin), desc(lifetime_gross),desc(budget),desc(avg_vote), desc(reviews_from_critics))) 
#title                     genre              name       director year profitMargin lifetime_gross  budget reviews_from_critics  votes avg_vote females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote
#1 Hidden Figures Biography, Drama, History  Taraji P. Henson Theodore Melfi 2016    0.8526007      169607287 2.5e+07                  418 177833      7.8                    8.4                  7.8                    8.1                  7.6                    8.3                  7.7
#2 Hidden Figures Biography, Drama, History   Octavia Spencer Theodore Melfi 2016    0.8526007      169607287 2.5e+07                  418 177833      7.8                    8.4                  7.8                    8.1                  7.6                    8.3                  7.7
#3 Hidden Figures Biography, Drama, History    Janelle Mon√°e Theodore Melfi 2016    0.8526007      169607287 2.5e+07                  418 177833      7.8                    8.4                  7.8                    8.1                  7.6                    8.3                  7.7
#4 Hidden Figures Biography, Drama, History     Kevin Costner Theodore Melfi 2016    0.8526007      169607287 2.5e+07                  418 177833      7.8                    8.4                  7.8                    8.1                  7.6                    8.3                  7.7
#5 Hidden Figures Biography, Drama, History    Theodore Melfi Theodore Melfi 2016    0.8526007      169607287 2.5e+07                  418 177833      7.8                    8.4                  7.8                    8.1                  7.6                    8.3                  7.7
#6 Hidden Figures Biography, Drama, History Allison Schroeder Theodore Melfi 2016    0.8526007      169607287 2.5e+07                  418 177833      7.8                    8.4                  7.8                    8.1                  7.6                    8.3                  7.7

#> tail(arrange(dramaticFilms,desc(profitMargin), desc(lifetime_gross),desc(budget),desc(avg_vote), desc(reviews_from_critics))) 
#title genre           name      director year profitMargin lifetime_gross budget reviews_from_critics votes avg_vote females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote
#148 99 Homes Drama  Ramin Bahrani Ramin Bahrani 2014    -4.666015        1411927  8e+06                  210 27471      7.1                    7.1                    7                      7                    7                      7                  7.3
#149 99 Homes Drama  Bahareh Azimi Ramin Bahrani 2014    -4.666015        1411927  8e+06                  210 27471      7.1                    7.1                    7                      7                    7                      7                  7.3
#150 99 Homes Drama    Amir Naderi Ramin Bahrani 2014    -4.666015        1411927  8e+06                  210 27471      7.1                    7.1                    7                      7                    7                      7                  7.3
#151 99 Homes Drama Ashok Amritraj Ramin Bahrani 2014    -4.666015        1411927  8e+06                  210 27471      7.1                    7.1                    7                      7                    7                      7                  7.3
#152 99 Homes Drama   Justin Nappi Ramin Bahrani 2014    -4.666015        1411927  8e+06                  210 27471      7.1                    7.1                    7                      7                    7                      7                  7.3
#153 99 Homes Drama    Kevin Turen Ramin Bahrani 2014    -4.666015        1411927  8e+06                  210 27471      7.1                    7.1                    7                      7                    7                      7                  7.3


#Step 5.2 Show the correlation between variables for the dramatic films data frame
cor(dramaticFilms[ ,-1:-4]) #calculate a correlation matrix of the data 

#> cor(dramaticFilms[ ,-1:-4]) 
#                               year profitMargin lifetime_gross       budget reviews_from_critics      votes    avg_vote females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote
#year                    1.000000000   0.37403454      0.3235386  0.051463311          -0.11094913 -0.1584772 -0.01080615            0.001475951          -0.02564282              0.1586655          0.013731307              0.1469131          -0.09764040
#profitMargin            0.374034538   1.00000000      0.3583297  0.098710643           0.49525419  0.4157776  0.35599512            0.243306518           0.29912017              0.2526720          0.357675929              0.2861489           0.22982913
#lifetime_gross          0.323538590   0.35832971      1.0000000  0.656693497           0.33731772  0.2745095  0.34617863            0.620456372           0.46784163              0.5769573          0.351450186              0.5450152           0.13308671
#budget                  0.051463311   0.09871064      0.6566935  1.000000000           0.25978887  0.2207023 -0.03375660            0.092151393          -0.03380329              0.0482157          0.005064591              0.1034771          -0.03241311
#reviews_from_critics   -0.110949134   0.49525419      0.3373177  0.259788868           1.00000000  0.6982905  0.54881569            0.095715441           0.30047369              0.1425102          0.523310360              0.2448687           0.63326243
#votes                  -0.158477197   0.41577764      0.2745095  0.220702311           0.69829046  1.0000000  0.82412415            0.384021096           0.60965301              0.5009791          0.804532781              0.6327401           0.79249876
#avg_vote               -0.010806146   0.35599512      0.3461786 -0.033756605           0.54881569  0.8241241  1.00000000            0.606771385           0.80951150              0.7810776          0.980218533              0.8401391           0.89570007
#females_45age_avg_vote  0.001475951   0.24330652      0.6204564  0.092151393           0.09571544  0.3840211  0.60677138            1.000000000           0.92009314              0.9155899          0.637016008              0.7487366           0.24492924
#males_45age_avg_vote   -0.025642824   0.29912017      0.4678416 -0.033803292           0.30047369  0.6096530  0.80951150            0.920093144           1.00000000              0.9096783          0.844889861              0.7827810           0.52340830
#females_30age_avg_vote  0.158665487   0.25267199      0.5769573  0.048215695           0.14251019  0.5009791  0.78107757            0.915589922           0.90967834              1.0000000          0.796259799              0.9144345           0.48067838
#males_30age_avg_vote    0.013731307   0.35767593      0.3514502  0.005064591           0.52331036  0.8045328  0.98021853            0.637016008           0.84488986              0.7962598          1.000000000              0.8021388           0.86143350
#females_18age_avg_vote  0.146913104   0.28614887      0.5450152  0.103477089           0.24486871  0.6327401  0.84013905            0.748736592           0.78278101              0.9144345          0.802138801              1.0000000           0.63632170
#males_18age_avg_vote   -0.097640404   0.22982913      0.1330867 -0.032413113           0.63326243  0.7924988  0.89570007            0.244929241           0.52340830              0.4806784          0.861433495              0.6363217           1.00000000


#For the main goal of the project in regards to box office profits, the above matrix shows that there is a moderately strong correlation
#between the lifetime gross profits and the following: 1) the budget (66%) and 2) average vote from females ages 45 and above (62%). There is a moderate correlation 
#between the lifetime gross profits and the following: 1) average vote from females ages 30 to 44 (58%) and 2) average vote from females ages 18 to 29 (55%).
#In addition, there is a moderate correlation between the profit margin and number of reviews from critics (50%). The weakest correlation for profit margin are males ages 18 to 29 (22%).
#The weakest correlation for the life time gross profits are average votes from males ages 18 to 29 (13%).

#It is interesting to note that the number of reviews from critics has a strong correlation to the number of votes (70%).  The correction between reviews from critics and males 
#is moderately strong with the average vote of males ages 18 to 29 (63%), moderate for #males 30 to 44 (52%), and weak for males 45 and above (30%). 
#There is a strong correlation between the number of votes and the average vote (82%). The other correlations are not a factor of lifetime gross revenues and 
#will not be evaluated for this matrix.

#Step 5.2 Calculate the summary data and mean, min, and max values of the lifetime gross variable in the dramatic films data frame

#Step 5.2.1 Calculate the mean, max, and min values of the lifetime gross variable 
mean(dramaticFilms$lifetime_gross, na.rm=TRUE) #Remove NAs, calculate mean life time gross proceeds  - 38.6M average gross 
#[1] 38637016 

min(dramaticFilms$lifetime_gross, na.rm=TRUE) #Remove NAs,  calculate lowest life time gross proceeds - $1M minimum gross 
#[1] 1066471

max(dramaticFilms$lifetime_gross, na.rm=TRUE) #Remove NAs,  calculate maximum life time gross proceeds - $169.6M maximum gross 
#[1] 169607287 

range(dramaticFilms$lifetime_gross, na.rm=TRUE) #Remove NAs, calculate the range $1M minimum proceeds to $169.6M maximum gross 
#[1]   1066471 169607287

quantile(dramaticFilms$lifetime_gross, na.rm=TRUE) #Remove NAs, compute the quartile values
#     0%       25%       50%       75%      100% 
#1066471  12480476  21120616  47695371 169607287 

#Step 5.2.2 Calculate the summary of the dramatic films data frame
summary(dramaticFilms[ ,-1:-5]) #remove column 5 (the year) as this did not show a strong correlation

#> summary(dramaticFilms[ ,-1:-5])
#profitMargin     lifetime_gross          budget         reviews_from_critics     votes           avg_vote     females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote
#Min.   :-4.6660   Min.   :  1066471   Min.   : 1000000   Min.   :107.0        Min.   : 25476   Min.   :7.100   Min.   :6.400          Min.   :6.500        Min.   :6.600          Min.   :7.000        Min.   :7.000          Min.   :7.200       
#1st Qu.: 0.2673   1st Qu.: 12480476   1st Qu.: 6000000   1st Qu.:221.0        1st Qu.: 40171   1st Qu.:7.200   1st Qu.:7.100          1st Qu.:7.000        1st Qu.:7.200          1st Qu.:7.100        1st Qu.:7.300          1st Qu.:7.500       
#Median : 0.5368   Median : 21120616   Median :10000000   Median :378.0        Median :137130   Median :7.400   Median :7.400          Median :7.300        Median :7.300          Median :7.300        Median :7.500          Median :7.600       
#Mean   :-0.1599   Mean   : 38637016   Mean   :14503268   Mean   :360.7        Mean   :152690   Mean   :7.461   Mean   :7.402          Mean   :7.272        Mean   :7.352          Mean   :7.342        Mean   :7.548          Mean   :7.622       
#3rd Qu.: 0.8334   3rd Qu.: 47695371   3rd Qu.:13000000   3rd Qu.:449.0        3rd Qu.:211775   3rd Qu.:7.800   3rd Qu.:7.600          3rd Qu.:7.500        3rd Qu.:7.600          3rd Qu.:7.600        3rd Qu.:7.700          3rd Qu.:7.700       
#Max.   : 0.8526   Max.   :169607287   Max.   :60000000   Max.   :576.0        Max.   :430115   Max.   :8.000   Max.   :8.400          Max.   :7.800        Max.   :8.100          Max.   :7.900        Max.   :8.300          Max.   :8.100  


#The observations above show that the mean profit margin of dramatic films with an average vote of 7 or above and that were released 
#between 2010 and 2019 had a negative 15% profit margin; however, the median profit margin was 53%. The mean budget was $14.5M and 
#the median budget was $10M for dramatic films. Females had a higher average vote than males, and younger males had a higher average 
#vote than older males. Per the correlation of 63% for the average vote of males 18 to 29 and number of reviews from critics, there is a 
#possibility that younger males had a higher average vote because they were influenced by reading reviews from critics.


apply(dramaticFilms[-1:-5],2,var) # Check the variances of the variables
#profitMargin         lifetime_gross                 budget   reviews_from_critics                  votes               avg_vote females_45age_avg_vote   males_45age_avg_vote females_30age_avg_vote   males_30age_avg_vote females_18age_avg_vote   males_18age_avg_vote 
#3.256270e+00           2.226550e+15           2.180674e+14           1.553655e+04           1.337216e+10           8.225318e-02           1.874303e-01           1.088760e-01           1.240927e-01           7.574905e-02           1.336954e-01           8.660819e-02 


#Step 5.2.3 - Calculate the Principal Component Analysis (PCA) to examine whether to reduce the dimensions and remove variable from the data set 
dramaticFilms_pca <- prcomp(dramaticFilms[,-1:-5], scale = T)

#Step 5.2.3.1 - PCA Compare mean variables
dramaticFilms_pca$center # Compare the mean of the variables in the summary with the pca center component
#          profitMargin         lifetime_gross                 budget   reviews_from_critics                  votes               avg_vote females_45age_avg_vote   males_45age_avg_vote females_30age_avg_vote   males_30age_avg_vote females_18age_avg_vote   males_18age_avg_vote 
#         -1.598991e-01           3.863702e+07           1.450327e+07           3.606797e+02           1.526896e+05           7.461438e+00           7.401961e+00           7.271895e+00           7.351634e+00           7.342484e+00           7.547712e+00           7.622222e+00 

names(dramaticFilms_pca) # view the names of the pca variable
#[1] "sdev"     "rotation" "center"   "scale"    "x"  

#Step 5.2.3.2 - View standard deviation of standard variables, variance, and display a biplot
dramaticFilms_pca$scale #View the standard deviation of the variables, which is the square root of the variance in the apply function above
#profitMargin         lifetime_gross                 budget   reviews_from_critics                  votes               avg_vote females_45age_avg_vote   males_45age_avg_vote females_30age_avg_vote   males_30age_avg_vote females_18age_avg_vote   males_18age_avg_vote 
#1.804514e+00           4.718633e+07           1.476711e+07           1.246457e+02           1.156380e+05           2.867982e-01           4.329323e-01           3.299636e-01           3.522679e-01           2.752255e-01           3.656438e-01           2.942927e-01

dramaticFilms_pca$scale^2 #Obtain the variance
#profitMargin         lifetime_gross                 budget   reviews_from_critics                  votes               avg_vote females_45age_avg_vote   males_45age_avg_vote females_30age_avg_vote   males_30age_avg_vote females_18age_avg_vote   males_18age_avg_vote 
#3.256270e+00           2.226550e+15           2.180674e+14           1.553655e+04           1.337216e+10           8.225318e-02           1.874303e-01           1.088760e-01           1.240927e-01           7.574905e-02           1.336954e-01           8.660819e-02 


summary(dramaticFilms_pca)#View the PCA components to view that PC1 and PC2 have the most variance, 57% and 14% respectively
#Importance of components:
#                       PC1    PC2    PC3     PC4     PC5     PC6     PC7     PC8     PC9   PC10    PC11    PC12
#Standard deviation     2.6175 1.3403 1.2885 0.91073 0.59528 0.52615 0.36103 0.21115 0.17300 0.1151 0.10314 0.05316
#Proportion of Variance 0.5709 0.1497 0.1384 0.06912 0.02953 0.02307 0.01086 0.00372 0.00249 0.0011 0.00089 0.00024
#Cumulative Proportion  0.5709 0.7206 0.8590 0.92810 0.95763 0.98070 0.99156 0.99528 0.99777 0.9989 0.99976 1.00000


dramaticFilms_pca$rotation #dispaly the matrix of variable loadings with whose columns contain eigenvectors
#                         PC1        PC2         PC3          PC4           PC5         PC6         PC7         PC8         PC9          PC10        PC11        PC12
#profitMargin           -0.17057984 -0.1545683  0.28401294 -0.832540146 -0.3396891867  0.12073596 -0.16453590 -0.04442218  0.10806517 -0.0009928391  0.03713201  0.03399357
#lifetime_gross         -0.21660609  0.3353929  0.48936049  0.017783470  0.0123769495 -0.47423097  0.06111513  0.58501121 -0.11797152 -0.0796942252  0.07777289 -0.05886430
#budget                 -0.05624465  0.1244858  0.67447611  0.412441832 -0.1298001096  0.33649725 -0.30167712 -0.31504783  0.11168222  0.0002782565 -0.08728955  0.12600941
#reviews_from_critics   -0.20939956 -0.4554921  0.32665495 -0.072257634  0.5270883317 -0.32232548  0.28653730 -0.40350414 -0.08562245  0.0049839967 -0.04380797 -0.02905043
#votes                  -0.31046603 -0.3161123  0.08516860  0.122309584  0.0091165701  0.61667218  0.41416258  0.39141165 -0.14294410  0.0629953560  0.21570509 -0.07374942
#avg_vote               -0.36318788 -0.1526448 -0.14492217  0.074452579 -0.0884114876 -0.10350039 -0.12146260  0.15527860 -0.13158577  0.4093755673 -0.48855054  0.58074967
#females_45age_avg_vote -0.29391984  0.4294450 -0.06478498 -0.123953408  0.3428159183  0.13862677  0.03927840 -0.05757953  0.43698331  0.5387901002 -0.04677954 -0.29084491
#males_45age_avg_vote   -0.34152888  0.1953739 -0.16110268 -0.100255196  0.4101250661  0.20078030 -0.14667127  0.05535570  0.17883677 -0.6656461501 -0.07658333  0.30847604
#females_30age_avg_vote -0.33511676  0.3165094 -0.13584842 -0.005013029 -0.0996758691 -0.05605867  0.01025763 -0.36221911 -0.42662663  0.1171468197  0.60709884  0.24566281
#males_30age_avg_vote   -0.36249432 -0.1210422 -0.13449159  0.066695976  0.0003545371  0.01788809 -0.50299031 -0.01571624 -0.41288122 -0.0790967386 -0.19701997 -0.60191353
#females_18age_avg_vote -0.34117150  0.1619016 -0.08624403  0.105689848 -0.5003971952 -0.11600859  0.52095628 -0.26975081  0.14137472 -0.2617300512 -0.32998471 -0.18271806
#males_18age_avg_vote   -0.29247884 -0.3921575 -0.12591018  0.263948902 -0.1892884189 -0.27560140 -0.24948186  0.07621331  0.56696356 -0.0142932453  0.41652678 -0.01279647

biplot(dramaticFilms_pca, scale=0) #plot the first two principal components

#Step 5.2.3.3 - Select the principal components that represent the largest variance in the data to reduce dimensions of the data

dramaticFilm_pca_var = dramaticFilms_pca$sdev^2 #calculate variance by squaring the pca sdev component
dramaticFilm_pca_var
#[1] 6.851214130 1.796304131 1.660285383 0.829431361 0.354359959 0.276831900 0.130339528 0.044585762 0.029928417 0.013255177 0.010638477 0.002825774

dramaticFilm_pve <- dramaticFilm_pca_var / sum(dramaticFilm_pca_var) #Compute proportion of variance explained by each principal component by dividing the sum of the variances
dramaticFilm_pve
#[1] 0.5709345109 0.1496920109 0.1383571153 0.0691192801 0.0295299966 0.0230693250 0.0108616273 0.0037154802 0.0024940347 0.0011045981 0.0008865398 0.0002354812

par(mfrow=c(1,2)) #set up 2 columns for the scree plot which represents the proportion of variance explained by each of he four principal components in the dramaticFilm data set
plot(dramaticFilm_pve, xlab="Principal Component", ylab="Proprortion of Variance Explained", ylim=c(0,1), type='b')
plot(cumsum(dramaticFilm_pve), xlab="Principal Component", ylab="Cumulative Proprortion of Variance Explained", ylim=c(0,1), type='b')


#Step 5.2.3.3 - Reduce 12 dimensions to 3 dimensions and create a 3D scatterplot with these dimensions
d1 <- predict(dramaticFilms_pca) #dl is the 153x12 matrix - predict the values of each observation for each pca component
dim(d1)
#[1] 153  12 - verify dimensions

d2 <- scale(dramaticFilms[-1:-5], dramaticFilms_pca$center, dramaticFilms_pca$scale) %*% dramaticFilms_pca$rotation
dim(d2)
#[1] 153  12 - verify dimensions

d3 <- predict(dramaticFilms_pca) [,1:3] #153x3
dim(d3)
#[1] 153   3 - verify dimensions

d4 <- scale(dramaticFilms[-1:-5], dramaticFilms_pca$center, dramaticFilms_pca$scale) %*% dramaticFilms_pca$rotation[,1:3]
dim(d4)
#[1] 153   3 - verify dimensions

library(scatterplot3d)
scatterplot3d(d4[,1], d4[,2], d4[,3], main="3 Principal Components")

summary(d4) #view the summary of the reduced dimensions of dramaticFilms and its 3 main principal components
#            PC1               PC2               PC3         
#Min.   :-4.8869   Min.   :-2.5440   Min.   :-2.1264  
#1st Qu.:-2.5742   1st Qu.:-0.8040   1st Qu.:-0.8433  
#Median : 0.6159   Median :-0.1064   Median :-0.2848  
#Mean   : 0.0000   Mean   : 0.0000   Mean   : 0.0000  
#3rd Qu.: 1.9093   3rd Qu.: 1.3107   3rd Qu.: 0.5319  
#Max.   : 3.7720   Max.   : 2.5656   Max.   : 3.1223 

dramaticFilms_pca$rotation[,1:3]#dispaly the matrix of variable loadings with whose columns contain eigenvectors for the 3 principal components
#                               PC1        PC2         PC3
#profitMargin           -0.17057984 -0.1545683  0.28401294
#lifetime_gross         -0.21660609  0.3353929  0.48936049
#budget                 -0.05624465  0.1244858  0.67447611
#reviews_from_critics   -0.20939956 -0.4554921  0.32665495
#votes                  -0.31046603 -0.3161123  0.08516860
#avg_vote               -0.36318788 -0.1526448 -0.14492217
#females_45age_avg_vote -0.29391984  0.4294450 -0.06478498
#males_45age_avg_vote   -0.34152888  0.1953739 -0.16110268
#females_30age_avg_vote -0.33511676  0.3165094 -0.13584842
#males_30age_avg_vote   -0.36249432 -0.1210422 -0.13449159
#females_18age_avg_vote -0.34117150  0.1619016 -0.08624403
#males_18age_avg_vote   -0.29247884 -0.3921575 -0.12591018



#Step 6 - Use R's plotting features to produce both exploratory and expository data visualizations.

#Step 6.1 Show histograms of the variables
hist(dramaticFilms$budget)  #shows the frequency of each value in the budget variable

hist(dramaticFilms$profitMargin) #shows the frequency of each value in the profitMargin variable

hist(dramaticFilms$lifetime_gross) #shows the frequency of each value in the lifetime_gross variable

hist(dramaticFilms$reviews_from_critics) #shows the frequency of each value in the number of reviews_from_critics variable

hist(dramaticFilms$votes) #interesting histogram

hist(dramaticFilms$profitMargin, probability = TRUE, breaks = 10) #shows the density of each value in the profitMargin variable
lines(density(dramaticFilms$profitMargin)) #shows a smoothing line

#Step 6.2 Show box plots of the variables to view the data in quartile ranges

boxplot(dramaticFilms$budget) #Boxplot of the budget variable

boxplot(dramaticFilms$profitMargin) #Boxplot of the profitMargin variable

boxplot(dramaticFilms$lifetime_gross) #Boxplot of the lifetime_gross variable

#Step 6.3 Create a table of the budget, profitMargin, and lifetime_gross variables; display each with a barplot

#Step 6.3.1 Table and barchart of budget variable
table(desc(round(dramaticFilms$budget, digits = 2))) #table of budget variable
#  -6e+07 -3.5e+07 -3.2e+07 -2.8e+07 -2.5e+07   -2e+07 -1.8e+07 -1.6e+07 -1.3e+07   -1e+07   -9e+06 
#10        1       10        2       12        1        1        1       11       30       20 
#-8e+06   -7e+06   -6e+06   -5e+06   -4e+06   -2e+06   -1e+06 
#10        2       10        1       10       11       10 

barplot(table(round(dramaticFilms$budget, digits = 2))) #barplot of budget values

#Step 6.3.2 Table and barchart of profitMargin variable
table(desc(round(dramaticFilms$profitMargin, digits = 2))) #table of profit margin
#-0.852600672752934 -0.842223269772057  -0.83974970185432 -0.833401388865982 -0.826300342774561 -0.816838310538556 -0.811302442746488 -0.795744429138667 -0.757822807666749 -0.717755729034533 -0.705467288381419 -0.661267611120313 -0.601479478968578 -0.538043271671525 
#                10                 10                 10                 10                  1                  1                 10                 10                  1                  1                  1                  1                  1                  1 
#-0.536824448036011  -0.52652896108712 -0.520268776134408 -0.478957375181779  -0.46116626789478 -0.337551978983969 -0.267314540965797  0.235709025124436  0.286713763607199    0.9539271309743  0.955255464684841   4.62603202524963   4.66601531098987 
#                10                 10                 10                 10                  1                  1                 10                  1                  1                 10                  1                 10                 10 

barplot(table(round(dramaticFilms$profitMargin, digits = 2))) #barplot of profit margin variable

#Step 6.3.3 Table and barchart of lifetime_gross variable
table(desc(round(dramaticFilms$lifetime_gross, digits = -6))) #table of lifetime_gross variable
#-1.7e+08 -1.61e+08 -1.25e+08  -8.3e+07  -7.6e+07    -7e+07  -4.9e+07  -4.8e+07  -4.4e+07  -3.8e+07 
#      10         1        10         1         1         1        10        10         1         1 

#-3.3e+07  -2.7e+07  -2.5e+07  -2.2e+07  -2.1e+07  -1.8e+07  -1.7e+07  -1.6e+07  -1.3e+07  -1.2e+07 
#       1         1        11        10        10        10        10        10         1        11 

#-6e+06    -1e+06 
#    12        20 

barplot(table(round(dramaticFilms$lifetime_gross, digits = -6))) #barplot of lifetime_gross variable

#Step 6.4 Scatterplots

plot(dramaticFilms$budget, dramaticFilms$profitMargin, pch=19, col="blue") #Scatterplot to identify the relationship between the budget and profit margin
#Notes: It can be observed that concentration of films with a higher profit margin are in the $10M range


plot(dramaticFilms$budget, dramaticFilms$lifetime_gross, pch=19, col="blue")#Scatterplot to identify the relationship between the budget and lifetime_gross
#Notes: This plot shows a slight trend that the higher the budget, the lifetime gross profits increased



cor(dramaticFilms[,c(6,7,8,9,11,12)], method = "pearson") #
#                       profitMargin lifetime_gross      budget reviews_from_critics   avg_vote females_45age_avg_vote
#profitMargin             1.00000000      0.3583297  0.09871064           0.49525419  0.3559951             0.24330652
#lifetime_gross           0.35832971      1.0000000  0.65669350           0.33731772  0.3461786             0.62045637
#budget                   0.09871064      0.6566935  1.00000000           0.25978887 -0.0337566             0.09215139
#reviews_from_critics     0.49525419      0.3373177  0.25978887           1.00000000  0.5488157             0.09571544
#avg_vote                 0.35599512      0.3461786 -0.03375660           0.54881569  1.0000000             0.60677138
#females_45age_avg_vote   0.24330652      0.6204564  0.09215139           0.09571544  0.6067714             1.00000000

pairs(dramaticFilms[,c(6,7,8,9,11,12)]) #Scatterplot for the quantitative variables in the dramaticFilms data set

#Note the values above show select values of the previous correlation matrix in the early data analysis in Step 5.2 
#that Shows the correlation between variables for the dramatic films data frame. Reference the analysis in Step 5.2


#Step 7 - Select one or more of R's statistical learning algorithms to make predictions, and/or discoveries.
#Note: The predict function was used in Step 5.2.3.3 to reduce 12 dimensions to 3 dimensions for PCA components.

#step 8 - In the case of predictions, use the trained algorithm on new data and make a case for the algorithm's accuracy.

#Step 8.1 - Use the lm() function to perform a simple linear 
#regression with lifetime gross profits as the response variable and
#budget as the predictor.

lm_profit_budget <- lm(dramaticFilms$lifetime_gross ~ dramaticFilms$budget)

names(lm_profit_budget) #Review components of the linear model object
#[1] "coefficients"  "residuals"     "effects"       "rank"          "fitted.values" "assign"        "qr"            "df.residual"   "xlevels"      
#[10] "call"          "terms"         "model"  

#8.1.1 Use the summary() function to print the results
summary(lm_profit_budget)

#Call:
#  lm(formula = dramaticFilms$lifetime_gross ~ dramaticFilms$budget)

#Residuals:
#  Min        1Q    Median        3Q       Max 
#-58974483 -17739645  -7597376   8755081 108944169 

#Coefficients:
#                      Estimate Std. Error t value Pr(>|t|)    
#(Intercept)          8.204e+06  4.052e+06   2.024   0.0447 *  
#dramaticFilms$budget 2.098e+00  1.961e-01  10.700   <2e-16 ***
#  ---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

#Step - 8.1.2 Comment on the summary
#Residual standard error: 35700000 on 151 degrees of freedom
#Multiple R-squared:  0.4312,	Adjusted R-squared:  0.4275 
#F-statistic: 114.5 on 1 and 151 DF,  p-value: < 2.2e-16

#Estimate: The value of lifetime_gross at budget= 0 is 8.204e+06, this is 
# a positive relationship

#Std. Error: The standard error for the budget variable is 
#1.961e-01, which is 10 times less (in absolute value), than 
#the the estimate of the coefficient 2.098e+00. At least one order of magnitude
#less is better.
  
#Pr(>|t|): The p-value for the t-test and is the probability the
#variable is not relevant, so it should be small and is confirmed by 
#its value in scientific notation of 2e-16 (2 x 10^16)

#Adjusted R-squared: The model explained 43 percent of the cause of lifetime gross is due to the budget. 

#As indicated by the three asterisks in the table, budget has a strong impact on lifetime gross.

#Step 8.1.3 - The predicted lifetime gross associated with a budget of 15000000
predict_profit <- lm_profit_budget$coefficients[1] + 1500500 * lm_profit_budget$coefficients[2]
predict_profit
#(Intercept) 
#11352306 The model predicts that the profit for a $15M dramatic film will be $11.3M based on this model

#8.2. Below is a plot of the response variable and predictor, 
#using the abline() function to display the least square regression line.

par(mfrow=c(1,1)) #one column, one row plot
plot(dramaticFilms$budget,lm_profit_budget$residuals, col="blue", pch=19) #Residual plot 
abline(c(0,0),col="red",lwd=3) #Center line at 0


#The plot() function below produces diagnostic plots of the fit. 
# Displays the Residuals vs Fitted plot with equally distributed values
plot(lm_profit_budget) 

#Note: The above plot shows data points loosely around the line, which is good. A pattern may indicate the fit is not good.

#Show 4 plots in 2 columns and 2 rows to represent the variables that impact lifetime gross profits
attach(dramaticFilms)
par(mfrow = c(2,2))
plot(dramaticFilms$lifetime_gross, dramaticFilms$budget, pch=19, col="blue")

plot(dramaticFilms$lifetime_gross, dramaticFilms$females_45age_avg_vote, pch=19, col="red")

plot(dramaticFilms$lifetime_gross, dramaticFilms$females_30age_avg_vote, pch=19, col="green")

plot(dramaticFilms$lifetime_gross, dramaticFilms$females_18age_avg_vote, pch=19, col="orange")
#Note: The above plots show that as the budget increases, the film's gross profits increase and as 
#the average vote of females 45 and above increases, the lifetime gross profits increased. Less so for
#females between 30 and 44, and even less so for females between 18 and 29.

#8.3. Split the data into a training set and test set.

#Add a variable lifetime_gross01 to a new dataframe using mutate and mean functions 
#with a conditional statement evaluating median of lifetime_gross

library(dplyr) #load library into memory to use the mutate function
dramaticFilms2 <- mutate(dramaticFilms, lifetime_gross01 =ifelse(lifetime_gross > median(dramaticFilms$lifetime_gross), 1,0)) 
head(dramaticFilms2) #display top rows of table
tail(dramaticFilms2) #display top bottom rows of table

#               title            genre              name          director year profitMargin lifetime_gross budget reviews_from_critics  votes avg_vote females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote lifetime_gross01
#1 Dallas Buyers Club Biography, Drama              <NA> Jean-Marc Vall√©e 2013    0.8168383       27298285  5e+06                  488 410817      8.0                    8.0                  7.8                    8.0                  7.9                    8.1                  8.1                1
#2    The Descendants    Comedy, Drama              <NA>   Alexander Payne 2011    0.7578228       82584160  2e+07                  555 225606      7.3                    7.4                  7.3                    7.1                  7.3                    7.2                  7.5                1
#3            Boyhood            Drama    Ellar Coltrane Richard Linklater 2014    0.8422233       25352281  4e+06                  576 320400      7.9                    7.6                  7.7                    7.6                  7.8                    7.8                  8.1                1
#4            Boyhood            Drama Patricia Arquette Richard Linklater 2014    0.8422233       25352281  4e+06                  576 320400      7.9                    7.6                  7.7                    7.6                  7.8                    7.8                  8.1                1
#5            Boyhood            Drama       Ethan Hawke Richard Linklater 2014    0.8422233       25352281  4e+06                  576 320400      7.9                    7.6                  7.7                    7.6                  7.8                    7.8                  8.1                1
#6            Boyhood            Drama      Elijah Smith Richard Linklater 2014    0.8422233       25352281  4e+06                  576 320400      7.9                    7.6                  7.7                    7.6                  7.8                    7.8                  8.1                1

#> tail(dramaticFilms2) #display top bottom rows of table
#           title         genre               name   director year profitMargin lifetime_gross budget reviews_from_critics votes avg_vote females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote lifetime_gross01
#148 Eighth Grade Comedy, Drama         Bo Burnham Bo Burnham 2018    0.8397497       12480476  2e+06                  221 49510      7.4                    7.1                  7.1                    7.2                  7.3                    7.4                  7.6                0
#149 Eighth Grade Comedy, Drama           Eli Bush Bo Burnham 2018    0.8397497       12480476  2e+06                  221 49510      7.4                    7.1                  7.1                    7.2                  7.3                    7.4                  7.6                0
#150 Eighth Grade Comedy, Drama        Scott Rudin Bo Burnham 2018    0.8397497       12480476  2e+06                  221 49510      7.4                    7.1                  7.1                    7.2                  7.3                    7.4                  7.6                0
#151 Eighth Grade Comedy, Drama Christopher Storer Bo Burnham 2018    0.8397497       12480476  2e+06                  221 49510      7.4                    7.1                  7.1                    7.2                  7.3                    7.4                  7.6                0
#152 Eighth Grade Comedy, Drama        Lila Yacoub Bo Burnham 2018    0.8397497       12480476  2e+06                  221 49510      7.4                    7.1                  7.1                    7.2                  7.3                    7.4                  7.6                0
#153 Eighth Grade Comedy, Drama      Anna Meredith Bo Burnham 2018    0.8397497       12480476  2e+06                  221 49510      7.4                    7.1                  7.1                    7.2                  7.3                    7.4                  7.6                0

# Remove observations with type variable NAs
dramaticFilms_df_noNA <- na.omit(dramaticFilms2)

## Split data set into training set and test set
n <- nrow(dramaticFilms_df_noNA)  # Number of observations = 140
#[1] 140
ntrain <- round(n*0.6)   # 60% for training set
set.seed(314)  # Set seed for reproducible results
tindex <- sample(n, ntrain) #Create an index

traindramaticFilms<- dramaticFilms_df_noNA[tindex,] #Create a training set
testdramaticFilms <- dramaticFilms_df_noNA[-tindex,] #Create a test set

#8.4 Perform logistic regression on the training set in order to predict lifetime_gross01
#using the variables that seemed most associated with lifetime_gross01 above. What
#is the test error of the model obtained?

#8.4.1 Logistic regression
formula <- lifetime_gross01 ~ budget + females_45age_avg_vote + females_30age_avg_vote

glm2 <- glm(formula, data=trainAuto2, family="binomial") #reference page 147 of textbook for linear model function for linear regression

summary(glm2)$coef
summary(glm2)


glm2 <- glm(formula, data=traindramaticFilms, family="binomial") #linear model function for linear regression
summary(glm2)$coef

#> summary(glm2)$coef
#                            Estimate   Std. Error   z value    Pr(>|z|)
#(Intercept)            -2.329100e+01 7.274631e+00 -3.201674 0.001366313
#budget                  7.226635e-08 3.726912e-08  1.939041 0.052496339
#females_45age_avg_vote  3.374232e+00 1.607765e+00  2.098710 0.035842471
#females_30age_avg_vote -3.736266e-01 1.703157e+00 -0.219373 0.826359532

summary(glm2)
#> summary(glm2)

#Call:
#  glm(formula = formula, family = "binomial", data = traindramaticFilms)

#Deviance Residuals: 
#  Min       1Q   Median       3Q      Max  
#-1.6446  -0.8847  -0.5331   1.2519   1.6044  
#
#Coefficients:
#                         Estimate Std. Error z value Pr(>|z|)   
#(Intercept)            -2.329e+01  7.275e+00  -3.202  0.00137 **
#budget                  7.227e-08  3.727e-08   1.939  0.05250 . 
#females_45age_avg_vote  3.374e+00  1.608e+00   2.099  0.03584 * 
#females_30age_avg_vote -3.736e-01  1.703e+00  -0.219  0.82636   
#---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#
#(Dispersion parameter for binomial family taken to be 1)
#
#Null deviance: 115.255  on 83  degrees of freedom
#Residual deviance:  84.464  on 80  degrees of freedom
#AIC: 92.464
#
#Number of Fisher Scoring iterations: 6

plot(glm2$fitted, glm2$residuals) #purpose is to confirm a good distribution

plot(glm2$residuals, pch=19) #purpose is to show no trend

#Solution note: The smallest p-value 0.03584 is associated with females_45age_avg_vote,
#meaning there is an association between  females_45age_avg_vote and lifetime_gross01.The standard error
#for the females_45age_avg_vote variable is 1.608e+00, which is 2.1 times less 
#than the estimate of the coefficient 3.374, a good sign the model is fit.

#8.4.2  What is the test error of the model obtained?

#1. Use the predict() function for GLM on the test set in order to get predicted probabilities.

prob <- predict(glm2, newdata = testdramaticFilms, type = "response") #Obtain the predicted probabilities
prob <- round(prob,1) #round to one decimal place
prob

#6   8   9  11  18  20  22  24  26  27  30  31  32  39  42  43  45  48  49  50  54  57  60  61  63  70  71  73  74  83  84  86  88  90  93  99 100 101 
#0.5 0.5 0.5 0.5 0.1 0.1 0.1 0.1 0.7 0.7 0.7 0.7 0.7 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.3 0.3 0.3 0.3 0.2 0.2 0.2 0.2 1.0 1.0 1.0 0.2 0.2 
#102 103 105 110 111 113 115 126 127 128 132 135 138 141 142 147 149 152 
#0.2 0.2 0.2 0.5 0.5 0.5 0.5 1.0 1.0 1.0 1.0 0.3 0.3 0.3 0.3 0.1 0.1 0.1 

#2. Create a vector index of 0s and 1s where the 1s indicate the predicted probability is > 0.5. 
#The 1s indicate where the predicted probability is successful (the 0.5 threshold is arbitrary, 
#and could be 0.7, 0.9, etc.).

vec_index_sucessProb <-c(ifelse(prob > 0.5,1,0)) 
sucessProb <- vec_index_sucessProb
testdramaticFilms$successProb <- sucessProb
head(testdramaticFilms)
tail(testdramaticFilms)

#        title genre             name             director year profitMargin lifetime_gross  budget reviews_from_critics  votes avg_vote females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote lifetime_gross01 successProb
#6     Boyhood Drama     Elijah Smith    Richard Linklater 2014    0.8422233       25352281 4.0e+06                  576 320400      7.9                    7.6                  7.7                    7.6                  7.8                    7.8                  8.1                1           0
#8     Boyhood Drama Jonathan Sehring    Richard Linklater 2014    0.8422233       25352281 4.0e+06                  576 320400      7.9                    7.6                  7.7                    7.6                  7.8                    7.8                  8.1                1           0
#9     Boyhood Drama       John Sloss    Richard Linklater 2014    0.8422233       25352281 4.0e+06                  576 320400      7.9                    7.6                  7.7                    7.6                  7.8                    7.8                  8.1                1           0
#11    Boyhood Drama       Lee Daniel    Richard Linklater 2014    0.8422233       25352281 4.0e+06                  576 320400      7.9                    7.6                  7.7                    7.6                  7.8                    7.8                  8.1                1           0
#18 The Master Drama    Jesse Plemons Paul Thomas Anderson 2012   -0.9539271       16377274 3.2e+07                  499 137130      7.2                    6.4                  6.5                    6.6                  7.0                    7.1                  7.7                0           0
#20 The Master Drama    Megan Ellison Paul Thomas Anderson 2012   -0.9539271       16377274 3.2e+07                  499 137130      7.2                    6.4                  6.5                    6.6                  7.0                    7.1                  7.7                0           0

#> tail(testdramaticFilms)
#           title         genre        name     director year profitMargin lifetime_gross budget reviews_from_critics  votes avg_vote females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote lifetime_gross01 successProb
#138    Lady Bird Comedy, Drama    Eli Bush Greta Gerwig 2017    0.7957444       48958273  1e+07                  449 189351      7.4                    7.2                  7.2                    7.2                  7.2                    7.6                  7.6                1           0
#141    Lady Bird Comedy, Drama   Jon Brion Greta Gerwig 2017    0.7957444       48958273  1e+07                  449 189351      7.4                    7.2                  7.2                    7.2                  7.2                    7.6                  7.6                1           0
#142    Lady Bird Comedy, Drama    Sam Levy Greta Gerwig 2017    0.7957444       48958273  1e+07                  449 189351      7.4                    7.2                  7.2                    7.2                  7.2                    7.6                  7.6                1           0
#147 Eighth Grade Comedy, Drama   Jake Ryan   Bo Burnham 2018    0.8397497       12480476  2e+06                  221  49510      7.4                    7.1                  7.1                    7.2                  7.3                    7.4                  7.6                0           0
#149 Eighth Grade Comedy, Drama    Eli Bush   Bo Burnham 2018    0.8397497       12480476  2e+06                  221  49510      7.4                    7.1                  7.1                    7.2                  7.3                    7.4                  7.6                0           0
#152 Eighth Grade Comedy, Drama Lila Yacoub   Bo Burnham 2018    0.8397497       12480476  2e+06                  221  49510      7.4                    7.1                  7.1                    7.2                  7.3                    7.4                  7.6                0           0

#Compare the above vector with the lifetime_gross01 variable values in the test set and create a vector
#index of 0s and 1s indicating whether the two values are not equal.

compare_lifetime_gross01_sucessProb <- c(ifelse(testdramaticFilms$successProb != testdramaticFilms$lifetime_gross01,1,0)) #compare not equal values
testdramaticFilms$compare_lifetime_gross01_sucessProb <- compare_lifetime_gross01_sucessProb
head(testdramaticFilms)
tail(testdramaticFilms)

#> head(testdramaticFilms)
#        title genre             name             director year profitMargin lifetime_gross  budget reviews_from_critics  votes avg_vote females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote lifetime_gross01 successProb compare_lifetime_gross01_sucessProb
#6     Boyhood Drama     Elijah Smith    Richard Linklater 2014    0.8422233       25352281 4.0e+06                  576 320400      7.9                    7.6                  7.7                    7.6                  7.8                    7.8                  8.1                1           0                                   1
#8     Boyhood Drama Jonathan Sehring    Richard Linklater 2014    0.8422233       25352281 4.0e+06                  576 320400      7.9                    7.6                  7.7                    7.6                  7.8                    7.8                  8.1                1           0                                   1
#9     Boyhood Drama       John Sloss    Richard Linklater 2014    0.8422233       25352281 4.0e+06                  576 320400      7.9                    7.6                  7.7                    7.6                  7.8                    7.8                  8.1                1           0                                   1
#11    Boyhood Drama       Lee Daniel    Richard Linklater 2014    0.8422233       25352281 4.0e+06                  576 320400      7.9                    7.6                  7.7                    7.6                  7.8                    7.8                  8.1                1           0                                   1
#18 The Master Drama    Jesse Plemons Paul Thomas Anderson 2012   -0.9539271       16377274 3.2e+07                  499 137130      7.2                    6.4                  6.5                    6.6                  7.0                    7.1                  7.7                0           0                                   0
#20 The Master Drama    Megan Ellison Paul Thomas Anderson 2012   -0.9539271       16377274 3.2e+07                  499 137130      7.2                    6.4                  6.5                    6.6                  7.0                    7.1                  7.7                0           0                                   0

#> tail(testdramaticFilms)
#           title         genre        name     director year profitMargin lifetime_gross budget reviews_from_critics  votes avg_vote females_45age_avg_vote males_45age_avg_vote females_30age_avg_vote males_30age_avg_vote females_18age_avg_vote males_18age_avg_vote lifetime_gross01 successProb compare_lifetime_gross01_sucessProb
#138    Lady Bird Comedy, Drama    Eli Bush Greta Gerwig 2017    0.7957444       48958273  1e+07                  449 189351      7.4                    7.2                  7.2                    7.2                  7.2                    7.6                  7.6                1           0                                   1
#141    Lady Bird Comedy, Drama   Jon Brion Greta Gerwig 2017    0.7957444       48958273  1e+07                  449 189351      7.4                    7.2                  7.2                    7.2                  7.2                    7.6                  7.6                1           0                                   1
#142    Lady Bird Comedy, Drama    Sam Levy Greta Gerwig 2017    0.7957444       48958273  1e+07                  449 189351      7.4                    7.2                  7.2                    7.2                  7.2                    7.6                  7.6                1           0                                   1
#147 Eighth Grade Comedy, Drama   Jake Ryan   Bo Burnham 2018    0.8397497       12480476  2e+06                  221  49510      7.4                    7.1                  7.1                    7.2                  7.3                    7.4                  7.6                0           0                                   0
#149 Eighth Grade Comedy, Drama    Eli Bush   Bo Burnham 2018    0.8397497       12480476  2e+06                  221  49510      7.4                    7.1                  7.1                    7.2                  7.3                    7.4                  7.6                0           0                                   0
#152 Eighth Grade Comedy, Drama Lila Yacoub   Bo Burnham 2018    0.8397497       12480476  2e+06                  221  49510      7.4                    7.1                  7.1                    7.2                  7.3                    7.4                  7.6                0           0                                   0

#Calculate the mean() of the vector index. This is the test error metric.
test_error <- mean(testdramaticFilms$compare_lifetime_gross01_sucessProb) 
test_error #test error metric is  0.375 or approximately 37.5%
#[1] 0.375


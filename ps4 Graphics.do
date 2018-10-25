/*Rachel Wagner
Problem Set 4 Graphing
October 25, 2018
Graphics for Good Reads Reviews vs. Descriptions Empathy Words */ 


// Orig Good Reads 
insheet using /mnt/commons/rachel/100kSamplOfAllSeed4694329905allBooksReadMin1revV1.csv, clear names
keep if rev~=""
keep if rev~="."
keep if rev~="..."
// now there are 74,200 reviews with actual content in them :)
//Checking for empathy words in reviews
egen str_feel= nss(rev) , find("feel") insensitive //5,349
egen str_both= nss(rev) , find("both") insensitive //2,788	
egen str_und= nss(rev) , find("understand") insensitive //2,234
egen str_know= nss(rev) , find("know") insensitive //7,028 
egen str_care= nss(rev) , find("care") insensitive //2,160
egen str_love= nss(rev) , find("love") insensitive //15,996
egen str_thi= nss(rev) , find("think") insensitive //7,412
egen str_char= nss(rev) , find("character") insensitive //13,126
// These are all really low numbers :( 
egen str_rel= nss(rev) , find("relate") insensitive //962
egen str_mov= nss(rev) , find("moved") insensitive //645
egen str_real= nss(rev) , find("realize") insensitive //965
egen str_mind= nss(rev) , find("mind") insensitive //2,929
egen str_persp= nss(rev), find("perspective") insensitive //1,144
// :( this is bad 
//getting a total of empathy words used in book reviews 
egen tot=rowtotal(str_*)
hist tot, percent
//Checking ofr empathy words in descpritions 
egen str_dfeel= nss(description) , find("feel") insensitive //5,885
egen str_dboth= nss(description) , find("both") insensitive // 7,901
egen str_dund= nss(description) , find("understand") insensitive // 3,870
egen str_dknow= nss(description) , find("know") insensitive //16,855
egen str_dcare= nss(description) , find("care") insensitive //6,984
egen str_dlove= nss(description) , find("love") insensitive //22,444
egen str_dthi= nss(description) , find("think") insensitive //5476
egen str_dchar= nss(description) , find("character") insensitive //5198
egen str_drel= nss(description) , find("relate") insensitive //1539
egen str_dmov= nss(description) , find("moved") insensitive //1881
egen str_dreal= nss(description) , find("realize") insensitive //4528
egen str_dmind= nss(description) , find("mind") insensitive //5831
egen str_dpersp= nss(description), find("perspective") insensitive //1736
//getting a total of empathy words used in book descriptions 
egen tot2=rowtotal(str_d*)

/*Comparing total empathy words used in reviews to total empathy words
used in book descriptions... */
tw(scatter tot tot2, msymbol(Oh) jitter(2))(lfit tot tot2)
//jitter spreads the dist, 'msymbol(Oh)' makes the circles open

/*Correlation between totals... weak correlation! So, the empathetic language
used in book reviews is weakly correlated with (.1) with the content of the 
book and its description*/ 
corr tot tot2

/*We can see frequency of the the same empathy words looks relatively similar
across both totals*/ 
ta tot, plot
ta tot2, plot

//proportion of words that ar empathetic 

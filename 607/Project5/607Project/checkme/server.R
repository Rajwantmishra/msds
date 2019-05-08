#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
# library(DT)
# install.packages("gridExtra")
library(mongolite)
library(lubridate)
library(gridExtra)
library(shinyjs)
library(wordcloud)
library(tidyverse)
library(e1071)

library(stringr)
library(tm)
library(gmodels)

function(input, output, session) {
  # dtquestion <- input$Symptoms_text
  outText <- "BIN "
  dtquestion <- reactiveVal("")
  dtAnswer <- reactiveVal("")
  dtTerm <- reactiveVal("")
  dtModelTerm <- reactiveVal("")
  # Here you read the URL parameter from session$clientData$url_search
  observe({
    # shinyjs::disable("in_Section")
    # shinyjs::disable("text")
    query <- parseQueryString(session$clientData$url_search)
    if (!is.null(query[['bins']])) {
      outText  = query[['bins']]
      output$text <- renderText({
        paste("Input text is:", outText,input$text ,  input$in_Section, input$BodyName, input$data,session$clientData)
      })
    }
  })
  
  
  ## To make sure our JS-created textInput works:
  output$txt2Test <- renderText({ input$txt2 })
  
  # output$plot1 <- renderPlot({
  #   hist(rnorm(input$n))
  # })
  
  output$text <- renderText({
    paste("Input text is:", input$text , input$BodyName, input$in_Section,  input$data)
  })
  
  
  


#----------------------------------------------------------------------------------#

#--------------------------Model Fetch And Apply Logic-----------------------------#

#----------------------------------------------------------------------------------#

  # Define a reactive expression for the Symptoms predication
  
    startPredict <- reactive({
      
      withProgress({
        setProgress(message = "Processing corpus...")
      
        dtquestion <- paste(input$BodyName,input$Symptoms_text ,";" ,"Example: I have sinus infection.")
        dtquestion(dtquestion)
        # print(c("DATA READ ", dtquestion))
        # dtquestion <- "depre; aire ; weer;infection ; dipression; sinus"
  
  ## Code for Recom. Start

fs_model <- gridfs(db = "MSDSProject5", url = "mongodb+srv://msds_user:msds@cluster0-bqyhe.gcp.mongodb.net/", prefix = "MOD",options = ssl_options())
Mongo_Train_Cond_Corpus = mongo(collection = "Nav_TrainC_Cond", db = "MSDSProject5", url = "mongodb+srv://msds_user:msds@cluster0-bqyhe.gcp.mongodb.net/") # create connection, database and collection
# my_collection$insert(book)
Mongo_Train_Cond_Corpus$count()
Mongo_Train_Cond_Corpus$index()
# print("Next CODE")
# Read Freq words from Mongo 
Mongo_Read_Freq <- Mongo_Train_Cond_Corpus$find()
# DT::datatable(Mongo_Read_Freq)



# Prepare for Test
# Samed Model using saveRDS to Mongo
# Remove Old Model and Upload Model to MOngo to Mongo
# Downlaod Model from Mongo 
fs_model$download("Nav_model.rds","Shiny_mongo/MongoNav.rds")

#------------------------------------------------------------



# dtquestion <- data.frame( str_split(c("I am in depression ;I have sinus ; I have throt infection"), pattern = ";"))

dtquestion <- data.frame( str_split(dtquestion, pattern = ";"))

names(dtquestion) <- c("text")


# Mongo_tm_dte_condition <- data.frame(doc_id = test$urlDrugName,text = test$condition)
Mongo_tm_dte_condition_User <- data.frame(doc_id = c("NoDRUG", "NoNEWDRUG",""),text =
                                            c("I am in depression",
                                              "I have sinus",
                                              "I have throt infection"))


# dtquestion <- Mongo_tm_dte_condition_User


Mongo_tm_dte_condition_User <- data.frame(doc_id = c(rep("noDrug",1,length(dtquestion[,1]))),
                                          text = dtquestion$text )


Mongo_corpus_condition_test_user <-VCorpus(DataframeSource(Mongo_tm_dte_condition_User))

# Create Document Term Matrix with only Freuest word as per train data  using Mongo_freq_words
as.list(Mongo_Read_Freq)

# Set model term varible 
# matr <- as.matrix(Mongo_Read_Freq$Mongo_freq_words)
dtModelTerm (Mongo_Read_Freq$Mongo_freq_words)

Mongo_dtm.test.nb <- DocumentTermMatrix(Mongo_corpus_condition_test_user, control=list(dictionary = 
                                                                                         Mongo_Read_Freq$Mongo_freq_words,
                                                                                       removePunctuation = 
                                                                                         TRUE,
                                                                                       tolower = TRUE,
                                                                                       stripWhitespace= TRUE,
                                                                                       removeNumbers = TRUE,
                                                                                       stopwords = TRUE))


dim(Mongo_dtm.test.nb)


# Function to convert the word frequencies to yes (presence) and no (absence) labels
convert_mongo <- function(x) {
  y <- ifelse(x > 0, 1,0)
  y <- factor(y, levels=c(0,1), labels=c("No", "Yes"))
  y
}

Mongo_testNB <- apply(Mongo_dtm.test.nb, 2, convert_mongo)

# Read Model from Mongo
# Do Predict

#------------------------------------------------------------

# load the model
Shiny_saved_model <- readRDS("Shiny_mongo/MongoNav.rds")

# Perform Test
Mongo_Pred_lap <- predict(Shiny_saved_model,Mongo_testNB)



fct_count(Mongo_Pred_lap,sort = TRUE)
predict_Sym_Result <- CrossTable(Mongo_tm_dte_condition_User$text,Mongo_Pred_lap,prop.chisq = FALSE, prop.t = FALSE, dnn = c("Problem","Drug"))
server_predict_for_user <- predict_Sym_Result$t
DT_predict <- as.data.frame(server_predict_for_user)
DT_predict <- DT_predict[-str_which(DT_predict$Freq, "0"),]

FirstQ <- paste(input$BodyName,input$Symptoms_text)

FirstQ
as.character(DT_predict[str_which(DT_predict$x,"have sinus"),2]) 

dtAnswer( as.character(DT_predict[str_which(DT_predict$x,"have sinus"),2]) )

# Make the wordcloud drawing during each check
dtTerm(Mongo_corpus_condition_test_user)

      }) # for  withProgress
})


    
# DT::datatable(server_predict_for_user)
#### Render ouput on SERVER


  

output$fullResult_plot <- renderPrint({ 
  if(is.null(input$Symptoms_text)){
    return()
  }
 
  startPredict()
  
  
  })

output$Symptoms <-    renderText(paste("Symptoms:",dtquestion()))
  
debugText <- function(debug_text){
  print(paste("DebugText: ",debug_text))
}

output$result <-  renderText( 
  paste("Result:",dtAnswer())
  )

# Make the wordcloud drawing during each check

output$wordsym_plot <- renderPlot({
   # paste("Terms:",dtTerm())
  # wordcloud(Mongo_corpus_condition_test_user ,min.freq = 1, color= TRUE)
 
  wordcloud(dtTerm() ,min.freq = 1, fixed.asp = TRUE,scale = c(1,.8),random.color =  TRUE)
})

# Make the wordcloud for model Terms during each check

output$wordsym_Model_plot <- renderText({
 
  paste(dtModelTerm())
  
  # wordcloud(names(dtModelTerm()), dtModelTerm()    )
})

# output$plotDT <- DT::renderDataTable({
#   
#   DT::datatable(DT_predict[,c(1,2)],colnames = c("Problem","You may take!"))
# 
#   
#   # wordcloud(names(v), v, scale=c(2,0.5),
#   #           colors=brewer.pal(1, "Dark2"))
#   
# 
#   
# })

## Code for Recom. End

    
 

#----------------------------------------------------------------------------------#

#--------------------------Model Fetch And Apply Logic-----------------------------#

#----------------------------------------------------------------------------------#

  # 


} # End of Server Functiom 


#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# install.packages("shinyjs")
library(shiny)
# library(DT)
library(shinyjs)
library(wordcloud)
library(tidyverse)
library(stringr)
library(tm)

## ui.R ##
htmlTemplate("www/bd/index.html",
             
            
             
             rowf = fluidRow(
               column(4, wellPanel(
                 fluidRow(column(8,  h2("Probelm"))),
                 # sliderInput("n", "N:", min = 10, max = 1000, value = 200,
                 #             step = 10),
                 textInput("Symptoms_text", "What is your problem :", "I have ear infection."),
                 textInput("BodyName", "Select Body Part:", "head"),
                 
                 # selectInput("in_Section", label = "Select Body Parts:",
                 #             choices = c("Head" ,
                 #                         "Shoulder",
                 #                         "Arm",
                 #                         "Cheast",
                 #                         "Stomach",
                 #                         "Legs",
                 #                         "Hands"), selected = "Head"),
                 submitButton("Submit"),
                 fluidRow(column(12, plotOutput("wordsym_plot")))
                 # plotOutput("wordsym_plot")
               )),
               column(8,
                      # plotOutput("plot1", width = 400, height = 300),
                      # DT::dataTableOutput("plotDT"),
                      
                      fluidRow(column(8,  h2("Result"))),
                      fluidRow(column(12,h4('Only Drug supported: biaxin,lamictal, depakene, sarafem. Terms used:'),verbatimTextOutput("wordsym_Model_plot"))),
                      fluidRow(column(12, h3(verbatimTextOutput("Symptoms")))),
                      fluidRow(column(12, verbatimTextOutput("fullResult_plot"))),
                      fluidRow(column(12, verbatimTextOutput("result")))
                      # verbatimTextOutput("text") 
                      
               )
              
             )
             # textInput("searchTerm", "Search on NYT", "science")
)


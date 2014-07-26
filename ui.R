library(shiny)

# load data on life expectancies around the world
# source: UN data life expectancy for males and females
# https://data.un.org/Data.aspx?q=life+expectancy&d=PopDiv&f=variableID%3a66
# https://data.un.org/Data.aspx?q=life+expectancy&d=PopDiv&f=variableID%3a67
# we are using a cleaned up version of those files

LE <- read.csv("data/LifeExpectancy.csv")

shinyUI(pageWithSidebar(
    
    headerPanel("Carpe Diem"),
    
    sidebarPanel(
        
        selectInput("country", "Country: ", 
                    sort(LE$Country)),
        radioButtons("sex", "Sex:", 
                     c("Male" = "M", "Female" = "F")),
        dateInput("DOB", "Date of birth:"),
        actionButton("submitButton", "Submit")
    ),
             
    mainPanel(
        p('This is a life expectancy calculator. It will 
          output the number of years you have left 
          (or have gone over)  based on your country of 
          residence and sex. Source: ', 
            a("female", href="https://data.un.org/Data.aspx?q=life+expectancy&d=PopDiv&f=variableID%3a67"),
            a("male", href="https://data.un.org/Data.aspx?q=life+expectancy&d=PopDiv&f=variableID%3a66")
        ),
        textOutput("text1")
    )    
))
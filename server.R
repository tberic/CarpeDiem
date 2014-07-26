library(shiny)
LE <- read.csv("data/LifeExpectancy.csv")

shinyServer(
    function(input, output) {

        output$text1 <- renderText({
            input$submitButton

            # here we calculate the difference between 
            # the age of the person and his/hers life expectancy
            diff <- as.numeric(Sys.Date() - input$DOB)/365.25
            years <- LE[LE$Country == input$country, ][input$sex] - diff
            
            if (input$submitButton >= 1) {
                if (years >= 0)                
                    isolate(paste('You have', round(years), 
                                  'years to live.'))
                else
                    isolate(paste('You have lived', round(-years), 
                                  'years past your life expectancy.'))
            }
        })
    }
)
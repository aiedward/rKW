
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinythemes)

shinyUI(fluidPage(
  theme = shinytheme("cyborg"),
  # Application title
  mainPanel(
    tabsetPanel(
      tabPanel(
        'Home',
        h1("Manual"),
        h3("Welcome!"),
        h5("This is a guide."),
        p("A process manual to help anyone replicate reports, data, and visualizations published the KentuckianaWorks Labor Market Intelligence Department."), 
        p("An attempt will be made to make this as precise and painless as possible for all involved."),
        p("Each tab contains processes for different projects"), 
        h5("May the odds be ever in your favor :)")
      ),
      
      
      tabPanel(
        'Career Calculator',
        h1("Career Calculator"), 
        h5('Data update schedule can be found here:', 
           a('Career Calculator Update Schedule',
              href = 'https://docs.google.com/document/d/1dXribqXG8DJbaM_NsCI20mfLfI73PB-c7805_O0dv_g/pub')), 
        h3('Updating the App'), 
        p('You need access to the login credentials for the AWS console found here:', 
           a('AWS credentials', 
              href = 'https://docs.google.com/a/kentuckianaworks.org/spreadsheets/d/1Rv5j9HcVbbSdPOGJUeu4cSYID6AL6d2sDDBtbKmesuY/edit?usp=sharing')), 
        p('Once logged in navigate to "Services", then "S3"'), 
        p('This is where you will find a data "bucket", with downloadable and uploadable data connected to the app'), 
        p('To update a specific data point, download the datasheet, edit, save, then upload back into the same S3 bucket'), 
        p('To upload an entire data set, just upload the data set into the bucket, the app is programmed to
          automatically select and place the new data')
        
      ),
      
      tabPanel(
        'Data Requests',
        h1("Data Requests"), 
        h5('Protocol to answering data requests:'), 
        h6('Step One:'), 
        p('Respond to inform the requester that you are aware of their request'), 
        h6('Step Two:'), 
        p('Determine whether or not you have answered a similar question, how you organize your data and visualizations is key here. 
          If you have already answered a similar question that is current and will fufill the request, go no further and respond to
          the requester using the data and write a kind and succint email with some information about the data/visualization. If not, 
          proceed to Step Three.'), 
        h6('Step Three:')
      ),
      
      tabPanel(
        'Cradle to Career Update',
        h1("Cradle to Career Update"), 
        h5('Reported once a year around Nov. - Dec.'), 
        h6('Measures to report:'), 
        tags$ol(tags$li('Median Income adjusted for inflation'), 
                tags$li('% of jobs paying a median wage above the family supporting wage'), 
                tags$li('% of jobs with a typical entry-level education of a bachelor\'s degree or higher'), 
                tags$li('Number of individuals active in labor force (16 +)'), 
                tags$li('Labor Force Participation Rate'), 
                tags$li('Youth Employment (16 -19)')), 
        h6('Data Sources and Processes'), 
        tags$ol(tags$li('Median annual wage (BLS OES) adjusted for COL (BEA RPP). 
                        Median divided by Louisville BEA RPP (move decimal over two places to the left).', 
                        br(), 'Ex. Median wage = 37,571, Louisville BEA RPP = 91.4. 
                        Median adjusted for COL = 37,571/.914 = 41,106'), 
                tags$li('Use EMSI, naviagate to Occupations then Occupations Table, select Louisville MSA, custom add the following columns: Median Wage, 
                        Current (the year) Jobs, and Typical Entry Level Education, make sure the occupations are at the 5-digit level'))
      ),
      
      tabPanel(
        'KentuckiAnalytics',
        h1("KentuckiAnalytics"), 
        h5('The LMI blog is housed at', a('KentuckiAnalytics.org', href = 'http://kentuckianalytics.org/'), 
           'a wordpress.org based site.'),
        h5('Goal: publish a new blog post once a month, and answer data questions from the public'),
        p('Questions from blog are sent to LMI@kentuckianaworks.org')
      ),
      
      tabPanel(
        'Monthly Newsletter', 
        h1("Monthly Newsletter"), 
        p('Every 30 days we (in partnership with the KW communications department) 
           release a newsletter with BLS updates for the Louisville MSA area'),
        h6('Schedule of updates can be found here:',
           a('BLS MSA Release Schedule', href = 'http://www.bls.gov/schedule/news_release/metro.htm')), 
        h5('To update the data and visualizations follow these steps:'), 
        p('Find the rScript on the shared drive following this path:'), 
        p('admin_shared$/Bekah.Data/rProjects/shinyBlsUpdates/'), 
        p('Open the .Rproj document in the folder to open the entire project in rStudio (you will need R and rStudio downloaded on your 
          computer. If this is you first time in R, make sure to 1st run the, "Package Script for 1st Time User" found here: insertPathHere'), 
        p('Once you have the shinyBlsUpdates.rProj opened navigate to server.r'), 
        p('In server.r change the month variable at the top to the new reference month, check the BLS update calendar for the most recent months data'), 
        p('Navigate to ui.r'), 
        p('In ui.r update lines 13 - 19'), 
        p('Next run lines 1 - 24 to calculate the percent of bachelors degrees (remember this for the next step)'), 
        p('Almost finished ....'), 
        p('Next open piktochart, find the login credentials here: ')
      ), 
      
      tabPanel(
        'Shiny App Links', 
        h1('Shiny Apps'),
        h4('Click on a link below to open Shiny App'),
        h5(a('Credentials Analysis', href = 'https://kwlmi.shinyapps.io/shinyCredentialsByEducation/')),
        p('In Progress:'),
        p('Adding bar chart with top 3 credentials by major'),
        p('Adding summary statistics'),
        br(),
        h5(a('Career Pathways',        href = 'https://kwlmi.shinyapps.io/shinyCareerPathways/')), 
        p('In progress:'), 
        p('checking data codes in HTML and rScipts, and adding to catagories'), 
        br(),
        h5(a('BLS Newsletter Update',   href = 'https://kwlmi.shinyapps.io/shinyBlsUpdates/')),
        br(),
        h5(a('Business Postings',       href = 'https://kwlmi.shinyapps.io/shinyBusiness/')),
        br(), 
        h5(a('JCTC Data Request',       href = 'https://kwlmi.shinyapps.io/shinyJCTC/')),
        br(),
        h5(a('Business Majors',         href = 'https://kwlmi.shinyapps.io/louisvilleBusinessMajors/')),
        br(),
        h5(a('Tech Jobs Data Table',    href = 'https://kwlmi.shinyapps.io/shinyJobs/')),
        br(),
        h5(a('Louisville by Industry',  href = ' https://kwlmi.shinyapps.io/louByIndustry/')),
        br(),
        h5(a('Puerto Rico by Industry', href = ' https://kwlmi.shinyapps.io/puertoRicoByIndustry/')),
        br(),
        h5(a('Training Occupations',    href = ' https://kwlmi.shinyapps.io/trainingOccupations/')),
        br()
      ),
      
      tabPanel(
        'Other', 
        h5('Find the', a('MIT Living Wage here', 
                         href = 'http://livingwage.mit.edu/metros/31140'), 
           'we use the measure for a family of two with two children w/o childcare.')
      ),
      
      tabPanel(
        'About Datasets', 
        h1('The datasets...'), 
        h5('American Community Survey'),
        h5('Public Use Microdatasets (PUMS)'),
        h5('Bureau of Labor Statistics'), 
        h5('EMSI Analyst'), 
        h5('Burning Glass'), 
        h5('KCEWS')
      )


  ))))


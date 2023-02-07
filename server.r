# Server

function(input, output) {

  # page 01
  source(
    "./questnnaire_server.r",
    encoding = "utf-8",
    local = TRUE)
  save_data_gsheets <- function(data) {
    sheet_append(
      data = as.data.frame(t(data)),
      ss = "1W01xXWH13ZbcuRVb_1dzP-QztycF0SDtpv8harzfBHM",
      sheet = "Sheet1")
  }
  deposit_percent <- reactive({
    if (input$deposit == "否") {
      "0"
    } else {
      input$deposit_percent
    }
  })
  invest_choices <- reactive({
    if (input$invest == "否") {
      "0"
    } else {
      input$invest_choices
    }
  })
  formData <- reactive({
    data <- data.frame(
      c(as.character(Sys.time()), input$sex, input$age, input$edu,
      input$job, input$blood, input$income, input$expend,
      input$deposit, deposit_percent(), input$invest, invest_choices(),
      input$advice, input$rank_result, input$percent, input$extravagant,
      input$equality, input$shopping_way, input$shop_prefer

      )
    )
  })
  # When the Submit button is clicked, save the form data
  observeEvent(input$SubmitCheck, {
    save_data_gsheets(formData())
  })
  observeEvent(input$SubmitCheck, {
    showModal(modalDialog(
      title = "感謝填答",
      paste("謝謝您的回答，已可關閉網站")
      )
    ) 
  })
  load_data_gsheets <- function() {
    read_sheet(ss = "1W01xXWH13ZbcuRVb_1dzP-QztycF0SDtpv8harzfBHM")
  }
}
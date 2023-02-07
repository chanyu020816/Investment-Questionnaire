observeEvent(input$tku == "否", {
showModal(modalDialog(
    title = "問卷資訊",
    paste("您好，我們是淡江大學統計系二年級的學生：
    此份問卷的目的是想要了解受測者的收入及消費習慣，
    加以分析此問卷的價值以及可靠度，希望您在填寫此問
    卷時能盡力幫我們做答完整，這對我們的研究會非常有
    幫助！")
    )
   )
  }, once = TRUE)
output$income_warn <- renderUI({
  req(input$income)
  if (is.na(as.numeric(input$income))) {
    span("請輸入數字(例如:10000)",
      style = "font-weight: bold; color: red")
  } else if (as.numeric(input$income) %% 1 == 0) {
    ""
  } 
})
output$expend_warn <- renderUI({
  req(input$expend)
  if (is.na(as.numeric(input$expend))) {
    span("請輸入數字(例如:10000)",
         style = "font-weight: bold; color: red")
  } else if (as.numeric(input$expend) %% 1 == 0) {
    ""
  }
})
output$deposit_percent <- renderUI({
  if (input$deposit == "是") {
    sliderInput(
       "deposit_percent", "儲蓄比例",
       min = 0, max = 100,
       value = 0
     )
  } else {
    ""
  }
})
output$shop_warn <- renderUI({
  req(input$shop_prefer)
  if (length(input[["shop_prefer"]]) != 5) {
    span("請選5個",
         style = "font-weight: bold; color: red; font-size: 18px")
  } else {
    ""
  }
})
output$warn <- renderUI({
  req(input$rank_result)
  if (length(input$rank_result) != 3) {
    span("請選3個",
        style = "font-weight: bold; color: red; font-size: 18px")
  } else {
    ""
  }
})
output$invest_result <- renderUI({
  if (input$invest == "是") {
    pickerInput(
      inputId = "invest_choices",
      "投資",
      choices = c("股票", "資金", "定存", "期貨", "債券", "外幣", "其他"),
      multiple = TRUE,
      selected = "股票"
    )
  } else {
    ""
  }
})
output$submitbutton <- renderUI({
  if (length(input[["shop_prefer"]]) == 5 & length(input$rank_result) == 3 &
      !is.na(as.numeric(input$income)) & !is.na(as.numeric(input$expend))) {
    actionButton("SubmitCheck", "Submit")
  } else {
    span("仍有題目並未作答完整或有錯誤",
         style = "font-weight: bold; color: red; font-size:18px")
  }
})
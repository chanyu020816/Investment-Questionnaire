# UI
 
dashboardPage(
  # 標題
  dashboardHeader(
    title = span("大學生收入與投資消費習慣調查", style = "font-weight: bold; font-size:30px")
  ),
  # 側邊選單
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        "問卷調查",
        tabName = "questnaire",
        icon = icon(name = "user-edit", lib = "font-awesome")
      )
    ),
    skin = "light",
    minified = FALSE
  ),
  # 主要頁面
  dashboardBody(
    tabItems(
      source("./questnnaire_ui.r", encoding = "utf-8", local = TRUE)$value
    )
  )
)
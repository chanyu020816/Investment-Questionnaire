# 問卷分頁
tabItem(
 tabName = "questnaire",
 fluidRow(
   box(
     # 基本資料問卷部份
     title = span("基本資料", style = "font-weight: bold; font-size: 20px"),
     width = 12,
     headerBorder = FALSE,
     icon = icon("address-card"),
     radioGroupButtons(
       inputId = "sex",
       label = "性別",
       choices = c("女", "男", "其他"),
       justified = TRUE,
       checkIcon = list(
         yes = icon("ok", lib = "glyphicon"))
     ),
     sliderInput(
       "age", "年齡",
       min = 15, max = 100,
       value = 20
     ),
     selectInput(
       "edu", "學歷",
       choices = c("國中以下", "高中(職)", "大專院校", "碩士", "博士")
     ),
     selectInput(
       "job", "職業",
       choices = c("學生", "商業", "工業", "科技業", "服務業", "運輸業", "軍公教人員", "醫療產業")
     ),
     radioGroupButtons(
       "blood", "血型",
       choices = c("A", "B", "AB", "O"),
       justified = TRUE,
       checkIcon = list(
         yes = icon("ok", lib = "glyphicon"))
     ),
     textInput(
       "income", "月平均收入(含生活費、薪資、投資等)"
     ),
     uiOutput("income_warn"),
     textInput(
       "expend", "月平均支出"
     ),
     uiOutput("expend_warn"),
     radioButtons(
       "deposit", "是否有儲蓄行為",
       choices = c("是", "否")
     ),
     uiOutput("deposit_percent")
   ),
   box(
     title = span("投資調查", style = "font-weight: bold; font-size: 20px"),
     width = 12,
     headerBorder = FALSE,
     icon = icon("address-card"),
     radioButtons(
       "invest", "是否有投資行為",
       choices = c("是", "否"),
       selected = "是"
     ),
     uiOutput("invest_result"),
     radioButtons(
       "advice",  "假設投資時，是否會參考別人的方式進而影響自己行為",
       choices = c("是", "否"),
       selected = "是"
     ),
     bucket_list(
        header = "根據上述投資種類，你覺得哪種標的物的投資報酬率最高？（選前三個最好的）",
        group_name = "bucket_list_group",
        orientation = "horizontal",
        add_rank_list(
          text = "請將選擇結果按順序拖曳至右方",
          labels = list("股票", "資金", "定存", "期貨", "債券", "外幣", "其他"),
          input_id = "rank_choices"
        ),
        add_rank_list(
          text = "須按所認為之順序高低 （選前三個最好的）",
          labels = NULL,
          input_id = "rank_result"
        )
     ),
     column(12, align = "right", id = "button",
            uiOutput("warn")),
     sliderInput(
       "percent", "當你有個想買的商品，但在預算有限的情況下，當物品超過你總預算的百分之多少後你將不願意購買此商品？",
       min = 0, max = 100,
       value = 0
     ),
     radioButtons(
       "extravagant", "是否會購買不必要的商品(如奢侈品)",
       choices = c("是", "否")
     ),
     radioButtons(
       "equality", "是否注重性價比",
       choices = c("是", "否")
     ),
     radioButtons(
       "shopping_way", "偏好網路購物或是實體店面購物",
       choices = c("網路購物", "實體店面購物")
     ),
     uiOutput("shop_warn"),
     awesomeCheckboxGroup(
      "shop_prefer", "在購物中，你較常消費過哪些種類的商品?(至多選5項)",
      choices = c("生活家電",	"3C電子",	"家寢修繕", "服飾","鞋包配飾",
                  "美妝用品", "食品保健", "戶外旅遊", "圖書影音",
                  "娛樂收藏", "文創商品", "其他")
     ),
     column(12, align = "right", id = "button",
             uiOutput("submitbutton"))
   )
 )
)
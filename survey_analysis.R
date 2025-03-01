
# some basic colors to assist with the graphs
--salem: '#04943b';
--crimson: '#cb152b';
--ripe-lemon: '#f7cb0b';
--black: '#040404';
--verdigris: '#665d38';
--gray: '#848484';
--boulder: '#7c7c7c';
--mine-shaft: '#3c3c3c';
--cannon-black: '#2d2407';
--mine-shaft: '#2c2c2c';








df2 %>% group_by(gender) %>% tally() 



df2 %>% map(~janitor::tabyl(., gender, nationality))


df2 %>% group_by(nationality) %>% tally() |> 
  ggpubr::ggpie('n', label = 'nationality', 
                fill = 'nationality',
                color = "white",
                palette = c('#04943b', "#E7B800", '#cb152b',
                            '#7c7c7c', '#665d38',
                            "#00AFBB") )





df2 |>  
  select(20) |> 
  setNames('Q20') |> 
  mutate(Q20 = as.factor(Q20)) |> 
  group_by(Q20) %>% tally() |> 
  drop_na() |> 
  mutate(all = sum(n)) |> 
  mutate(percentage = (n/all)*100) 




df2 |>  
  select(12) |> 
  setNames('Q12') |> 
  mutate(Q12 = as.factor(Q12)) |> 
  group_by(Q12) %>% tally() |> 
  drop_na() |> 
  mutate(all = sum(n)) |> 
  mutate(percentage = n/all) |> 
  mutate(percentage1= paste(Q12, scales::percent(percentage))) |> 
  ggpubr::ggpie('percentage', 
                label = 'percentage1', 
                fill = 'Q12',
                color = "white",
                palette = c('#04943b', "#E7B800", '#cb152b',
                            '#7c7c7c', '#665d38',
                            "#00AFBB") ,
                lab.pos = "in", lab.font = "white")


# compute frequency of sectors
df2 |>  
  select(12) |> 
  setNames('Q12') |> 
  mutate(Q12 = as.factor(Q12)) |> 
  group_by(Q12) |> 
  
  summarise(n = n()) %>%
  mutate(freq = n / sum(n))


with(df2, frequency(age, ord = 'desc'))
table(df2$gender, df2$age)

mytable <- xtabs(~age+gender, data=df2)
ftable(mytable) # print table
summary(mytable) # chi-square test of independence

df2 %>%
  tabyl(gender, age) %>% 
  adorn_totals(where = c("row","col"))
adorn_totals(where = "row")



kable(df2 %>%
        tabyl(gender, age) %>% 
        adorn_totals("col") %>%
        adorn_percentages("row") %>%
        adorn_pct_formatting(digits = 2) %>%
        adorn_ns() %>%
        adorn_title())
df2 |> ncol()
df2 |> dim()








df3 |>  
  select(Q17) |> 
  group_by(Q17) |> 
  summarise(n = n()) %>%
  mutate(freq = n / sum(n))



sjPlot::sjt.xtab(var.row = df3$Q3, 
                 var.col = df3$Q17, 
                 title = "Relationship between Gender and Expenditure", 
                 show.row.prc = TRUE)


sjPlot::sjt.xtab(var.row = df3$Q12, 
                 var.col = df3$Q13, 
                 title = "Relationship between Gender and Expenditure", 
                 show.row.prc = TRUE)


sjPlot::plot_xtab(df3$Q3,df3$Q17,
                  margin = 'row',
                  bar.pos = "stack", 
                  coord.flip = TRUE) +
  theme_minimal()

sjPlot::plot_xtab(df3$Q3,df3$Q12,
                  margin = 'row',
                  bar.pos = "stack", 
                  coord.flip = TRUE) +
  theme_minimal()


df3 %>%
  group_by(Q3, Q12) %>%
  summarise(n = n()) %>%
  mutate(freq = n / sum(n))



summarytools::ctable(df3$Q3,df3$Q12)

df3 |>
  tbl_cross(row = Q3, col = Q12, percent = "cell") |>
  add_p() |>
  bold_labels()
  ggpubr::ggpie('n', label = 'Q13', 
                fill = 'Q13',
                color = "white",
                palette = c('#04943b', "#E7B800",      '#cb152b',
                            '#7c7c7c', '#665d38',
                            "#00AFBB") )

  
  dplyr::tally()
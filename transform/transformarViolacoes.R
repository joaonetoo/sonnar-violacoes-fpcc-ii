library(tidyverse)

code_smells <- read_csv("data/code_smells.csv")
bad_practices <- read_csv("data/bad_practices.csv")


code_smells <- code_smells %>% gather(violation_subtype, count, -c(name))

bad_practices <- bad_practices %>% gather(violation_subtype, count, -c(name))


violacoes_concatenadas = bind_rows(
    `code_smells` = code_smells,
    `bad_practices` = bad_practices,
    .id = "violation"
)


violacoes_concatenadas %>%
    write_csv(here::here("data/violacoes.csv"))

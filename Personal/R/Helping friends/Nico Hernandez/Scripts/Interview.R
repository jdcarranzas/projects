# install.package(FinancialMath) # nolint
# install.package(tidyverse) # nolint 

Churn  <- read_csv("Churn_Probability.csv")
P_Data <- read_csv("Personal_Data.csv")
Payments <- read_csv("Payments.csv")
Credits <- read_csv("Credits.csv")

# First, we load our csv's to the environment to start working with them. All of these are available in this git repository. # nolint

check_interest <- function(Inter, Perio, CuotaPagada, SaldoInicial){
  """
  Inter: Real interest rate of the credit
  Perio: Number of periods already paid by the client
  CuotaPagada: Annuality payed for the client
  SaldoInicial: Disbursement from the bank

  This function uses these arguments for making an amortisation table for each credit, and making the sum of the interests already # nolint
  paid for the client. This is used for checking if the client has already paid the profit for the bank. # nolint
  """
  Saldo = c(SaldoInicial) 
  Interes = numeric()
  Abono = numeric()
  for (i in 0:Perio) {
    Interes[i+1] = Saldo[i+1] * Inter/12
    Saldo[i+2] = SaldoInicial - (CuotaPagada - Interes)*i
  }
  return(sum(Interes[-1]))
}

Final_base <- Credits %>%
              inner_join(Payments, by = "Documento del cliente") %>%
              inner_join(P_Data, by = "Documento del cliente") %>% #We join the complete data into one big table.
              filter(Madurez <= 0.4) %>% # Filtering the "Madurez" for checking the perform of the recient credits
              mutate(Annos = round(Plazo/12, 0), # Converting the total amount of time into years
                     ValorFuturo = `Valor del desembolso`*(1+`Tasa Efectiva Anual`)^Annos, # Converting the initial money into future value
                     InteresesPagados = pmap_dbl(list(`Tasa Efectiva Anual`, `Cuotas ya pagadas`, 
                                                  Cuota, `Valor del desembolso`), check_interest)) # Aplying the function to those columns
# install.package(FinancialMath)
# install.package(tidyverse)

Churn  <- read_csv("Churn_Probability.csv")
P_Data <- read_csv("Personal_Data.csv")
Payments <- read_csv("Payments.csv")
Credits <- read_csv("Credits.csv")

# First, we load our csv's to the environment to start working with them. All of these are available in this git repository.

AmortizarIntereses <- function(Inter, Perio, CuotaPagada, SaldoInicial){
  Saldo = c(SaldoInicial)
  Interes = numeric()
  Abono = numeric()
  for (i in 0:Perio) {
    Interes[i+1] = Saldo[i+1] * Inter/12
    Saldo[i+2] = SaldoInicial - (CuotaPagada - Interes)*i
  }
  return(sum(Interes[-1]))
}

BaseFinal <- CredVi %>%
              inner_join(Cuotas, by = "Documento del cliente") %>%
              inner_join(DatosP, by = "Documento del cliente") %>%
              filter(Madurez <= 0.4) %>%
              mutate(Annos = round(Plazo/12, 0),
                     ValorFuturo = `Valor del desembolso`*(1+`Tasa Efectiva Anual`)^Annos,
                     InteresesPagados = pmap_dbl(list(`Tasa Efectiva Anual`, `Cuotas ya pagadas`, 
                                                  Cuota, `Valor del desembolso`), AmortizarIntereses))
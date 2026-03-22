# Librería externa para el renderizado visual
library(ggplot2)

# --- PASO 1: Creación de la función ---
analizar_proteina <- function(secuencia, tamano_ventana = 7) {
  
  # Estructura de datos: Diccionario K-D
  escala_kd <- c(
    I = 4.5, V = 4.2, L = 3.8, F = 2.8, C = 2.5, 
    M = 1.9, A = 1.8, G = -0.4, T = -0.7, S = -0.8, 
    W = -0.9, Y = -1.3, P = -1.6, H = -3.2, E = -3.5, 
    Q = -3.5, D = -3.5, N = -3.5, K = -3.9, R = -4.5
  )
  
  # PASO 2: Manejo de Strings y Ruido
  # Limpieza de espacios y formateo
  secuencia_limpia <- gsub("[[:space:]]", "", secuencia)
  secuencia_limpia <- toupper(secuencia_limpia)
  
  # Tokenización
  letras_individuales <- strsplit(secuencia_limpia, split = "")[[1]]
  
  # Cuantificación matemática del ruido biológico
  aminoacidos_validos <- sum(letras_individuales %in% names(escala_kd))
  total_caracteres <- length(letras_individuales)
  porcentaje_ruido <- round(((total_caracteres - aminoacidos_validos) / total_caracteres) * 100, 2)
  
  #  PASO 3: El Motor ---
  numero_de_ventanas <- total_caracteres - tamano_ventana + 1
  resultados_hidro <- numeric(numero_de_ventanas)
  
  # Bucle for para la ventana deslizante
  for(i in 1:numero_de_ventanas) {
    pedacito <- letras_individuales[i:(i + tamano_ventana - 1)]
    valores_numericos <- escala_kd[pedacito]
    
    # if/else para manejo de errores 
    if(all(is.na(valores_numericos))) {
      resultados_hidro[i] <- 0 
    } else {
      resultados_hidro[i] <- mean(valores_numericos, na.rm = TRUE)
    }
  }
  
  # PASO 4: Estructuración de Datos 
  # Posicion numérica para la gráfica, y añadimos Region_Diana para la tabla
  tabla_resultados <- data.frame(
    Posicion = 1:numero_de_ventanas,
    Region_Diana = paste(1:numero_de_ventanas, "a", (1:numero_de_ventanas) + tamano_ventana - 1),
    Hidrofobicidad = round(resultados_hidro, 2)
  )
  
  # Ordenamos para extraer las dianas termodinámicamente viables
  mejores_dianas <- head(tabla_resultados[order(tabla_resultados$Hidrofobicidad), ], 3)
  
  # Para imprimir en consola de forma más limpia, quitamos la columna Posicion de este subset
  reporte_dianas <- mejores_dianas[, c("Region_Diana", "Hidrofobicidad")]
  
  # PASO 5: Visualización con ggplot2
  # gradiente de color continuo
  grafica <- ggplot(tabla_resultados, aes(x = Posicion, y = Hidrofobicidad, color = Hidrofobicidad)) +
    geom_line(aes(group = 1), size = 1.2) + 
    scale_color_gradient2(low = "#2166ac", mid = "#f7f7f7", high = "#b2182b", 
                          midpoint = 0, name = "Índice K-D") +
    geom_hline(yintercept = 0, color = "black", linetype = "dashed", alpha = 0.5) +
    theme_minimal() +
    labs(
      title = "Perfil Termodinámico de la Enzima SIRT1",
      subtitle = paste("Filtro paramétrico n =", tamano_ventana),
      x = "Coordenadas (Inicio de ventana)",
      y = "Índice (Kyte-Doolittle)"
    )
  
  dev.new() 
  print(grafica)
  
  #  Datos de Salida en la consola
  cat("\n==================================================\n")
  cat("     REPORTE\n")
  cat("==================================================\n")
  cat(sprintf("-> Control de Calidad: %s%% de ruido biológico detectado.\n", porcentaje_ruido))
  cat("-> Regiones de las 3 mejores dianas para edición:\n\n")
  print(reporte_dianas, row.names = FALSE)
  cat("==================================================\n\n")
}

# --- PRUEBA FINAL ---
mi_gen_sirt1 <- "MADEAALALQPGGSPSAAGADREAASSPAGEPLRKRPRRDGPGLERSPGEPGGAAPEREVPAAARGCPGAAAAALWREAEAEAAAAGGEQEAQATAAAGEGDNGPGLQGPSREPPLADNLYDEDDDDEGEEEEEAAAAAIGYRDNLLFGDEIITNGFHSCESDEEDRASHASSSDWTPRPRIGPYTFVQQHLMIGTDPRTILKDLLPETIPPPELDDMTLWQIVINILSEPPKRKKRKDINTIEDAVKLLQECKKIIVLTGAGVSVSCGIPDFRSRDGIYARLAVDFPDLPDPQAMFDIEYFRKDPRPFFKFAKEIYPGQFQPSLCHKFIALSDKEGKLLRNYTQNIDTLEQVAGIQRIIQCHGSFATASCLICKYKVDCEAVRGDIFNQVVPRCPRCPADEPLAIMKPEIVFFGENLPEQFHRAMKYDKDEVDLLIVIGSSLKVRPVALIPSSIPHEVPQILINREPLPHLHFDVELLGDCDVIINELCHRLGGEYAKLCCNPVKLSEITEKPPRTQKELAYLSELPPTPLHVSEDSSSPERTSPPDSSVIVTLLDQAAKSNDDLDVSESKGCMEEKPQEVQTSRNVESIAEQMENPDLKNVGSSTGEKNERTSVAGTVRKCWPNRVAKEQISRRLDGNQYLFLPPNRYIFHGAEVYSDSEDDVLSSSSCGSNSDSGTCQSPSLEEPMEDESEIEEFYNGLEDEPDVPERAGGAGFGTDGDDQEAINEAISVKQEVTDMNYPSNKS"

analizar_proteina(secuencia = mi_gen_sirt1, tamano_ventana = 7)
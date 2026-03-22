#  Pipeline de Normalización y Visualización de Perfiles Metabólicos

## Descripción:
Este proyecto consiste en un pipeline de **Prueba de Concepto (PoC)** desarrollado en Python para el procesamiento, limpieza, normalización y visualización de datos de metabolómica dirigida (LC-MS). 

La herramienta está diseñada para recibir matrices de abundancia, filtrar los metabolitos más representativos, calcular la abundancia relativa por fila y generar mapas de calor (*Heatmaps*) listos para su interpretación biológica.

*Nota de Transparencia: Para demostrar la arquitectura del código y la generación gráfica, este script extrae el diccionario de anotaciones reales (identificación de metabolitos) del estudio público **MTBLS13498** (MetaboLights) e inyecta una matriz de abundancia simulada para grupos experimentales (Control vs. Tratamiento). El pipeline está estructurado y listo para procesar matrices de abundancia reales en cuanto sean proveídas por el espectrómetro.*

## Se utilizó:
* **Lenguaje:** Python 3
* **Manipulación de Datos:** `pandas`, `numpy`
* **Visualización:** `seaborn`, `matplotlib`
* **Entorno:** Jupyter Notebook

## ⚙️ Funcionalidades del Script
1. **Limpieza de Datos:** Imputación de valores nulos y estructuración de índices utilizando los identificadores de bases de datos metabólicas.
2. **Filtrado:** Selección automatizada de los Top 25 metabolitos con mayor abundancia promedio.
3. **Normalización:** Cálculo de abundancia relativa iterando sobre el valor máximo de cada metabolito para permitir la comparación visual entre muestras.
4. **Visualización:** Generación de un Heatmap con paleta de alto contraste, exportable en alta resolución (300 dpi).

## 📊 Resultado Visual
![Perfil Metabólico](heatmap_metabolomica_final.png)

## 🚀 Cómo ejecutarlo localmente
1. Clona este repositorio.
2. Asegúrate de tener instaladas las librerías requeridas (`pip install pandas numpy seaborn matplotlib`).
3. Ejecuta el archivo `.ipynb` en tu entorno de Jupyter o súbelo a Google Colab.

* **Estudio:** [MTBLS13498: Metabolic profiling reveals CAD as a central metabolic signaling node](https://www.ebi.ac.uk/metabolights/editor/MTBLS13498/files)
* **Autores principales:** Pinghui Feng, Chao Qin.

# Filtro de Imágenes con OpenMP

Este proyecto implementa la carga, procesamiento y guardado de imágenes aplicando un filtro de Sobel en paralelo usando **OpenMP**. Se evalúa el rendimiento de las versiones secuencial y paralela con distintos números de hilos en un procesador **Intel(R) Core(TM) i7-9700**.

## Información del equipo


Architecture:            x86_64
  CPU op-mode(s):        32-bit, 64-bit
  Address sizes:         39 bits physical, 48 bits virtual
  Byte Order:            Little Endian
CPU(s):                  8
  On-line CPU(s) list:   0-7
Vendor ID:               GenuineIntel
  Model name:            Intel(R) Core(TM) i7-9700 CPU @ 3.00GHz
    CPU family:          6
    Model:               158
    Thread(s) per core:  1
    Core(s) per socket:  8
    Socket(s):           1
    Stepping:            13
    BogoMIPS:            5999.99

## Resultados de la ejecución

### Ejecución secuencial

```bash
EJECUCIÓN SECUENCIAL
8,674 s
8,652 s
8,619 s
8,783 s (X)
9,058 s (X)
PROMEDIO: 8,703 s
```

La ejecución secuencial de la aplicación tiene un promedio de **8,703 segundos**. Las ejecuciones marcadas con una **X** fueron descartadas por presentar valores atípicos.

### Ejecución paralela (8 hilos)

```bash
EJECUCIÓN PARALELA (OMP_NUM_THREADS=8)
9,883 s (X)
10,325 s (X)
10,274 s
10,221 s
10,190 s
PROMEDIO: 10,228 s
```

La ejecución paralela con **8 hilos** muestra un promedio de **10,228 segundos**. Los valores atípicos también fueron descartados en este caso.

### Ejecución paralela (16 hilos)

```bash
EJECUCIÓN PARALELA (OMP_NUM_THREADS=16)
9,053 s (X)
8,978 s
8,881 s
8,692 s
8,667 s (X)
PROMEDIO: 8,850 s
```

La ejecución paralela con **16 hilos** tiene un promedio de **8,850 segundos**, con algunos valores descartados.

## Speedup

El **speedup** compara el tiempo de la versión secuencial con el tiempo de la versión paralela, calculado como:

\[	Speeduo = Secuencial / Paralelo
\]

### Speedup con 8 hilos

\[	Speedup = 8,703/10,228 = 0.8509
\]

### Speedup con 16 hilos

\[	Speedup = 8,703/8,850 = 0.9834
\]

## Comentarios sobre los resultados

1. **Ejecución secuencial**: El tiempo promedio fue de **8,703 segundos**, lo que sirve como referencia para evaluar las versiones paralelas.

2. **Ejecución paralela con 8 hilos**: El tiempo promedio fue de **10,228 segundos**, mayor que la ejecución secuencial. Esto resulta en un **speedup de 0.8509**, lo que indica que la paralelización en este caso no trajo mejoras en rendimiento. Este resultado puede deberse a la sobrecarga de la gestión de hilos o a que el algoritmo no escala bien con este nivel de paralelización.

3. **Ejecución paralela con 16 hilos**: El tiempo promedio fue de **8,850 segundos**, más cercano al tiempo de la versión secuencial. El **speedup de 0.9834** es cercano a 1, lo que sugiere que con **16 hilos** no se logra un beneficio significativo de paralelización. Aumentar el número de hilos no necesariamente mejora el rendimiento si el trabajo paralelo es limitado o si se introduce sobrecarga adicional.

4. **Conclusión**: En este caso, la paralelización no mejoró los tiempos de ejecución y, de hecho, los empeoró en algunos casos. Esto puede deberse a la sobrecarga en la creación y sincronización de hilos, o a la limitada parte del código que realmente puede ser paralelizada de manera eficiente en este caso.

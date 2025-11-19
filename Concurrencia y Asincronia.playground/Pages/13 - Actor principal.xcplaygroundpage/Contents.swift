import Foundation

// El actor principal es un modificador llamado @MainActor que garantiza el acceso seguro al hilo principal.
// También permite inyectar cualquier dependencia desde otro contexto de ejecución directamente al hilo principal, con control de cualquier data race.
// ¡Nunca más DispatchQueue. main. async! Es la API de GCD. Ahora se marca el dominio de aislamiento en la cabecera de un closure que se pasa como parámetro a un Task o cualquier otro método.
// Nos permite trabajar con seguridad contra el hilo principal y, por añadido, contra la Ul de la app, ya que serializa todos los procesos y datos.
// Pero no podemos abusar de él porque si todo está en el @MainActor, significa que procesos de alta carga para la CU pueden bloquear la Ul de la app.
// El uso de URLSession está aislado como proceso asincrono y @concurrent.
// El 80% de nuestra app (puede que incluso más) trabajará siempre en
// @MainActor y no debería suponer problema de rendimiento. Por eso Swift 6.2 ofrece este modo de trabajo de aislar todo por defecto al @MainActor.
// Pero con cuidado y conociendo muy bien cómo funciona nuestra app.

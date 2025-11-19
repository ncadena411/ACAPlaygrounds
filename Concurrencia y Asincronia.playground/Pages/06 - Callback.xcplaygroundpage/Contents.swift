import Foundation

// El patrón callback siempre que sea de tipo @escaping, nos permite procesar la respuesta de un proceso asincrono.
// La llamada asincrona (invocación) se hará normalmente desde el hilo principal, y la función @escaping recibida por la invocación se usará para guardar qué ha de hacerse cuando el proceso acabe.
// Podemos usar este patrón con la librería nativa URLSession.
// El closure que deberos poner como callback a la llamada recibirá como parámetros siempre tres datos:
// El primero de ellos es un array de bytes con la respuesta en bruto en un Data.
// Luego un URLResponse con la respuesta del servidor.
// Y un Error con el posible que pudiera haber tenido.

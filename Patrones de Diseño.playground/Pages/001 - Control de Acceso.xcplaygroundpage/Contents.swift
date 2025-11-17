//Control de acceso

//OPEN: igual que public pero permite el override en herencia en orientacion a objetos
//PUBLIC: Expone los componentes fuera del ambito del ejecutable siendo visible para otros ejecutables (targets) los elementos expuestos. NO PERMITE override en herencia enn orientacion a objetos
//(LIBRARY): Si en la libreria A uso la libreria B, este control permitira que los componentes A sean visibles en B, pero no a la app que use las librerias.
//INTERNAL: El acceso por defecto. Permite que dentro del ambito del ejecutable que estemos creando, cualquier es visible sea cual sea su fichero
//FILE PRIVATE: Impide que el elemento sea visible fuera del fichero que lo contiene. Sera privado, solo fuera del fichero
// PRIVATE: Oculta fuera del ambito del elemento, a dicho elemento

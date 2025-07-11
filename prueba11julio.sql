create database pruebaBD;
use pruebaBD;

create table Clientes (
    cod_cliente int primary key,
    nombre_cliente varchar(20) not null,
    tel_cliente int not null,
    direccion_cliente varchar(50) not null,
    historial_compras varchar(200) not null);

create table Proveedores(
    cod_proveedor int primary key,
    suministros_disp numeric primary key,
    direccion_proveedor varchar(100) not null,
    pedidos_info varchar(100) not null);

create table Inventario_y_repuestos(
    bicicletas_disp numeric primary key,
    repuestos_disp numeric primary key,
    accesorios numeric primary key);

create table Ventas_y_Compras(
    num_registro int primary key,
    nombre_producto varchar(50) not null,
    analisis_venta varchar(100) not null);

create table Clientes_Proveedores(
    cod_cliente int,
    cod_proveedor int,
    primary key (cod_cliente, cod_proveedor),
    foreign key (cod_cliente) references Clientes(cod_cliente),
    foreign key (cod_proveedor) references Proveedores(cod_proveedor));

create table Proveedores_Inventario(
    suministros_disp numeric,
    bicicletas_disp numeric,
    repuestos_disp numeric,
    accesorios numeric,
    primary key (suministros_disp, bicicletas_disp, repuestos_disp, accesorios ),
    foreign key (suministros_disp) references Proveedores(suministros_disp),
    foreign key (bicicletas_disp) references Inventario_y_repuestos(bicicletas_disp),
    foreign key (repuestos_disp) references Inventario_y_repuestos(repuestos_disp),
    foreign key (accesorios) references Inventario_y_repuestos(accesorios));

create table Proveedores_Ventas(
    cod_proveedor int,
    num_registro int,
    primary key (cod_proveedor, num_registro),
    foreign key (cod_proveedor) references Proveedores(cod_proveedor),
    foreign key(num_registro) references Ventas_y_Compras(num_registro));
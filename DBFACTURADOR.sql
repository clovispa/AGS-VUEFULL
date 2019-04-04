use master

go 


if not exists (select 1 from sys.databases where name='Facturador')
  begin
		   create database Facturador
  end
go

use Facturador

go

if not exists (select 1 from sys.tables where name='ResolucionFacturacion')
	begin 
			create table ResolucionFacturacion(

			            	Iden                        Numeric(20,0)       identity
						,	Codigo						Varchar(50)		    not null 
						,	NoResolucion				Varchar(50)		    not null
						,	FechaResolucion				SmallDateTime		not null 
						,	FechaInicio					SmallDateTime		not null 
						,	FechaFinal	    			SmallDateTime		not null
						,	Prefijo						Varchar(50)			not null
						,	RangoInicialLegal			Numeric(20,0)	    not null
						,	RangoFinalLegal				Numeric(20,0)	    not null
						,	RangoInicialInterno			Numeric(20,0)		not null
						,	RangoFinalInterno			Numeric(20,0)		not null
						,	ResolucionTexto				Varchar(2000)		not null
						,	ValidaDiasAlertVigencia		Bit         		not null
						,	DiasAlertVigencia			int     			not null
						,	ValidDiasAlertDcto			Bit					not null
						,	DiasAlertDcto				Int     			not null
			)
	end

go

if not exists (select 1 from sys.tables where name = 'ItemsFacturacion')
	begin
			create table ItemsFacturacion (

							Iden						Numeric (20,0)		Identity
						,	Codigo					    Varchar (25)	    Unique  
						,	Nombre						Varchar (50)		not null
						,	DiasVencimiento			    Int					not null
						,	Tipo						Int					not null
						,	Cantidad					Int					not null
						,	Valor						Numeric (20,2)		not null
						,	IndicadorManejaDescuento    Bit					not null
						,	PorcentajeDescuento			Money				not null
						,	IndicadorManejaIva			Bit					not null
						,	PorcentajeIva			    Money				not null 
						,	DetalleEnFactura			Varchar (500)		not null 
						,	Naturaleza					Bit					not null 
						,	Habilitar					Bit					not null
			)
end 

go

 if not exists  ( select 1 from sys.tables where  name = 'CabeceraFactura') 
	begin 
			create table CabeceraFactura (

                            Iden						Numeric (20,0)		 Identity
						,	Consecutivo_Fac				Numeric  (20,0)	     not null
						,	Tipo						Int					 not null
						,	Fecha						SmallDatetime		 not null
						,	Iden_Cliente				Numeric (20,0)		 not null
					    ,	FormaPago					Int					 not null
						,	ValorConceptos				Numeric (20,2)		 not null
						,	ValorDescuento				Numeric (20,2)		 not null
						,	ValorIva					Numeric (20,2)		 not null
						,	Observacion					Varchar (500)        not null
						,	Iden_Usuario				Numeric (20,0)       not null
						,	MontoLetras					Varchar (4000)       not null
						,	TasaCambio					Money		         not null
						,	Iden_Resolu					Numeric (20,0)       not null
						,	Cod_PrefijoConse			Numeric (20,0)       not null
						,	Iden_Vendedor				Numeric (20,0)		 not null
			)
    end
go



  if not exists ( select 1 from sys.tables where name = 'DetalleFactura')
	  begin
			 create table DetalleFactura(

							IdCabecera				    Numeric (20, 0)		  not null
						 ,	IdenItemFacturacion			Numeric (20, 0)       not null
						 ,	Cantidad					Int			          not null
						 ,	ValorUnitario			    Numeric (20, 2)       not null
						 ,	SubTotal					Numeric (20, 2)       not null
						 ,	ValorDescuento				Numeric (20, 2)       not null
						 ,	ValorIva				    Numeric (20, 2)       not null
						 ,	Total					    Numeric (20, 2)       not null

			)
	 end
go

if not exists (select 1 from sys.tables where name = 'DetallePagoFacturas ')
	 begin 
	     create table DetallePagoFacturas (

							IdCabecera				  Numeric (20 ,0)		not null
						 ,	NoCuota                   Int			        not null
						 ,	Vencimiento               Smalldatetime         not null
						 ,	Valor	                  Numeric (20 ,2)       not null

		  )
	 end 
 go
 

if  not exists(select 1 from sys.tables where name = 'Clientes')
     begin 
			create table Clientes (
			 
			         Iden			numeric		(20, 0)		identity
				   , Nombre		    Varchar		(500)       not null
				   , Apellido		Varchar		(500)       not null
				   , Codigo		    Varchar		(25)        unique not null
				   , Tip_Documento  varchar	    (500)       not null
				   , Num_docum      varchar     (500)       not null
				   , Correo         Varchar     (25)        not null
				   , Direccion      Varchar     (500)       not null
				   , Telefono       Varchar     (500)       not null
				   , Imagen         image
				   , Habilitar		Bit					not null	    
			)
	end 
go

if  not exists(select 1 from sys.tables where name = 'Usuarios')
     begin 
			create table Usuarios (
			 
			         Iden			numeric		(20, 0)		identity
				   , Nombre			Varchar		(50)		not null
				   , Usuario		Varchar		(25)		not null
				   , Contraseña		Varchar		(25)		not null
				   , Perfil			Varchar		(25)		not null
				   , Habilitar		Bit                     not null
			)			
	end 
go

if not exists( select 1 from sys.tables where name = 'Transacciones' )
	begin 
			create table Transacciones (
					
					Codigo			numeric		(20,0)		not null
				   ,Nombre			varchar		(50)		not null
			)
	end
go

if not exists( select 1 from sys.tables where name = 'PrefijoConsecutivo')
	begin
			create table PrefijoConsecutivo (

					Codigo			   numeric     (20,0)   identity 
				   ,Nombre			   varchar		(50)    not null
				   ,CodigoTransaccion  numeric	   (20,0)   not null 
			)
	end 

go


if not exists( select 1 from sys.tables where name = 'Consecutivos')
	begin 
			create table Consecutivos (

					Consecutivo			numeric    (20,0)	 not null
				   ,CodPrefijoConse     numeric	   (20,0)	 identity	
			)
	end
go

if  not exists(select 1 from sys.tables where name = 'Vendedor')
     begin 
			create table Vendedor (
			 
			         Iden			numeric		(20, 0)		identity
				   , Nombre		    Varchar		(500)       not null
				   , Apellido		Varchar		(500)       not null
				   , Codigo		    Varchar		(25)        unique not null
				   , Tip_Documento  varchar	    (500)       not null
				   , Num_docum      varchar     (500)       not null
				   , Correo         Varchar     (25)        not null
				   , Direccion      Varchar     (500)       not null
				   , Telefono       Varchar     (500)       not null
				   , Imagen         image
				   , Habilitar		Bit					not null	    
			)
	end 
go

if not exists ( select 1 from sys.tables where name = 'Inventario')
	begin 
			create table Inventario (
					
					Cod_ItemFacturacion  varchar  (25)   not null
				  , Cantidad			 numeric  (20,2) not null
				  , Localizacion		 varchar  (50)   not null
				  , Bodega				 varchar  (50)   not null
				  , ValorCosto			 numeric  (20,2) not null
				  , ValorVenta			 numeric  (20,2) not null
				  , StockMinimo			 numeric  (20,0) not null	
			)
	end
go

if not exists(select 1 from sys.tables where name = 'Proveedores')
begin 
		create table Proveedores(
				Iden				Numeric      (18,0) identity
			  , Codigo				Varchar      (25)   not null
			  , Nombre				Varchar      (500)  not null
			  , Tipo_Doc			Varchar      (50)   not null
			  , Numero_Doc			Varchar      (500)  not null
			  , Telefono			Varchar      (20)   not null
			  , Correo				Varchar      (500) 
			  , Direccion			Varchar      (500)  not null
			  , Imagen				image 
			  , Habilitar		    Bit			  not null	
		)
end 
go
if not exists(select 1 from sys.tables where name = 'Menucombo')
begin 
		create table Menucombo(
				
			   Codigo				Varchar      (25)   not null
			  , Cliente				Varchar      (50)   not null
			  , Usuario				Varchar      (50)   not null
			  , Vendedor			Varchar      (50)   not null
			  , Proveedor			Varchar      (50)   not null
			  , Itemsfacturacion	Varchar      (50)   not null

			 
		)
end 
go
if not exists(select 1 from sys.tables where name = 'NumeroFactura')
begin 
    create table NumeroFactura(
        CodPrefijoConse			Numeric       (20,0)  not null
        , Base_Num				Varchar       (25)    not null
        , Separador				Varchar       (10)    not null
        , HabilitarCeros		bit					  not null
        , CantidadCeros			Varchar       (50)    not null
        , HabPrefResolucion		bit					  not null
          
    )
end
go


if not exists (select 1 from Usuarios where Usuario = 'Admin')
begin 
	INSERT INTO Usuarios VALUES ('Administrador','Admin','shkvX8cYtOc=','Admin','0')
end
go

if not exists ( select 1 from  Transacciones )
	begin 
		INSERT INTO Transacciones
		VALUES (1, 'Ventas'), (2, 'Compra'), (3, 'Devoluciones'), (4, 'Anulaciones'), (5, 'Cotizaciones')	
	end
go

if not exists ( select 1 from PrefijoConsecutivo )
	begin
		INSERT INTO PrefijoConsecutivo (Nombre,CodigoTransaccion)
		VALUES ('VEN',1), ( 'COM', 2), ( 'DEV',3), ( 'ANU',4), ('COT',5)
	end 
go
if not exists ( select 1 from Consecutivos )
	begin
		INSERT INTO Consecutivos (Consecutivo)
		VALUES (0), (0), (0), (0), (0)
	end 
go
select *  from Menucombo
if not exists ( select 1 from Menucombo )
	begin
		INSERT INTO Menucombo (Codigo,Cliente,Usuario,Vendedor,Proveedor,Itemsfacturacion)
		VALUES  ('001','Nombre','Identificacion','Codigo','Identificacion','Nombre'), ('002','Codigo','Documento','Documento','Nombre','Codigo'),('003','Documento','Nombre','Nombre','Identificion','Fecha')
	end 
go


if not exists ( select 1 from sys.indexes where name ='PK_ResolucionFacturacion_Iden' and is_primary_key = 1  )
	BEGIN 
		ALTER TABLE ResolucionFacturacion ADD CONSTRAINT PK_ResolucionFacturacion_Iden Primary key clustered (Iden ASC)
	end
go
       
if not exists ( select 1 from sys.indexes where name ='PK_ItemsFacturacion_Iden' and is_primary_key = 1  )
	BEGIN 
		ALTER TABLE ItemsFacturacion ADD CONSTRAINT PK_ItemsFacturacion_Iden Primary key clustered (Iden ASC)
	end
go
if not exists ( select 1 from sys.indexes where name ='PK_CabeceraFactura_Iden' and is_primary_key = 1  )
	BEGIN 
		ALTER TABLE CabeceraFactura ADD CONSTRAINT PK_CabeceraFactura_Iden Primary key clustered (Iden ASC)
	end
go
if not exists ( select 1 from sys.indexes where name ='PK_Clientes_Iden' and is_primary_key = 1  )
	BEGIN 
		ALTER TABLE Clientes ADD CONSTRAINT PK_Clientes_Iden Primary key clustered (Iden ASC)
	end
go

if not exists ( select 1 from sys.indexes where name ='PK_Usuarios_Iden' and is_primary_key = 1  )
	BEGIN 
		ALTER TABLE Usuarios ADD CONSTRAINT PK_Usuarios_Iden Primary key clustered (Iden ASC)
	end
go

if not exists ( select 1 from sys.indexes where name = 'PK_Transacciones_Codigo' and is_primary_key = 1 )
	BEGIN 
		ALTER TABLE Transacciones  ADD CONSTRAINT PK_Transacciones_Codigo primary key clustered (Codigo ASC)
	END
GO

if not exists ( select 1 from sys.indexes where name = 'PK_PrefijoConsecutivos_Codigo' and is_primary_key = 1 )
	BEGIN 
		ALTER TABLE PrefijoConsecutivo ADD CONSTRAINT PK_PrefijoConsecutivos_Codigo primary key clustered (Codigo ASC)
	END
GO

if not exists ( select 1 from sys.indexes where name = 'PK_Vendedor_Iden' and is_primary_key = 1)
	BEGIN 
		ALTER TABLE Vendedor ADD CONSTRAINT PK_Vendedor_Iden primary key clustered (Iden ASC)
	END 
GO

if not exists ( select 1 from sys.indexes where name = 'PK_Proveedores_Iden' and is_primary_key = 1)
	BEGIN 
		ALTER TABLE Proveedores ADD CONSTRAINT PK_Proveedores_Iden primary key clustered (Iden ASC)
	END
GO


--LLAVES FORANEAS



if not exists ( select 1 from sys.foreign_keys where name ='FK_DetalleFactura_IdCabecera_CabeceraFactura_Iden'  )
BEGIN 
	ALTER TABLE DetalleFactura ADD CONSTRAINT FK_DetalleFactura_IdCabecera_CabeceraFactura_Iden   FOREIGN KEY (IdCabecera) REFERENCES CabeceraFactura (Iden)
end
go

if not exists ( select 1 from sys.foreign_keys where name ='FK_DetalleFactura_IdenItemFacturacion_ItemsFacturacion_Iden'  )
BEGIN 
	ALTER TABLE DetalleFactura ADD CONSTRAINT FK_DetalleFactura_IdenItemFacturacion_ItemsFacturacion_Iden   FOREIGN KEY (IdenItemFacturacion) REFERENCES ItemsFacturacion (Iden)
end
go

if not exists (select 1 from Sys.foreign_keys where name = 'FK_DetallePagoFacturas_IdCabecera_CabeceraFactura_Iden')
BEGIN 
	ALTER TABLE DetallePagoFacturas ADD CONSTRAINT FK_DetallePagoFacturas_IdCabecera_CabeceraFactura_Iden FOREIGN KEY (IdCabecera) REFERENCES CabeceraFactura(Iden)

END

GO

if not exists (select 1 from sys.foreign_keys where name = 'FK_CabeceraFactura_Iden_Cliente_Clientes_Iden')
BEGIN 
	ALTER TABLE CabeceraFactura ADD CONSTRAINT FK_CabeceraFactura_Iden_Cliente_Clientes_Iden FOREIGN KEY (Iden_Cliente) REFERENCES Clientes (Iden)
END
GO

if not exists (select 1 from sys.foreign_keys where name = 'FK_CabeceraFactura_Iden_Resolu_ResolucionFacturacion_Iden')
BEGIN 
	ALTER TABLE CabeceraFactura ADD CONSTRAINT FK_CabeceraFactura_Iden_Resolu_ResolucionFacturacion_Iden FOREIGN KEY (Iden_Resolu) REFERENCES ResolucionFacturacion(Iden)
END
GO

if not exists ( select 1 from sys.foreign_keys where name = 'FK_CabeceraFactura_Cod_PrefijoConse_PrefijoConsecutivo_Codigo')
	BEGIN
		ALTER TABLE CabeceraFactura ADD CONSTRAINT FK_CabeceraFactura_Cod_PrefijoConse_PrefijoConsecutivo_Codigo FOREIGN KEY (Cod_PrefijoConse) REFERENCES PrefijoConsecutivo (Codigo)
	END 
GO

if not exists (select 1 from sys.foreign_keys where name = 'FK_CabeceraFactura_Iden_usuario_Usuarios_Iden')
BEGIN
	ALTER TABLE CabeceraFactura ADD CONSTRAINT FK_CabeceraFactura_Iden_usuario_Usuarios_Iden FOREIGN KEY (Iden_Usuario) REFERENCES Usuarios (Iden) 
END
GO

if not exists ( select 1 from sys.foreign_keys where name = 'FK_CabeceraFactura_Iden_Vendedor_Vendedor_Iden')
	BEGIN 
		ALTER TABLE CabeceraFactura ADD CONSTRAINT  FK_CabeceraFactura_Iden_Vendedor_Vendedor_Iden FOREIGN KEY (Iden_Vendedor) REFERENCES Vendedor (Iden)
	END
GO

if not exists ( select 1 from sys.foreign_keys where name = 'FK_PrefijoConsecutivo_CodigoTransaccion_Transacciones_Codigo' )
	BEGIN
		ALTER TABLE PrefijoConsecutivo ADD CONSTRAINT FK_PrefijoConsecutivo_CodigoTransaccion_Transacciones_Codigo FOREIGN KEY  (CodigoTransaccion) REFERENCES  Transacciones (Codigo)
	END
GO

if not exists ( select 1 from sys.foreign_keys where name = 'FK_Consecutivos_CodPrefijoConse_PrefijoConsecutivo_Codigo')
	BEGIN
		ALTER TABLE Consecutivos ADD CONSTRAINT FK_Consecutivos_CodPrefijoConse_PrefijoConsecutivo_Codigo FOREIGN KEY  (CodPrefijoConse)  REFERENCES PrefijoConsecutivo (Codigo)
	END
GO

if not exists ( select 1 from sys.foreign_keys where name = 'FK_Inventario_Cod_ItemFacturacion_ItemsFacturacion_Codigo')
	BEGIN
		ALTER TABLE Inventario ADD CONSTRAINT FK_Inventario_Cod_ItemFacturacion_ItemsFacturacion_Codigo FOREIGN KEY (Cod_ItemFacturacion) REFERENCES  ItemsFacturacion (Codigo)
	END
GO

-- AGREGAR COLUMNA NUMERO FACTURA
if not exists (select 1 from INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'NumeroFactura' AND TABLE_NAME = 'CabeceraFactura')

BEGIN
  ALTER TABLE CabeceraFactura ADD NumeroFactura varchar(50)
END



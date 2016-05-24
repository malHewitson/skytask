CREATE TABLE dbo.product(
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  product varchar(36) NOT NULL,
  category varchar(36) NOT NULL,
    location varchar(36) NULL,
  CONSTRAINT product_unq UNIQUE (product) 
  )
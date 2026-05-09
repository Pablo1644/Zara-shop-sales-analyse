ALTER TABLE sales
ALTER COLUMN price DECIMAL(10,2);

UPDATE sales
SET Promotion = 1
WHERE Promotion = 'YES';

UPDATE sales
SET Promotion = 0
WHERE Promotion = 'NO';

ALTER TABLE sales
ALTER COLUMN Promotion BIT;


ALTER TABLE sales
DROP COLUMN brand;

ALTER TABLE sales
DROP COLUMN currency;

UPDATE sales
SET Seasonal = 1
WHERE Seasonal = 'YES';

UPDATE sales
SET Seasonal = 0
WHERE Seasonal = 'NO';

ALTER TABLE sales
ALTER COLUMN Seasonal BIT;

EXEC sp_rename 'sales.price', 'price_usd', 'COLUMN';










